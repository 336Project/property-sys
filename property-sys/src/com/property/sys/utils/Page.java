package com.property.sys.utils;

public class Page {
	private Integer crr;//当前页
	private Integer total;	//总条数	
	private Integer size;	//显示大小
	private Integer first;//首页
	private Integer end; //尾页
	private Integer up;//上一页
	private Integer down;//下一页	
	
	
	public Page(Integer crr, Integer total, Integer size) {
		super();
		this.size = size;
		this.total = total;
		if(total==0){
			crr = up = down = first  = end = 1;
		}
		this.crr = crr;
		first = 1;
		if(total%size!=0){
			end = total/size+1;
		}else{
			end=total/size;
		}
		if(crr==1){
			up = 1;
			if(crr==end){
				down=end;
			}else{
				down = crr+1;
			}
		}else{
			up = crr-1;
			if(crr==end){
				down=end;
			}else{
				down = crr+1;
			}
		}
	}
	public Integer getCrr() {
		return crr;
	}
	public void setCrr(Integer crr) {
		this.crr = crr;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getFirst() {
		return first;
	}
	public void setFirst(Integer first) {
		this.first = first;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	public Integer getUp() {
		return up;
	}
	public void setUp(Integer up) {
		this.up = up;
	}
	public Integer getDown() {
		return down;
	}
	public void setDown(Integer down) {
		this.down = down;
	}
}
