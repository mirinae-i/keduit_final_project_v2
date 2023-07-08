package com.team2.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RestAPIUtil {

	public static <T> T connHttpGetType(String connURL, Map<String, String> head, Map<String, String> body,
			Class<T> classType) {
		try {
			// 문자열 동적 처리
			StringBuilder urlBuilder = new StringBuilder(connURL);
			// 반복 횟수 체크
			int count = 0;
			// GET 방식의 파라미터 전달
			for (String key : body.keySet()) {
				if (count == 0) {
					urlBuilder.append(
							"?" + URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(body.get(key), "UTF-8"));
				} else {
					urlBuilder.append(
							"&" + URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(body.get(key), "UTF-8"));
				}
				count++;
			}
			// API에서 요구하는 Header 데이터 연결
			if (head.get("Content-type").contains("application/xml")) { // XML
				if (urlBuilder.toString().startsWith("https")) {
					return XmlUtil.parseXml(RestAPIUtil.httpsConn(urlBuilder.toString(), head), classType);
				} else {
					return XmlUtil.parseXml(RestAPIUtil.httpConn(urlBuilder.toString(), head), classType);
				}
			} else { // JSON
				if (urlBuilder.toString().startsWith("https")) {
					return JsonUtil.parseJson(RestAPIUtil.httpsConn(urlBuilder.toString(), head), classType);
				} else {
					return JsonUtil.parseJson(RestAPIUtil.httpConn(urlBuilder.toString(), head), classType);
				}
			}
		} catch (Exception e) {
			log.error("** RestAPIUtil ERROR: {} **", e);
			return null;
		}
	}

	private static String httpsConn(String connURL, Map<String, String> head) {
		try {
			URL url = new URL(connURL);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			for (String key : head.keySet()) {
				conn.setRequestProperty(key, head.get(key));
			}
			// Text 기반의 데이터 읽기
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { // 응답 성공
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 응답 실패
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder builder = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				builder.append(line);
			}
			// 리소스 반환
			rd.close();
			conn.disconnect();
			// return
			return builder.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	private static String httpConn(String connURL, Map<String, String> head) {
		try {
			URL url = new URL(connURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			for (String key : head.keySet()) {
				conn.setRequestProperty(key, head.get(key));
			}
			// Text 기반의 데이터 읽기
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { // 응답 성공
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 응답 실패
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder builder = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				builder.append(line);
			}
			// 리소스 반환
			rd.close();
			conn.disconnect();
			// return
			return builder.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
