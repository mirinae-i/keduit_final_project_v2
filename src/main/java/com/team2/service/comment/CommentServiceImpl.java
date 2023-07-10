package com.team2.service.comment;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team2.domain.comment.CommentDTO;
import com.team2.mapper.comment.CommentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class CommentServiceImpl implements CommentService {
	
	CommentMapper mapper;

	@Override
	public Integer register(CommentDTO vo) {
		return mapper.insert(vo);
	}

	@Override
	public CommentDTO get(Integer key) {
		return null;
	}

	@Override
	public Integer modify(CommentDTO vo) {
		return null;
	}

	@Override
	public Integer remove(Integer key) {
		return null;
	}

	@Override
	public List<CommentDTO> listAll() {
		return null;
	}

	@Override
	public Integer registerKey(CommentDTO dto) {
		return null;
	}

	@Override
	public List<CommentDTO> getList() {
		return null;
	}

	@Override
	public Integer getTotal() {
		return null;
	}

}
