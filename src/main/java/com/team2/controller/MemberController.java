package com.team2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

	@GetMapping("/main")
	public void main() {
		log.info("** MemberController - main **");
	}

	@GetMapping("/sign")
	public void sign() {
		log.info("** MemberController - sign **");
	}

	@PostMapping("/login")
	public ModelAndView login(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("** MemberController - login **");
		log.info("Login id: {}, pw: {}", memberDTO.getId(), memberDTO.getPw());
		MemberDTO result = memberService.login(memberDTO);
		switch (result.getSerial_no()) {
		case -1:
			log.error("** MemberController - login Error **");
			log.error("** 입력한 ID가 잘못됨 **");
			request.setAttribute("MemberNo", result.getSerial_no());
			break;
		case -2:
			log.error("** MemberController - login Error **");
			log.error("** 입력한 비밀번호가 회원 정보와 일치하지 않음 **");
			request.setAttribute("MemberNo", result.getSerial_no());
			break;
		case -3:
			log.error("** MemberController - login Error **");
			log.error("** 이미 탈퇴한 회원 **");
			request.setAttribute("MemberNo", result.getSerial_no());
			break;
		default:
			log.info(result.toString());
			HttpSession session = request.getSession();
			request.setAttribute("MemberNo", result.getSerial_no());
			session.setAttribute("isLogOn", true);
			session.setAttribute("Member", result);
			break;
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		return mav;
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		log.info("** MemberController - logout **");
		HttpSession session = request.getSession();
		boolean isLogOn = (boolean) session.getAttribute("isLogOn");
		if (isLogOn) {
			session.invalidate();
		}
		return "redirect:/member/main";
	}

	@GetMapping("/show_member_info")
	public ModelAndView showMemInfo(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("** MemberController - show_member_info **");
		HttpSession session = request.getSession();
		if (session.getAttribute("Member") != null) {
			memberDTO = (MemberDTO) session.getAttribute("Member");
		} else {
			log.error("** MemberController - show_member_info Error **");
			log.error("** 세션에 MemberDTO가 존재하지 않음 **");
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/show_member_info");
		return mav;
	}

}
