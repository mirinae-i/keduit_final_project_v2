package com.team2.domain.board;

import com.team2.domain.generic.Criteria;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class PageDTO {
	// 페이징 처리에서 표시될 시작 페이지
	private int startPage;
	
	// 페이징 처리에서표시될 끝 페이지
	// 표시될 페이지 번호의 범위를 결정하는데 사용
	private int endPage;
	
	// 이전 이후 페이지가 있는지에 대한 여부
	private boolean prev, next;
	
	// 전체 데이터의 개수
	private int total;
	
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 현재 페이지 번호가 15면 20!!
		// 여기서 10은 페이징의 수야! 밑에 페이징 얼만큼 할건지!
		this.endPage = (int)(Math.ceil(cri.getPageNum() /10.0))*10 ;
		this.startPage = this.endPage - 9;
		
		// 실제 마지막 페이지 번호를 나타냄
		int realEnd = (int)(Math.ceil((total*1.0) / cri.getAmount())) ;
		
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage>1;
		this.next =this.endPage < realEnd;
	}

}
