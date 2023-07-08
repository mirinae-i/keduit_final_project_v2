package com.team2.service.generic;

public interface GenericCRUDService<VO, K> {

	// CREATE
	public void register(VO vo);

	// READ
	public VO get(K key);

	// UPDATE
	public Integer modify(VO vo);

	// DELETE
	public Integer remove(K key);

}
