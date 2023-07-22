package com.team2.domain.board;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class BoardDTO {
	private Integer b_no;
    private String b_title;
    private String b_content;
    private MultipartFile b_image; // 수정: MultipartFile로 타입 변경
    private String imageString;
    private List<String> imageList;
    private Timestamp b_date;
    private Integer b_views;
    private String m_id;

}

