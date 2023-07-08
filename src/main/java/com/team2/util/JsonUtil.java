package com.team2.util;

import com.google.gson.Gson;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JsonUtil {

	public static <T> T parseJson(String jsonString, Class<T> clazz) {
		Gson gson = new Gson();
		T result = gson.fromJson(jsonString, clazz);
		log.info("** JsonUtil - parseJson **");
		log.info("Parsed JSON data: {}", result.toString());
		return result;
	}

}
