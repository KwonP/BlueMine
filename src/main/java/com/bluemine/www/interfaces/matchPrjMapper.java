package com.bluemine.www.interfaces;

import com.bluemine.www.vo.MatchPRJ;

public interface matchPrjMapper {

	//회원, 프로젝트 관계 세팅
	public int setRelation(MatchPRJ mp);
}
