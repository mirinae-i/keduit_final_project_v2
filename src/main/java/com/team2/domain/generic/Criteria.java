package com.team2.domain.generic;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class Criteria {
	// ������ ��ȣ
	private int pageNum;
			
	//�� �������� ǥ�õ� �Խù��� ����
	private int amount;
			
	private int start;
			
	// �˻� �� �˻� Ÿ�� ����
	private String type;
	// �˻��� ����ڰ� �Է��� �˻��� ����
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
