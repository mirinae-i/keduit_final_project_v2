package com.team2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@AllArgsConstructor
@Slf4j
public class MainController {

	@GetMapping("/test")
	public void test() {
		log.info("테슽흐");
	}
	

	@GetMapping("/main/shop")
	public void shop() {
		log.info("쇼ㅑ핑한번 하시죠?");
	}
	
	@GetMapping("/main/index")
	public void index() {
		log.info("인덱스 나와라");
	}
	
	@GetMapping("/main/AED")
	public void AED() {
		log.info("인덱스 나와라");
	}
	


}
