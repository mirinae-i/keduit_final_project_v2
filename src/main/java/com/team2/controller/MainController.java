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
		log.info("�ך���");
	}
	

	@GetMapping("/main/shop")
	public void shop() {
		log.info("������ѹ� �Ͻ���?");
	}
	
	@GetMapping("/main/index")
	public void index() {
		log.info("�ε��� ���Ͷ�");
	}
	
	@GetMapping("/main/AED")
	public void AED() {
		log.info("�ε��� ���Ͷ�");
	}
	


}
