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
			log.error("�엯�젰�븳 ID�뿉 �빐�떦�븯�뒗 �쉶�썝�씠 �뾾�쓬");
			break;
		case -2:
			log.error("** MemberController - login Error **");
			log.error("�엯�젰�븳 鍮꾨�踰덊샇媛� �옒紐삳맖");
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
