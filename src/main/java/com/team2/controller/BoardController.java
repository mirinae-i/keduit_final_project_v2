package com.team2.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.domain.api.LocationDTO;
import com.team2.domain.board.BoardDTO;
import com.team2.domain.board.PageDTO;
import com.team2.domain.generic.Criteria;
import com.team2.domain.member.MemberDTO;
import com.team2.service.board.BoardService;
import com.team2.util.FileUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {

	@Autowired
	private BoardService service;

//		@RequestMapping("/list")
//		public String showlist(Model model, Criteria cri) {
//			List<BoardDTO> boardList = service.getList(cri);
//			model.addAttribute("boardList",boardList);
//			return "board/list";
//		}

	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		int total = service.getTotal();
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	@ResponseBody
	@RequestMapping(value = "/getlist", method = RequestMethod.POST)
	public List<BoardDTO> getList(Criteria cri) {
		log.info(cri.getKeyword());
		log.info(cri.getType());
		return service.getList(cri);
	}

	@GetMapping("/register")
	public void registerGet(BoardDTO board, HttpSession session) {
		log.info("GET!!!!!!!");
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		board.setM_id(member.getId());
		session.setAttribute("board", board);
		log.info("**** member: {} ****", member);
		log.info("**** board: {} ****", board);
		// log.info("** OS: {} **", System.getProperties());
	}

	@PostMapping("/register")
	public String register(MultipartHttpServletRequest request, BoardDTO board, RedirectAttributes rttr, HttpSession session) {
		log.info("POST!!!!!!!!");
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String memberId = member.getId();
		board.setM_id(memberId);
		// session.getAttribute(memberId);
		Integer b_no = service.registerKey(board);
		rttr.addFlashAttribute("result", b_no);
		String sb_no = b_no.toString();

		// ** IMAGE FILE UPLOAD START **

		FileUtil util = new FileUtil();
		try {
			List<String> fileList = util.multiFileProcess(request, sb_no);
			board.setImageList(fileList);
		} catch (Exception e) {
			log.error("ERROR: {}", e);
		}
		log.info("ReSuLt: {}", board);

		// ** IMAGE FILE UPLOAD END **

		return "redirect:/board/list";
	}

	@GetMapping({ "/read", "/modify" })
	public void read(@RequestParam("b_no") Integer b_no, Model model) {
		service.updateViewCnt(b_no);
		model.addAttribute("board", service.get(b_no));
	}

	@PostMapping("/modify")
	public ModelAndView modify(@ModelAttribute("board") BoardDTO board, RedirectAttributes rttr) {
		System.out.println(board);
		int count = service.modify(board);
		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		} else {
			rttr.addFlashAttribute("result", "fail");
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/list");
		return mav;
	}

	@GetMapping("/remove")
	public void removeGet() {

	}

	@PostMapping("/remove")
	public String remove(@RequestParam("b_no") Integer b_no, RedirectAttributes rttr) {
		int c = service.remove(b_no);

		if (c == 1) {
			rttr.addFlashAttribute("result", "remove_success");
		} else {
			rttr.addFlashAttribute("result", "remove_fail");
		}

		return "redirect:/board/list";
	}

}
