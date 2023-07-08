package com.team2.service.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team2.domain.board.BoardDTO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService {

	@Override
	public void register(BoardDTO vo) {
		// TODO Auto-generated method stub
	}

	@Override
	public BoardDTO get(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer modify(BoardDTO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer remove(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer registerKey(BoardDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getTotal() {
		// TODO Auto-generated method stub
		return null;
	}

}
