package com.team2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.domain.api.DisasterInfoDTO;
import com.team2.domain.api.LocationDTO;
import com.team2.service.api.DisasterInfoAPIService;
import com.team2.service.api.LocationAPIService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/api/*")
@AllArgsConstructor
@Slf4j
public class APIController {

	@Autowired
	DisasterInfoAPIService disasterInfoAPIService;

	@Autowired
	LocationAPIService locationAPIService;
	
	@Autowired
    private LocationAPIService service;

	@GetMapping("/disaster_info")
	public void disasterInfo() {
		log.info("** APIController - disaster_info **");
	}

	@ResponseBody
	@RequestMapping(value = "/disaster_info_ajax", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	public DisasterInfoDTO disasterInfoAjax(Model model) {
		log.info("** APIController - disaster_info_ajax **");
		return disasterInfoAPIService.show();
	}
	
    // 카카오 지도 API
    @RequestMapping("/map")
    public String address(Model model) {
        log.info("카카오 지도 API 테스트");
        // LocationDTO 리스트를 가져옴
        List<LocationDTO> locationList = service.showList();
        // 모델에 위치 리스트 추가
        model.addAttribute("locationList", locationList);
        return "api/map";
    }

}
