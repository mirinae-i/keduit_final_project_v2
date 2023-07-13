package com.team2.controller.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team2.domain.board.BoardDTO;
import com.team2.mapper.board.BoardMapper;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;
	
	
	 // READ
	@Test
	public void testGetList() {
		log.info("testGetList() {}");
		log.info(boardMapper.selectAll().toString());
	}
	
	// CREATE
	@Test
	public void testInsert() {
		BoardDTO board = new BoardDTO();
		board.setB_title("매퍼 테스트 제목");
		board.setB_content("매퍼 테스트 내용");
		board.setM_id("yeji");
		boardMapper.insert(board);
		log.info("Create board : "+board.toString());
	}
	
	// UPDATE
	@Test
	public void testupdate() {
		BoardDTO board = new BoardDTO();
		board.setB_no(7);
		board.setB_title("매퍼 테스트 수정이욤");
		board.setB_content("매퍼 테스트 내용 수정이욤");

		boardMapper.update(board);
		log.info("Updated board : " +board);
	}
	
	
	// DELETE
	@Test
	public void testdelete() {
		Integer b_no = 1;
		boardMapper.delete(b_no);
		log.info("Delete board : ");
	}

}
