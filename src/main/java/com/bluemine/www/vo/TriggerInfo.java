package com.bluemine.www.vo;

public class TriggerInfo {

     
    private int triggerNum;// 트리거번호(알림번호)
    private String infoType;// 알림종류 
    private int infoNum;// 알림고유번호
    private String infoContent;// 알림 내용
    private String updateDate;// 발생일
    private String commandCheck;// 알림내용(동작체크용)
    
    public int getTriggerNum() {
        return triggerNum;
    }

    public void setTriggerNum(int triggerNum) {
        this.triggerNum = triggerNum;
    }

    public String getInfoType() {
        return infoType;
    }

    public void setInfoType(String infoType) {
        this.infoType = infoType;
    }

    public int getInfoNum() {
        return infoNum;
    }

    public void setInfoNum(int infoNum) {
        this.infoNum = infoNum;
    }

    public String getInfoContent() {
        return infoContent;
    }

    public void setInfoContent(String infoContent) {
        this.infoContent = infoContent;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getCommandCheck() {
        return commandCheck;
    }

    public void setCommandCheck(String commandCheck) {
        this.commandCheck = commandCheck;
    }

    
}