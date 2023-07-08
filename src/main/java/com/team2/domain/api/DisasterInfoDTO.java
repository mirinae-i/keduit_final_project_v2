package com.team2.domain.api;

import java.util.List;

import lombok.Data;

@Data
public class DisasterInfoDTO {

	private Head head;
	private List<Row> row;

	@Data
	public class Head {

		private String totalCount;
		private String numOfRows;
		private String pageNo;
		private String type;
		private RESULT RESULT;

		@Data
		public class RESULT {

			private String resultCode;
			private String resultMsg;

		}

	}

	@Data
	public class Row {

		private String create_date;
		private String location_id;
		private String location_name;
		private String md101_sn;
		private String msg;
		private String send_platform;

	}

}
