package com.team2.service.api;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team2.domain.api.LocationDTO;
import com.team2.mapper.api.LocationAPIMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class LocationAPIServiceImpl implements LocationAPIService {

	LocationAPIMapper mapper;

	@Override
	public LocationDTO show() {
		return null;
	}

	@Override
	public List<LocationDTO> showList() {
		return mapper.getXY();
	}

}
