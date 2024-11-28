package net.fiveleaves.domain;

public class Criteria {
	
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10);	// 기본값 1페이지, 한 페이지 당 10개
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
