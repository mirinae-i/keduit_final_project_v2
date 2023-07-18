package com.team2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	MemberService<MemberDTO> memberService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	// 로그인 세션 테스트를 위한 dummy main
	public String main(HttpSession session) {
		log.info("** MemberController /main(GET) **");
		log.info("** Session: {} **", session);
		log.info("** Member info: {} **", session.getAttribute("member"));
		return "/member/main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(HttpSession session) {
		log.info("** MemberController /login(GET) **");
		log.info("** Session: {} **", session);
		log.info("** Member info: {} **", session.getAttribute("member"));
		return "/member/login";
	}

	@ResponseBody
	@RequestMapping(value = "/login_action", method = RequestMethod.POST)
	public String loginAction(MemberDTO memberDTO, HttpSession session) {
		log.info("** MemberController /loginAction(POST) **");
		log.info("** Session: {} **", session);
		log.info("** ID: {} **", memberDTO.getId());
		log.info("** PW: {} **", memberDTO.getPw());
		memberDTO = memberService.login(memberDTO);
		if (memberDTO != null) {
			switch (memberDTO.getSerial_no()) {
			case -1: // 입력한 ID에 해당하는 회원이 없음
				log.error("** /loginAction ERROR: 회원정보가 DB에 존재하지 않음 **");
				return "Not_Found";
			case -2: // 비밀번호 불일치
				log.error("** /loginAction ERROR: 비밀번호가 일치하지 않음 **");
				return "PW_Mismatch";
			default: // 비밀번호 일치
				session.setAttribute("member", memberDTO);
				return "Success";
			}
		} else {
			log.error("** /loginAction ERROR: memberDTO == null **");
		}
		return "/member/login_action";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/member/main";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinView(HttpSession session) {
		log.info("** MemberController /join(GET) **");
		log.info("** Session: {} **", session);
		log.info("** Member info: {} **", session.getAttribute("member"));
		return "/member/join";
	}

	@ResponseBody
	@RequestMapping(value = "/join_action")
	public String joinAction(MemberDTO memberDTO, HttpSession session) {
		log.info("** MemberController /loginAction(POST) **");
		log.info("** Session: {} **", session);
		log.info("** ID: {}, PW: {}, name: {}, email: {} **", memberDTO.getId(), memberDTO.getPw(), memberDTO.getName(),
				memberDTO.getEmail());
		String resultMsg = "Fail";
		try {
			int result = memberService.join(memberDTO);
			if (result == 1) {
				return "Success";
			}
		} catch (DataIntegrityViolationException e) {
			String cause = e.getCause().toString();
			if (cause.contains("member.id")) {
				log.error("** joinAction ERROR: {} **", e.getMessage());
				resultMsg = "Duplicate_ID";
			} else if (cause.contains("member.name")) {
				log.error("** joinAction ERROR: {} **", e.getMessage());
				resultMsg = "Duplicate_Name";
			} else if (cause.contains("member.email")) {
				log.error("** joinAction ERROR: {} **", e.getMessage());
				resultMsg = "Duplicate_Email";
			} else {
				log.error("** joinAction ERROR: {} **", e.getMessage());
				resultMsg = "SQL_ERROR";
			}
		}
		return resultMsg;
	}

}
