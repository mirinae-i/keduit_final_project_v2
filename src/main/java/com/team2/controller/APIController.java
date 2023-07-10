package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.domain.api.DisasterInfoDTO;
import com.team2.domain.api.kakao.KakaoAuthResponse;
import com.team2.service.api.DisasterInfoAPIService;
import com.team2.service.api.KakaoLoginService;
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
	
	
	
	//카카오 API
	
	//카카오 로그인(이미지 버튼식, 인클루드 태그로 활용)
	KakaoLoginService kakaoLoginService;

	@GetMapping("/kakaologin")
	public void login() {
		log.info("제발 주연이 소원...");
	}

	@RequestMapping(value = "/authResult")
	public String authResult(KakaoAuthResponse response) {
		// logger.info("success auth-code:{}", response.getCode());
		kakaoLoginService.getToken(response);
		return "main";
	}
	
	
	//카카오 공유(이미지 버튼식, 인클루드 태그로 활용)
	@GetMapping("/kakaoshare")
	public void share() {
		log.info("공유 돼 주시궜어요?");
	}

	
	
	
	

}
