package com.team2.mapper.board;

import java.util.List;

import com.team2.domain.board.BoardDTO;
import com.team2.domain.generic.Criteria;

public interface BoardMapper {
	
	// CRUD 필수 기능 구현
	
	public Integer update(BoardDTO dto);
	
	public void insert(BoardDTO dto);
	
	public BoardDTO select(Integer b_no);
	
	public Integer delete(Integer b_no);
	
	public void insertKey(BoardDTO dto);
	
	// 전체글 보기..!!
	public List<BoardDTO> selectAll();
	
	public List<BoardDTO> getListWithPasing(Criteria cri);
	
	public Integer getTotalCount();
	

}
