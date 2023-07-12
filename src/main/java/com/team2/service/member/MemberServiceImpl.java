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
	public boolean isAdmin(MemberDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isValid(MemberDTO dto) {
		if (dto.getValid() != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public MemberDTO preLogin(MemberDTO dto) {
		return mapper.preLogin(dto);
	}

	@Override
	public MemberDTO login(MemberDTO dto) { // 평문 pw가 담긴 dto
		MemberDTO attempt = preLogin(dto); // 해시된 pw가 담긴 attempt
		// attempt: -1: ID Error | -2: PW Error | -3 탈퇴한 회원
		if (attempt == null) {
			log.error("** MemberServiceImpl - login Error **");
			log.error("** 로그인 실패, 입력한 ID에 해당하는 회원이 없음 **");
			attempt = new MemberDTO();
			attempt.setSerial_no(-1);
			return attempt;
		} else {
			if (BCrypt.checkpw(dto.getPw(), attempt.getPw())) {
				if (isValid(attempt)) {
					log.info("** 로그인 성공 **");
					return mapper.login(dto);
				} else {
					log.error("** MemberServiceImpl - login Error **");
					log.error("** 로그인 실패, 이미 탈퇴한 회원임 **");
					attempt.setSerial_no(-3);
					return attempt;
				}
			} else {
				log.error("** MemberServiceImpl - login Error **");
				log.error("** 로그인 실패, 비밀번호가 일치하지 않음 **");
				attempt.setSerial_no(-2);
				return attempt;
			}
		}
	}

	@Override
	public void logout() {
		// MemberController에서 session을 invalidate 처리
	}

	@Override
	public Integer join(MemberDTO dto) {
		dto.setPw(encrypt(dto.getPw()));
		return mapper.join(dto);

	}

	@Override
	public Integer modify(MemberDTO dto) {
		dto.setPw(encrypt(dto.getPw()));
		return mapper.update(dto);
	}

	@Override
	public Integer remove(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

	private String encrypt(String plain) {
		return BCrypt.hashpw(plain, BCrypt.gensalt(12));
	}

}
