package com.team2.service.api;

import java.util.List;

public interface APIService<VO> {

	public VO show();
	
	public List<VO> showList();

}
