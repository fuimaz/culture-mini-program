package com.hk.culture.mini.program.dto.query;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2020-04-08
 */
@Data
public class VenuesQuery implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 日期
     */
    private String bookDate;

    /**
     * 时间区间
     */
    private String interval;

    /**
     * 开始时间
     */
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    private LocalDateTime endTime;

    /**
     * 场馆状态
     */
    private String state;

    /**
     * 场类型
     */
    private String category;

}
