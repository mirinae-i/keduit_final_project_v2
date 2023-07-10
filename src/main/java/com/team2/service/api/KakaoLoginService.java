package com.team2.service.api;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.team2.domain.api.kakao.KakaoAuthResponse;
import com.team2.domain.api.kakao.KakaoTokenResponse;
import com.team2.util.RestAPIUtil;


@Service
public class KakaoLoginService {
	private static final String ClIENTID = "bb389d8f9e74f7659c0eb03d8f957e92";
	private static final Logger logger = LoggerFactory.getLogger(KakaoLoginService.class);

	public KakaoTokenResponse getToken(KakaoAuthResponse response) {
		String url = "https://kauth.kakao.com/oauth/token";

		HashMap<String, String> data = new HashMap<String, String>();
		data.put("client_id", ClIENTID);
		data.put("redirect_uri", "http://localhost:8090/authResult");
		data.put("grant_type", "authorization_code");
		data.put("code", response.getCode());
		data.put("client_secret", "JSON");


		HashMap<String, String> headerData = new HashMap<String, String>();
		headerData.put("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		KakaoTokenResponse tokenResult = RestAPIUtil.connHttpGetType(url, data, headerData, KakaoTokenResponse.class);
		//logger.info("token result : {}", tokenResult.toString());
		
		return tokenResult;
	}
}
