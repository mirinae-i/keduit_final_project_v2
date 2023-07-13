package com.team2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.domain.board.BoardDTO;
import com.team2.domain.board.PageDTO;
import com.team2.domain.generic.Criteria;
import com.team2.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {
		
		@Autowired
		private BoardService service;
		
		
//		// ajax �Ƚ�����...
//		@RequestMapping("/list")
//		public String showlist(Model model, Criteria cri) {
//			List<BoardDTO> boardList = service.getList(cri);
//			model.addAttribute("boardList",boardList);
//			return "board/list";
//		}
		
		// list ȭ�� �̵�
		@GetMapping("/list")
		public void list(Model model) {
		}
	
		// �Խù� ��� �����ֱ�
		@ResponseBody
		@PostMapping("/getlist")
		public List<BoardDTO> getList() {
			log.info("�˴ϱ�?");
			return service.listAll();
		}
}
