package com.midproject.tripin.model;

import lombok.Data;

@Data
public class PlaceVO {
	private Integer dest_id;
	private String dest_name;
	private String dest_type;
	private String repr_img_url;
	private String full_address;
	private String contact_num;
	private String oper_hours;
	private String fee_info;
	private String rel_keywords;
	private String orig_json_data;
	
	private Float avg_rating;
	private Integer review_count;
}
