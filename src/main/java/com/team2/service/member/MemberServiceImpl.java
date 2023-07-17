package com.team2.service.member;

import org.springframework.stereotype.Service;

import com.team2.domain.member.MemberDTO;
import com.team2.mapper.member.MemberMapper;
import com.team2.util.BCrypt;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService<MemberDTO> {

	MemberMapper mapper;

	@Override
	public boolean isAdmin(MemberDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isValid(MemberDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDTO preLogin(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void logout() {
		// TODO Auto-generated method stub

	}

	@Override
	public Integer join(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer modify(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer remove(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	private String encrypt(String plain) {
		return BCrypt.hashpw(plain, BCrypt.gensalt(12));
	}

}
