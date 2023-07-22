package com.team2.service.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.Session;
import com.team2.domain.board.BoardDTO;
import com.team2.domain.generic.Criteria;
import com.team2.mapper.board.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService {
	
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public Integer register(BoardDTO dto) {
		mapper.insert(dto);
		return null;
	}

	@Override
	public BoardDTO get(Integer key) {
		return mapper.select(key);
	}

	@Override
	public Integer modify(BoardDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public Integer remove(Integer key) {
		return mapper.delete(key);
	}

	@Override
	public List<BoardDTO> listAll() {
		return mapper.selectAll();
	}

	@Override
	public Integer registerKey(BoardDTO dto) {
		dto.setImageString(dto.getImageList().get(0));
		mapper.insertKey(dto);
		return dto.getB_no();
	}

	@Override
	public List<BoardDTO> getList(Criteria cri) {
		log.info("criteria!! : "+cri);
		log.info(""+mapper.getListWithPasing(cri));
		return mapper.getListWithPasing(cri);
	}

	@Override
	public Integer getTotal() {
		return mapper.getTotalCount();
	}

	@Override
	public void updateViewCnt(Integer b_no) {
		mapper.updateViewCnt(b_no);
	}


}
