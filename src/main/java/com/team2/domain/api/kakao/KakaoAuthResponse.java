package com.team2.domain.api.kakao;


public class KakaoAuthResponse {
	String code, error, error_description, state;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getError_description() {
		return error_description;
	}

	public void setError_description(String error_description) {
		this.error_description = error_description;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "KakaoAuthResponse [code=" + code + ", error=" + error + ", error_description=" + error_description
				+ ", state=" + state + "]";
	}
}
