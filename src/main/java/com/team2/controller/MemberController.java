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
		if (result != null) {
			log.info(result.toString());
			HttpSession session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("Member", result);
		} else {
			log.error("** MemberController - login Error **");
			log.error("입력한 ID 또는 비밀번호가 잘못됨");
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

}
