package com.property.sys.model;

import java.io.Serializable;

/**
 * 缴费项(缴费明细)
 */
public class PayItem implements Serializable{
	private static final long serialVersionUID = -2519261532738161039L;
	private Integer id;
	private Integer payId;//关联缴费
	private String name;//明细名称
	private String money;//金额
	public Integer getPayId() {
		return payId;
	}
	public void setPayId(Integer payId) {
		this.payId = payId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
