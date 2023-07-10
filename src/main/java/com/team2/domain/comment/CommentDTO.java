package com.team2.domain.comment;

import java.sql.Timestamp;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class CommentDTO {
	int c_no, c_parent;
	String c_content;
	Timestamp c_date;
	String c_id;

}
