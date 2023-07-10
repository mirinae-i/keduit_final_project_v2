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
public class MemberServiceImpl implements MemberService<MemberDTO, Integer> {

	MemberMapper mapper;

	@Override
	public MemberDTO get() {
		// TODO Auto-generated method stub
		return null;
	}

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
		return mapper.preLogin(dto);
	}

	@Override
	public MemberDTO login(MemberDTO dto) { // 평문 pw가 담긴 dto
		MemberDTO attempt = preLogin(dto); // 해시된 pw가 담긴 attempt
		if (attempt == null) {
			log.error("** MemberServiceImpl - login Error **");
			log.error("** 로그인 실패, 입력한 ID에 해당하는 회원이 없음 **");
			return null;
		} else {
			if (BCrypt.checkpw(dto.getPw(), attempt.getPw())) {
				log.info("로그인 성공");
				return mapper.login(dto);
			} else {
				log.error("** MemberServiceImpl - login Error **");
				log.error("** 로그인 실패, 비밀번호가 일치하지 않음 **");
				return null;
			}
		}
	}

	@Override
	public void logout() {

	}

	@Override
	public void join(MemberDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public Integer modify(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer remove(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

}
