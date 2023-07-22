package com.team2.domain.api;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class LocationDTO {
	private int area;
	private String dist1;
	private String dist2;
	private String dist3;
	private String addr;
	private String str_addr;
	private int zipcode;
	private double x;
	private double y;
	private String building;

}