package com.team2.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
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

	@Autowired
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
		MemberDTO result = mapper.preLogin(dto);
		if (result != null) {
			return result;
		} else {
			return null;
		}
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		MemberDTO plain = dto;
		MemberDTO hashed = preLogin(plain);
		// 로그인이 유효한 회원인지 체크
		if (hashed != null) {
			boolean isCorrect = BCrypt.checkpw(plain.getPw(), hashed.getPw());
			if (isCorrect) {
				// 비밀번호 일치
				return mapper.login(dto);
			} else {
				// 비밀번호 불일치
				log.error("** MemberServiceImpl login(): 비밀번호 불일치 **");
				dto.setSerial_no(-2);
				return dto;
			}
		} else {
			log.error("** MemberServiceImpl login(): 입력한 ID에 해당하는 회원이 없음 **");
			dto.setSerial_no(-1);
			return dto;
		}
	}

	@Override
	public void logout() {
		// Controller에서 session에 저장된 Attribute 제거
	}

	@Override
	public Integer join(MemberDTO dto) throws DataIntegrityViolationException {
		dto.setPw(encrypt(dto.getPw()));
		return mapper.join(dto);
	}

	@Override
	public Integer modify(MemberDTO dto) throws DataIntegrityViolationException {
		dto.setPw(encrypt(dto.getPw()));
		return mapper.update(dto);
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
