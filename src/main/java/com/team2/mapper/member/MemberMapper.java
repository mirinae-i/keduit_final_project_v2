package com.team2.mapper.member;

import com.team2.domain.member.MemberDTO;

public interface MemberMapper {

	// 암호화된 PW값 불러오기
	public MemberDTO preLogin(MemberDTO dto);
	
	// 로그인
	public MemberDTO login(MemberDTO dto);

	// 회원 가입
	public Integer join(MemberDTO dto);

	// 중복 체크(ID, 닉네임, 이메일)
	public boolean isDuplicated(MemberDTO dto);

	// 회원 정보 조회
	public MemberDTO select(MemberDTO dto);

	// 회원 정보 수정
	public Integer update(MemberDTO dto);

	// 회원 등급 체크
	public Integer chkGrade(MemberDTO dto);

	// 회원 유효성 체크
	public Integer chkAvailablity(MemberDTO dto);

	// 회원 탈퇴(Update valid)
	public Integer updateValid(MemberDTO dto);

}
