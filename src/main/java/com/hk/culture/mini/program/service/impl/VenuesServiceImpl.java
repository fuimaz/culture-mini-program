package com.hk.culture.mini.program.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.culture.mini.program.common.constant.BookTypeEnum;
import com.hk.culture.mini.program.common.constant.ReturnCodeEnum;
import com.hk.culture.mini.program.common.constant.StateEnum;
import com.hk.culture.mini.program.dto.Result;
import com.hk.culture.mini.program.dto.query.PagesQuery;
import com.hk.culture.mini.program.dto.query.VenuesBookQuery;
import com.hk.culture.mini.program.dto.query.VenuesQuery;
import com.hk.culture.mini.program.entity.Appointment;
import com.hk.culture.mini.program.entity.Venues;
import com.hk.culture.mini.program.entity.Venuesbook;
import com.hk.culture.mini.program.mapping.VenuesMapper;
import com.hk.culture.mini.program.service.AppointmentService;
import com.hk.culture.mini.program.service.VenuesService;
import com.hk.culture.mini.program.service.VenuesbookService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2020-04-11
 */
@Service
@Slf4j
public class VenuesServiceImpl extends ServiceImpl<VenuesMapper, Venues> implements VenuesService {

    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private VenuesbookService venuesbookService;

    /**
     * 条件查询，无条件则返回全部分页数据
     * @param pagesQuery
     * @return
     */
    @Override
    public IPage<Venues> listByCondition(PagesQuery<VenuesQuery> pagesQuery) {
        QueryWrapper<Venues> wrapper = new QueryWrapper();
        VenuesQuery venuesQuery = pagesQuery.getData();
        Page<Venues> page = new Page<>(pagesQuery.getCurrent(), pagesQuery.getPageSize());
        if (StringUtils.isNotEmpty(venuesQuery.getCategory())) {
            wrapper.eq("category", venuesQuery.getCategory());
        }

        if (StringUtils.isNotEmpty(venuesQuery.getState())) {
            wrapper.eq("state", venuesQuery.getState());
        }

        if (StringUtils.isNotEmpty(venuesQuery.getBookDate())
                || StringUtils.isNotEmpty(venuesQuery.getInterval())) {
            Set<String> invalidTids = listByDate(venuesQuery.getBookDate(), page, wrapper, venuesQuery.getInterval());
            if (CollectionUtils.isNotEmpty(invalidTids)) {
                wrapper.notIn("TID", invalidTids);
            }
        }

        IPage<Venues> activityIPage = getBaseMapper().selectPage(page, wrapper);

        return activityIPage;
    }

    /**
     * 查询某个场馆，指定日期的可预约清空
     * @param tid
     * @param date
     * @return
     */
    @Override
    public List<JSONObject> listByTidAndDate(String tid, String date, List<String> intervals) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime dateTime = LocalDateTime.parse(date, formatter);

        List<Venuesbook> venuesbooks = venuesbookService.listByTidAndDate(tid, dateTime, BookTypeEnum.VENUES);
        if (CollectionUtils.isEmpty(venuesbooks)) {
            return null;
        }

        List<JSONObject> resList = new ArrayList<>();
        for (String interval : intervals) {
            String[] split = StringUtils.split(interval, "~");
            if (split.length != 2) {
                log.error("split string size not equal to 2, {}", interval);
                continue;
            }
//            LocalDateTime startTime = LocalDateTime.ofEpochSecond(Long.valueOf(split[0]),0, ZoneOffset.ofHours(8));
            LocalDateTime startTime = LocalDateTime.parse(split[0], formatter);
            for (Venuesbook venuesbook : venuesbooks) {
                if (venuesbook.getStartTime().equals(startTime)) {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("time", interval);
                    jsonObject.put("booked", true);
                    resList.add(jsonObject);
                }
            }
        }

        return resList;
    }

    /**
     * 查询指定日期的可预约清空
     * @param page
     * @param date
     * @return
     */
    public Set<String> listByDate(String date, Page<Venues> page, QueryWrapper<Venues> wrapper, String interval) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime dateTime = LocalDateTime.parse(date, formatter);

        IPage<Venues> activityIPage = getBaseMapper().selectPage(page, wrapper);
        if (CollectionUtils.isEmpty(activityIPage.getRecords())) {
            return null;
        }

        List<String> tids = activityIPage.getRecords().stream()
                .map(venues -> venues.getTid())
                .collect(Collectors.toList());

        // 获取该日期下指定场馆全部的预约记录
        List<Venuesbook> venuesbooks = venuesbookService.listByDate(tids, dateTime, BookTypeEnum.VENUES);
        if (CollectionUtils.isEmpty(venuesbooks)) {
            return null;
        }

        Map<String, Integer> dateCountMap = new HashMap<>();
        // 统计每个场馆预约数
        venuesbooks.stream().forEach(venuesbook -> {
            Integer orDefault = dateCountMap.getOrDefault(venuesbook.getVenuesTid(), 0);
            dateCountMap.put(venuesbook.getVenuesTid(), ++orDefault);
        });

        // 过滤掉预约数小于3的场馆
        Set<String> dateInvalidTidSet = dateCountMap.entrySet().stream()
                .filter(stringIntegerEntry -> stringIntegerEntry.getValue() >= 3)
                .map(stringIntegerEntry -> stringIntegerEntry.getKey())
                .collect(Collectors.toSet());

        // 只查询指定日期的时候返回
        if (StringUtils.isEmpty(interval)) {
            return dateInvalidTidSet;
        }

        String[] split = StringUtils.split(interval, "~");
        if (split.length != 2) {
            log.error("split string size not equal to 2, {}", interval);
            return dateInvalidTidSet;
        }

        LocalDateTime startTime = LocalDateTime.parse(split[0], formatter);
        for (Venuesbook venuesbook : venuesbooks) {
            if (venuesbook.getStartTime().equals(startTime)) {
                // 添加已预约的场馆
                dateInvalidTidSet.add(venuesbook.getVenuesTid());
            }
        }

        return dateInvalidTidSet;
    }

    /**
     * 条件查询，无条件则返回全部分页数据
     * @param date
     * @return
     */
    @Override
    public List<Venues> listCanBookByDate(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime dateTime = LocalDateTime.parse(date, formatter);

        QueryWrapper<Venues> wrapper = new QueryWrapper();
        wrapper.select("tid");
        wrapper.eq("`state`", StateEnum.ENABLE.getState());

        List<Venues> venuesList = getBaseMapper().selectList(wrapper);

        List<String> validTids = new ArrayList<>();
        for (Venues venues : venuesList) {
            int venuesbooksCnt = venuesbookService.getCountByTidAndDate(venues.getTid(), dateTime, BookTypeEnum.VENUES);
            if (venuesbooksCnt < 3) {
                validTids.add(venues.getTid());
            }
        }

        if (CollectionUtils.isEmpty(validTids)) {
            return null;
        }

        return getBaseMapper().selectBatchIds(validTids);
    }


    /**
     * 预约场馆
     * @param venuesBookQuery
     * @return
     */
    @Override
    public Result book(VenuesBookQuery venuesBookQuery) {
        Result<Boolean> bookedRecordCheck = bookedRecordCheck(venuesBookQuery);
        if (bookedRecordCheck.getCode() != ReturnCodeEnum.SUCCESS.getCode()) {
            return bookedRecordCheck;
        }

        Venues venues = getBaseMapper().selectById(venuesBookQuery.getTid());
        if (venues == null) {
            return Result.error(ReturnCodeEnum.PARAM_ERROR, "场馆不存在");
        }

        if (LocalDateTime.now().isAfter(venues.getEndTime())) {
            return Result.error(ReturnCodeEnum.STATE_ERROR, "场馆预约已结束");
        }

        if (StateEnum.ENABLE != StateEnum.getValue(venues.getState())) {
            return Result.error(ReturnCodeEnum.STATE_ERROR, "场馆不可预约");
        }

        Result<Boolean> addBookRecord = addBookRecord(venuesBookQuery, venues);
        if (addBookRecord.getCode() != ReturnCodeEnum.SUCCESS.getCode()) {
            return addBookRecord;
        }

        // TODO 发送短信

        log.info("venues booked success, tid={}, phone={}", venuesBookQuery.getTid(), venuesBookQuery.getMobile());

        return Result.success(true);
    }

    /**
     * 修改预约状态
     * @param tid
     * @return
     */
    public boolean updateBookState(String tid) {
        QueryWrapper<Venues> wrapper = new QueryWrapper();
        wrapper.eq("TID", tid);
        wrapper.eq("state", StateEnum.ENABLE.getState());

        Venues venues = new Venues();
        venues.setState(StateEnum.BOOKED.getState());
        return getBaseMapper().update(venues, wrapper) == 1;
    }


    private Result<Boolean> bookedRecordCheck(VenuesBookQuery venuesBookQuery) {
        Venuesbook appointment = venuesbookService.getOneByUserAndId(venuesBookQuery.getMobile(),
                BookTypeEnum.VENUES, venuesBookQuery.getStartTime(), venuesBookQuery.getTid());
        if (appointment != null) {
            return Result.error(ReturnCodeEnum.RECORD_EXISTS, "您已预约");
        }

        int activeRecordCount = venuesbookService.bookedActiveRecordCount(venuesBookQuery.getMobile());

        if (activeRecordCount >= 10) {
            log.error("venues auditing count over limit, tid={}, phone={}", venuesBookQuery.getTid(), venuesBookQuery.getMobile());
            return Result.error(ReturnCodeEnum.OVER_LIMIT, "预约活动超过限制");
        }

        return Result.success(true);
    }

    @Transactional
    public Result addBookRecord(VenuesBookQuery venuesBookQuery, Venues venues) {
        // 只有更新成功才能继续
        // 场馆预约不因个人预约而限制
//        if (!updateBookState(venues.getTid())) {
//            log.error("update venues state failed, tid={}, phone={}, state={}",
//                    venuesBookQuery.getTid(), venuesBookQuery.getMobile(), venues.getState());
//            return Result.error(ReturnCodeEnum.FAILED, "预约失败");
//        }

        Venuesbook venuesbook = new Venuesbook();
        venuesbook.setResponsiblePhone(venuesBookQuery.getMobile());
        venuesbook.setResponsible(venuesBookQuery.getName());
        venuesbook.setActivityName("");
        venuesbook.setActivityTid("");
        venuesbook.setVenuesName(venues.getName());
        venuesbook.setVenuesTid(venues.getTid());
        venuesbook.setState(StateEnum.AUDITING.getState());
        venuesbook.setHourCost(venues.getHourCost());
        venuesbook.setBooktime(LocalDateTime.now());
        venuesbook.setStartTime(venuesBookQuery.getStartTime());
        venuesbook.setEndTime(venuesBookQuery.getEndTime());

        boolean ret = venuesbookService.save(venuesbook);
        if (!ret) {
            log.error("add venues book record failed, tid={}, phone={}",
                    venuesBookQuery.getTid(), venuesBookQuery.getMobile());
            return Result.error(ReturnCodeEnum.FAILED, "预约失败");
        }

        Appointment newAppointment = new Appointment();
        newAppointment.setBookTid(venuesbook.getTid());
        newAppointment.setProcess(StateEnum.AUDITING.getState());
        newAppointment.setMemberTid(venuesBookQuery.getMemberTid());
        newAppointment.setDateTime(LocalDateTime.now());
        newAppointment.setType(BookTypeEnum.ACTIVITY.getMsg());
        newAppointment.setDepot(venues.getAddress());
        newAppointment.setPhone(venuesBookQuery.getMobile());
        newAppointment.setName(venuesBookQuery.getName());
        newAppointment.setWay(venuesBookQuery.getWay());

        ret = appointmentService.save(newAppointment);
        if (!ret) {
            log.error("add venues appointment record failed, tid={}, phone={}",
                    venuesBookQuery.getTid(), venuesBookQuery.getMobile());
            return Result.error(ReturnCodeEnum.FAILED, "预约失败");
        }

        return Result.success(true);
    }

}
