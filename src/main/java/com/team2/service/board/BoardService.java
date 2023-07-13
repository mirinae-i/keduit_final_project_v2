package com.team2.service.board;

import java.util.List;

import com.team2.domain.board.BoardDTO;
import com.team2.domain.generic.Criteria;
import com.team2.service.generic.GenericCRUDService;

public interface BoardService extends GenericCRUDService<BoardDTO, Integer> {

	public List<BoardDTO> listAll();

	public Integer registerKey(BoardDTO dto);

	public List<BoardDTO> getList(Criteria cri);
	
	public Integer getTotal();

}
