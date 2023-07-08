package com.team2.util;

import java.io.IOException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class XmlUtil {

	public static <T> T parseXml(String xml, Class<T> clazz) {
		
		XmlMapper mapper = new XmlMapper();
		
		try {
			JsonNode node = mapper.readTree(xml.getBytes());
			ObjectMapper jsonMapper = new ObjectMapper();
			String json = jsonMapper.writeValueAsString(node);
			T result = JsonUtil.parseJson(json, clazz);
			return result;
		} catch (IOException e) {
			log.error("** XmlUtil ERROR: {} **", e);
			return null;
		}
	}
	
}
