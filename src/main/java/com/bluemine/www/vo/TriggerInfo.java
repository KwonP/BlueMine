package com.bluemine.www.vo;

import java.io.Serializable;

public class TriggerInfo implements Serializable{

	private int trigger_Num;// 트리거번호(알림번호)
	private String info_Type;// 알림종류
	private int info_Num;// 알림고유번호
	private String info_Content;// 알림 내용
	private String update_Date;// 발생일
	private String command_Check;// 알림내용(동작체크용)

	public TriggerInfo(int trigger_Num, String info_Type, int info_Num, String info_Content, String update_Date,
			String command_Check) {
		super();
		this.trigger_Num = trigger_Num;
		this.info_Type = info_Type;
		this.info_Num = info_Num;
		this.info_Content = info_Content;
		this.update_Date = update_Date;
		this.command_Check = command_Check;
	}

	public TriggerInfo() {
		super();
	}

	public int getTrigger_Num() {
		return trigger_Num;
	}

	public void setTrigger_Num(int trigger_Num) {
		this.trigger_Num = trigger_Num;
	}

	public String getInfo_Type() {
		return info_Type;
	}

	public void setInfo_Type(String info_Type) {
		this.info_Type = info_Type;
	}

	public int getInfo_Num() {
		return info_Num;
	}

	public void setInfo_Num(int info_Num) {
		this.info_Num = info_Num;
	}

	public String getInfo_Content() {
		return info_Content;
	}

	public void setInfo_Content(String info_Content) {
		this.info_Content = info_Content;
	}

	public String getUpdate_Date() {
		return update_Date;
	}

	public void setUpdate_Date(String update_Date) {
		this.update_Date = update_Date;
	}

	public String getCommand_Check() {
		return command_Check;
	}

	public void setCommand_Check(String command_Check) {
		this.command_Check = command_Check;
	}

	@Override
	public String toString() {
		return "trigger_Num=" + trigger_Num + ", info_Type=" + info_Type + ", info_Num=" + info_Num
				+ ", info_Content=" + info_Content + ", update_Date=" + update_Date + ", command_Check=" + command_Check;
	}

}
