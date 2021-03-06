package com.hk.culture.mini.program.common.constant;

public enum MsgTypeEnum {
    NOTIFY("notify", "通知消息"),
    PHONE_MSG("phone_msg", "短信消息"),
    BROADCAST("broadcast", "广播消息"),
    ;

    private String desc;
    private String type;


    MsgTypeEnum(String type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public String getType() {
        return type;
    }

    public static StateEnum getValue(String type) {
        type = type.toLowerCase();
        for (StateEnum stateEnum : StateEnum.values()) {
            if (stateEnum.getState().equals(type)) {
                return stateEnum;
            }
        }

        return null;
    }
}
