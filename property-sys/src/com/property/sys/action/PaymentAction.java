package com.property.sys.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.property.sys.model.PayItem;
import com.property.sys.model.Payment;
import com.property.sys.service.PaymentService;
import com.property.sys.utils.DataTableParams;
import com.sechand.platform.base.BaseAction;

public class PaymentAction extends BaseAction {
	private static final long serialVersionUID = -3675064533884727436L;
	private PaymentService paymentService;
	private String dataTableParams;//表单参数,json格式
	private String ids;
	private String id;
	private Payment payment;
	private String items;//List<Payment> json格式
	
	/**
	 * 
	 * @Author:Helen  
	 * 2015-4-1下午10:21:06
	 * @return
	 * String
	 * @TODO 添加缴费通知
	 */
	public String addPayment(){
		List<PayItem> payItems=JSONArray.parseArray(items, PayItem.class);
		String msg=paymentService.add(payment, payItems);
		if(StringUtils.isNotBlank(msg)){
			json.setMsg(msg);
			json.setSuccess(false);
		}else{
			json.setMsg("操作成功");
			json.setSuccess(true);
		}
		return SUCCESS;
	}
	
	/**
	 * 
	 * @Author:Helen  
	 * 2015-4-1下午9:15:22
	 * @return
	 * String
	 * @TODO 获取缴费列表
	 */
	public String listPaymentsByParams(){
		DataTableParams params=DataTableParams.getInstance();
		params.parse(dataTableParams);
		Map<String, Object> dataMap=new HashMap<String, Object>();
		List<Payment> payments=paymentService.listPageRowPaymentsByKeyword(params.current_page, params.page_size, params.keyword);
		int count=paymentService.countByKeyword(params.keyword);
		dataMap.put("recordsTotal", count);
		dataMap.put("recordsFiltered", count);
		dataMap.put("draw",params.draw);
		dataMap.put("data", payments);
		json.setMsg(dataMap);
		json.setSuccess(true);
		return SUCCESS;
	}
	/**
	 * 
	 * @Author:Helen  
	 * 2015-4-1下午11:50:39
	 * @return
	 * String
	 * @TODO 批量删除
	 */
	public String deletePaymentByIds(){
		if(!StringUtils.isBlank(ids)){
			String[] idList=ids.split(",");
			paymentService.deleteByIds(idList);
			json.setMsg("删除成功!");
			json.setSuccess(true);
		}else{
			json.setMsg("删除失败!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	/**
	 * 
	 * @Author:Helen  
	 * 2015-4-1下午11:56:16
	 * @return
	 * String
	 * @TODO 根据缴费记录id获取缴费明细
	 */
	public String listPayItemById(){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("payId", id);
		List<PayItem> items=paymentService.listByClassNameAndParams(PayItem.class, map);
		json.setMsg(items);
		json.setSuccess(true);
		return SUCCESS;
	}
	
	public PaymentService getPaymentService() {
		return paymentService;
	}


	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}


	public String getDataTableParams() {
		return dataTableParams;
	}


	public void setDataTableParams(String dataTableParams) {
		this.dataTableParams = dataTableParams;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
