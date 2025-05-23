package com.midproject.tripin.model;

import lombok.Data;

@Data
public class ReviewVO {
	private Integer review_id;
	private Integer user_id;
	private Integer dest_id;
	private Integer rating;
	private String content;
	private String created_at;
	
	//조인 때문에 추가
	private String dest_name;
}
