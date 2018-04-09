package com.bluemine.www.interfaces;

import java.util.ArrayList;

import com.bluemine.www.vo.CP_Position;

public interface positionMapper {
	
	//직급추가
	public int addPosition(CP_Position posi);
	//직함명 조회
	public ArrayList<CP_Position> getPosiList();
	//
}
