package net.fiveleaves.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;
	private Long clubNo;
	
	public Criteria() {
		this(1, 10);	// 기본값 1페이지, 한 페이지 당 10개
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
