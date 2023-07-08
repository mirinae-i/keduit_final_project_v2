package com.team2.mapper.board;

import java.util.List;

import com.team2.domain.board.BoardDTO;
import com.team2.domain.generic.Criteria;

public interface BoardMapper {

	// CREATE
	public void insert(BoardDTO dto);

	// READ
	public BoardDTO select(Integer bno);

	// UPDATE
	public Integer update(BoardDTO dto);

	// DELETE
	public Integer delete(Integer bno);

	// 전체 글 보기
	public List<BoardDTO> selectAll();

	public void insertKey(BoardDTO dto);

	// 매개변수로 페이징을 위한 계산이 처리된 결과를 전달할 필요가 있음
	public List<BoardDTO> getListWithPaging(Criteria crit);

	// 전체 게시글 수
	public Integer getTotalCount();

}
