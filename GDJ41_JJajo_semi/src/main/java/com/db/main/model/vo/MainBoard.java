package com.db.main.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class MainBoard {
	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String deleteYn;
	private Date updateDate;
	private String memberNo;
}
