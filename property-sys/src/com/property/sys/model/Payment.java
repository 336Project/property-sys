package com.property.sys.model;

import java.io.Serializable;

/**
 * 缴费
 */
public class Payment implements Serializable{
	private static final long serialVersionUID = -7274533944160378065L;
	public static String STATUS_TO_PAY="未支付";
	public static String STATUS_PAY="已支付";
	private Integer id;
	private Integer userId;//用户id
	private String userName;//缴费用户
	private String createTime;//生成时间
	private String endTime;//缴费截止时间
	private String payTime;//用户缴费时间
	private String money;//缴费总额
	private String status;//状态
	private String remark;//备注
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
