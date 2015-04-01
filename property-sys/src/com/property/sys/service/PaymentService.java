package com.property.sys.service;

import java.util.List;

import com.property.sys.model.PayItem;
import com.property.sys.model.Payment;
import com.sechand.platform.base.BaseService;

public interface PaymentService extends BaseService {
	/**
	 * 
	 * @Author:Helen  
	 * 2015-4-1下午9:06:01
	 * @param payment
	 * @param items
	 * @return
	 * String
	 * @TODO 新增缴费
	 */
	public String add(Payment payment,List<PayItem> items);
	/**
	 * 
	 * @Author:Helen  
	 * 2015-4-1下午9:07:35
	 * @param currentPage
	 * @param pageSize
	 * @param keyword
	 * @return
	 * List<Payment>
	 * @TODO 分页显示缴费记录
	 */
	public List<Payment> listPageRowPaymentsByKeyword(int currentPage,int pageSize,String keyword);
	/**
	 * 
	 * @Author:Helen  
	 * 2015-4-1下午9:08:18
	 * @param keyword
	 * @return
	 * int
	 * @TODO 统计
	 */
	public int countByKeyword(String keyword);
	
	/**
	 * 
	 * @author lixiaowei
	 * 2015-3-30 下午1:59:09
	 * @param ids 
	 * TODO 批量删除
	 */
	public void deleteByIds(String[] ids);
}
