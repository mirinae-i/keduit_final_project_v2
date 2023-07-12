package com.team2.domain.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDTO {

	private Integer serial_no;
	private String id;
	private Integer grade;
	private String pw;
	private String email;
	private String name;
	private Timestamp join_date;
	private Timestamp leave_date;
	private Integer valid;

}
