package com.team2.domain.generic;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
// 이거 3개 대신 @Data하면 끝..(lombok)..!!짱!
public class Criteria {
	// 페이지 번호
	private int pageNum;
	
	//한 페이지에 표시될 게시물의 개수
	private int amount;
	
	private int start;
	
	// 검색 시 검색 타입 저장
	private String type;
	// 검색시 사용자가 입력한 검색어 저장
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.start = (pageNum-1) * amount;
	}
	public int getStart() {
		this.start = (this.pageNum-1)*this.amount;
		System.out.println("start:"+this.start);
		return this.start;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
}
