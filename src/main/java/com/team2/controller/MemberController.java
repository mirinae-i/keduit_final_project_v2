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
@RequestMapping("/member/*")
@AllArgsConstructor
@Slf4j
public class MemberController {

	@Autowired
	MemberService<MemberDTO, Integer> memberService;

	@GetMapping("/sign")
	public void sign() {
		log.info("** MemberController - sign **");
	}

	@ResponseBody
	@PostMapping("/login")
	public void login(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model) {
		log.info("** MemberController - login **");
		log.info("Login id: {}, pw: {}", memberDTO.getId(), memberDTO.getPw());
		MemberDTO result = memberService.login(memberDTO);
		switch (result.getSerial_no()) {
		case -1:
			log.error("** MemberController - login Error **");
			log.error("占쎌뿯占쎌젾占쎈립 ID占쎈퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 占쎌돳占쎌뜚占쎌뵠 占쎈씨占쎌벉");
			break;
		case -2:
			log.error("** MemberController - login Error **");
			log.error("占쎌뿯占쎌젾占쎈립 �뜮袁⑨옙甕곕뜇�깈揶쏉옙 占쎌삋筌륁궠留�");
			break;
		default:
			log.info(result.toString());
			break;
		}
	}

	@GetMapping("/myinfo")
	public void myinfo() {
		log.info("** MemberController - myinfo **");
	}
	
	
}
