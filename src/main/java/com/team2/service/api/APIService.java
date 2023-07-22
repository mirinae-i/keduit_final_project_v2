package com.team2.service.api;

import java.util.List;

import com.team2.domain.api.LocationDTO;

public interface APIService<VO> {

	public VO show();
	
	public List<VO> showList();

	public List<LocationDTO> searchLocationsByKeyword(String keyword);

}
