package com.team2.domain.board;

import java.sql.Timestamp;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class BoardDTO {
	private Integer b_no;
	private String b_title;
	private String b_content;
	private String b_image;
	private Timestamp b_date;
	private Integer b_views;
	private String m_id;

}
