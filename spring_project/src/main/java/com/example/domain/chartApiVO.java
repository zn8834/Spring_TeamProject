package com.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class chartApiVO {
	
	private String basDt;
	private String srtnCd;
	private String isinCd;
	private String itmsNm;
	private String mrktCtg;
	private String clpr;
	private String vs;
	private String fltRt;
	private String mkp;
	private String hipr;
	private String lopr;
	private String trqu;
	private String trPrc;
	private String lstgStCnt;
	private String mrktTotAmt;

}
