package com.team2.service.member;

import org.springframework.dao.DataIntegrityViolationException;

public interface MemberService<VO> {
	
	// 일반 회원/관리자 체크
	// 1: 일반 회원, 2~8: 스태프, 9: 관리자
	public boolean isAdmin(VO vo);
	
	// 유효한 회원인지 체크
	// 1: 유효, 0: 탈퇴한 회원
	public boolean isValid(VO vo);

	// 로그인 사전 작업 - 해시된 PW값 불러오기
	public VO preLogin(VO vo);
	
	// 로그인
	public VO login(VO vo);
	
	// 로그아웃
	public void logout();
	
	// 회원 가입
	public Integer join(VO vo) throws DataIntegrityViolationException;
	
	// 회원정보 수정
	public Integer modify(VO vo) throws DataIntegrityViolationException;

	// 회원 탈퇴
	public Integer remove(VO vo);

}
