package com.team2.service.comment;

import java.util.List;

import com.team2.domain.comment.CommentDTO;
import com.team2.service.generic.GenericCRUDService;

public interface CommentService extends GenericCRUDService<CommentDTO, Integer> {

	public List<CommentDTO> listAll();

	public Integer registerKey(CommentDTO dto);

	public List<CommentDTO> getList();

	public Integer getTotal();

}
