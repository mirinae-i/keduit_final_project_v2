package com.team2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.domain.member.MemberDTO;
import com.team2.service.member.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
@Slf4j
public class BoardController {

	

	@GetMapping("/comm")
	public void comm() {
		log.info("** BoardController - comm **");
	}

	

	@GetMapping("/history")
	public void history() {
		log.info("** BoardController - history **");
	}
	
	
}
