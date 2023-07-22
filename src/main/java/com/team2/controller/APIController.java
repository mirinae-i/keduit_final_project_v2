package com.team2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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


	//@ResponseBody
	@RequestMapping("/map")
	public String address(Model model) {
		log.info("api 지도 테스트!! ");
		List<LocationDTO> locationList = service.showList();
		model.addAttribute("locationList", locationList);
		return "api/map";
	}
	
	@GetMapping("/search")
	public String searchLocations(@RequestParam("keyword") String keyword, Model model) {
		log.info("밍구 keyword! {}", keyword);
	    List<LocationDTO> keywordList = service.searchLocationsByKeyword(keyword);
	    model.addAttribute("keywordList", keywordList);
	    log.info("밍구 keyword! {}", keyword);
	    return "api/map";
	}
}
