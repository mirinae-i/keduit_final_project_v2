package com.team2.service.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.team2.domain.api.DisasterInfoDTO;
import com.team2.util.RestAPIUtil;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class DisasterInfoAPIServiceImpl implements DisasterInfoAPIService {

	private static final String API_KEY = "demFP1neYUzXaXfsZnm9nSxWaAg0JfIVTmLSqmEaapdpEUyglN0TuYBmkmgCa/tBEJH1WqacXugI2gfWE8AUOQ==";
	private static final String URL = "http://apis.data.go.kr/1741000/DisasterMsg3/getDisasterMsg1List";

	@Override
	public DisasterInfoDTO show() {
		log.info("** DisasterInfoAPIServiceImpl - show **");
		return prepareAPICall();
	}

	@Override
	public List<DisasterInfoDTO> showList() {
		return null;
	}

	// API를 호출하기 위한 양식 작성 메소드, RestAPIUtil을 통해 호출
	private DisasterInfoDTO prepareAPICall() {
		// head
		Map<String, String> head = new HashMap<>();
		head.put("Content-type", "application/xml;charset=UTF-8");
		// body
		Map<String, String> body = new HashMap<>();
		body.put("ServiceKey", API_KEY);
		body.put("pageNo", "1");
		body.put("numOfRows", "200");
		body.put("type", "xml");
		// return
		return RestAPIUtil.connHttpGetType(URL, head, body, DisasterInfoDTO.class);
	}

}
