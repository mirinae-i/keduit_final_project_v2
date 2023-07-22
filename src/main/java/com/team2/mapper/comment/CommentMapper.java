package com.team2.mapper.comment;

import com.team2.domain.board.BoardDTO;
import com.team2.domain.comment.CommentDTO;

public interface CommentMapper {

	// CREATE
	public void insert(CommentDTO dto);

	// READ
	public BoardDTO select(Integer bno);

	// UPDATE
	public Integer update(CommentDTO dto);

	// DELETE
	public Integer delete(Integer bno);

	// 아래에 기능 추가

}
