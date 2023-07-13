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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.domain.member.MemberDTO;
import com.team2.service.member.MemberService;
import com.team2.util.BCrypt;

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
	public String loginAction(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr) {
		log.info("** MemberController - login **");
		log.info("** Login id: {}, pw: {} **", memberDTO.getId(), memberDTO.getPw());
		// 로그인
		MemberDTO result = memberService.login(memberDTO);
		switch (result.getSerial_no()) {
		case -1:
			log.error("** MemberController - login Error **");
			log.error("** 입력한 ID가 잘못됨 **");
			rttr.addFlashAttribute("member_no", result.getSerial_no());
			break;
		case -2:
			log.error("** MemberController - login Error **");
			log.error("** 입력한 비밀번호가 회원 정보와 일치하지 않음 **");
			rttr.addFlashAttribute("member_no", result.getSerial_no());
			break;
		case -3:
			log.error("** MemberController - login Error **");
			log.error("** 이미 탈퇴한 회원 **");
			rttr.addFlashAttribute("member_no", result.getSerial_no());
			break;
		default:
			log.info("** {} **", result.toString());
			HttpSession session = request.getSession();
			rttr.addFlashAttribute("member_no", result.getSerial_no());
			session.setAttribute("is_logon", true);
			session.setAttribute("member", result);
			log.info("** /login(POST) is_logon: {} **", session.getAttribute("is_logon"));
			log.info("** /login(POST) member: {} **", session.getAttribute("member"));
			break;
		}
		return "redirect:/member/login";
	}

	@GetMapping("/login")
	public ModelAndView login(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		log.info("** /login(GET) is_logon: {} **", session.getAttribute("is_logon"));
		log.info("** /login(GET) member: {} **", session.getAttribute("member"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		return mav;
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		log.info("** MemberController - logout **");
		HttpSession session = request.getSession();
		log.info("** /logout BEFORE is_logon: {} **", session.getAttribute("is_logon"));
		log.info("** /logout BEFORE member: {} **", session.getAttribute("member"));
		boolean isLogOn = (boolean) session.getAttribute("is_logon");
		if (isLogOn) {
			session.invalidate();
			request.getSession(true);
		}
		try {
			log.info("** /logout AFTER is_logon: {} **", session.getAttribute("is_logon"));
			log.info("** /logout AFTER member: {} **", session.getAttribute("member"));
		} catch (IllegalStateException ie) {
			log.info("** /logout 세션 만료됨 **");
		}
		return "redirect:/member/main";
	}

	@GetMapping("/show_member_info")
	public ModelAndView showMemInfo(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("** MemberController - show_member_info **");
		HttpSession session = request.getSession();
		log.info("** /show_member_info is_logon: {} **", session.getAttribute("is_logon"));
		log.info("** /show_member_info member: {} **", session.getAttribute("member"));
		if (session.getAttribute("member") != null) {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} else {
			log.error("** MemberController - show_member_info Error **");
			log.error("** 세션에 MemberDTO가 존재하지 않음 **");
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/show_member_info");
		return mav;
	}

	@GetMapping("/join")
	public void join() {
		log.info("** MemberController - join(GET) **");
	}

	@PostMapping("/join")
	public String joinAction(@ModelAttribute("memberDTO") MemberDTO memberDTO, RedirectAttributes rttr) {
		log.info("** MemberController - join(POST) **");
		log.info("** {} **", memberDTO.toString());
		Integer result = memberService.join(memberDTO);
		if (result != null && result == 1) {
			log.info("** 회원 가입 결과: {} **", result);
			rttr.addFlashAttribute("join_result", result);
		} else {
			log.error("** MemberController - join(POST) Error **");
			log.error("** 회원 가입 실패 **");
		}
		return "redirect:/member/join_result";
	}

	@GetMapping("/join_result")
	public void joinResult(HttpServletRequest request, RedirectAttributes rttr) {
		log.info("** MemberController - join_result **");
		HttpSession session = request.getSession();
		log.info("** /join_result BEFORE is_logon: {} **", session.getAttribute("is_logon"));
		log.info("** /join_result BEFORE member: {} **", session.getAttribute("member"));
		if (session.getAttribute("is_logon") != null) {
			session.invalidate();
			request.getSession(true);
		}
		try {
			log.info("** /join_result AFTER is_logon: {} **", session.getAttribute("is_logon"));
			log.info("** /join_result AFTER member: {} **", session.getAttribute("member"));
		} catch (IllegalStateException ie) {
			log.info("** /join_result 세션 만료됨 **");
		}
	}

	@PostMapping("/modify_member")
	public String modifyAction(@ModelAttribute("memberDTO") MemberDTO memberDTO, RedirectAttributes rttr) {
		log.info("** MemberController - modify_member **");
		log.info("** {} **", memberDTO.toString());
		Integer result = memberService.modify(memberDTO);
		if (result != null && result == 1) {
			log.info("** 회원 정보 수정 결과: {} **", result);
			rttr.addFlashAttribute("modify_result", result);
		} else {
			log.error("** MemberController - modify_member(POST) Error **");
			log.error("** 회원 정보 수정 실패 **");
		}
		return "redirect:/member/modify_member_result";
	}

	@GetMapping("/modify_member_result")
	public void modifyMemberResult(RedirectAttributes rttr) {
		log.info("** MemberController - modify_member_result **");
	}

	@GetMapping("/modify_complete")
	public String modifyComplete(HttpServletRequest request, HttpServletResponse response) {
		log.info("** MemberController - modify_complete **");
		HttpSession session = request.getSession();
		log.info("** /modify_complete BEFORE is_logon: {} **", session.getAttribute("is_logon"));
		log.info("** /modify_complete BEFORE member: {} **", session.getAttribute("member"));
		boolean isLogOn = (boolean) session.getAttribute("is_logon");
		if (isLogOn) {
			session.invalidate();
			request.getSession(true);
		}
		try {
			log.info("** /modify_complete AFTER is_logon: {} **", session.getAttribute("is_logon"));
			log.info("** /modify_complete AFTER member: {} **", session.getAttribute("member"));
		} catch (IllegalStateException ie) {
			log.info("** /modify_complete 세션 만료됨 **");
		}
		return "redirect:/member/sign";
	}

	@GetMapping("/leave")
	public void leave() {
		log.info("** MemberController - leave(GET) **");
	}

	@PostMapping("/leave")
	public String leaveAction(@ModelAttribute("memberDTO") MemberDTO memberDTO, RedirectAttributes rttr,
			HttpServletRequest request, HttpServletResponse response) {
		log.info("** MemberController - leave(POST) **");
		HttpSession session = request.getSession();
		log.info("** /leave(POST) is_logon: {} **", session.getAttribute("is_logon"));
		log.info("** /leave(POST) member: {} **", session.getAttribute("member"));
		MemberDTO sessionDTO = (MemberDTO) session.getAttribute("member");
		log.info("** Parameter PW: {} **", memberDTO.getPw());
		log.info("** Session PW: {} **", sessionDTO.getPw());
		// 입력값으로 받은 비밀번호가 회원 정보의 비밀번호(세션)와 일치하는지 체크
		boolean condition = BCrypt.checkpw(memberDTO.getPw(), sessionDTO.getPw());
		log.info("** 비밀번호 일치 여부: {} **", condition);
		if (condition) {
			Integer result = memberService.remove(sessionDTO.getSerial_no());
			rttr.addFlashAttribute("leave_result", result);
			log.info("** 비밀번호가 일치함(leave_result: {})", result);
		} else {
			log.error("** 비밀번호가 일치하지 않음(leave_result: null) **");
		}
		return "redirect:/member/leave_complete";
	}

	@GetMapping("/leave_complete")
	public String leaveComplete(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) {
		log.info("** MemberController - modify_complete **");
		HttpSession session = request.getSession();
		log.info("** /leave_complete BEFORE is_logon: {} **", session.getAttribute("is_logon"));
		log.info("** /leave_complete BEFORE member: {} **", session.getAttribute("member"));
		boolean isLogOn = (boolean) session.getAttribute("is_logon");
		if (isLogOn) {
			session.invalidate();
			request.getSession(true);
		}
		try {
			log.info("** /leave_complete AFTER is_logon: {} **", session.getAttribute("is_logon"));
			log.info("** /leave_complete AFTER member: {} **", session.getAttribute("member"));
		} catch (IllegalStateException ie) {
			log.info("** /modify_complete 세션 만료됨 **");
		}
		return "/member/leave_complete";
	}

}
