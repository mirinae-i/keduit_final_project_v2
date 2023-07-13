package com.team2.domain.board;

import com.team2.domain.generic.Criteria;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class PageDTO {
	// ����¡ ó������ ǥ�õ� ���� ������
	private int startPage;
	
	// ����¡ ó������ǥ�õ� �� ������
	// ǥ�õ� ������ ��ȣ�� ������ �����ϴµ� ���
	private int endPage;
	
	// ���� ���� �������� �ִ����� ���� ����
	private boolean prev, next;
	
	// ��ü �������� ����
	private int total;
	
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// ���� ������ ��ȣ�� 15�� 20!!
		// ���⼭ 10�� ����¡�� ����! �ؿ� ����¡ ��ŭ �Ұ���!
		this.endPage = (int)(Math.ceil(cri.getPageNum() /10.0))*10 ;
		this.startPage = this.endPage - 9;
		
		// ���� ������ ������ ��ȣ�� ��Ÿ��
		int realEnd = (int)(Math.ceil((total*1.0) / cri.getAmount())) ;
		
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage>1;
		this.next =this.endPage < realEnd;
	}

}
