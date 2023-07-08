package com.team2.service.board;

import java.util.List;

import com.team2.domain.board.BoardDTO;
import com.team2.service.generic.GenericCRUDService;

public interface BoardService extends GenericCRUDService<BoardDTO, Integer> {

	public List<BoardDTO> listAll();

	public Integer registerKey(BoardDTO dto);

	// Criteria 클래스 작성 후 getList(Criteria crit)으로 변경
	public List<BoardDTO> getList();

	public Integer getTotal();

}
