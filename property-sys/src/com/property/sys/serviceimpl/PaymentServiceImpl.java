package com.property.sys.serviceimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.property.sys.model.PayItem;
import com.property.sys.model.Payment;
import com.property.sys.model.User;
import com.property.sys.service.PaymentService;
import com.property.sys.utils.SysUtils;
import com.sechand.platform.base.BaseServiceImpl;

public class PaymentServiceImpl extends BaseServiceImpl implements
		PaymentService {

	@Override
	public String add(Payment payment, List<PayItem> items) {
		if(payment!=null&&items!=null){
			User user=baseDao.getByClassNameAndId(User.class, payment.getUserId());
			if(user!=null){
				double money=0;
				try {
					for (PayItem item : items) {
						if(StringUtils.isBlank(item.getName())){
							return "缴费项名称不能为空";
						}
						if(StringUtils.isBlank(item.getMoney())){
							return "金额不能为空";
						}
						money+=Double.valueOf(item.getMoney());
					}
				} catch (Exception e) {
					return "请输入正确的金额格式";
				}
				if(items.size()>=1){
					payment.setCreateTime(SysUtils.getDateFormat(new Date()));
					payment.setStatus(Payment.STATUS_TO_PAY);
					payment.setUserName(user.getUserName());
					payment.setUserId(user.getId());
					payment.setMoney(SysUtils.getMoneyFormat(money));
					int id=baseDao.save(payment);
					if(id>0){
						for (PayItem item : items) {
							item.setPayId(id);
							baseDao.save(item);
						}
					}else{
						return "操作失败";
					}
				}else{
					return "至少要有一条缴费项";
				}
			}else{
				return "用户不存在";
			}
		}else{
			return "操作失败";
		}
		return "";
	}

	@Override
	public List<Payment> listPageRowPaymentsByKeyword(int currentPage,
			int pageSize, String keyword) {
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_userName_like", keyword);
			whereParams.put("or_createTime_like", keyword);
			whereParams.put("or_endTime_like", keyword);
			whereParams.put("or_payTime_like",keyword);
			whereParams.put("or_money_like",keyword);
			whereParams.put("or_status_like",keyword);
			whereParams.put("or_remark_like",keyword);
		}
		return baseDao.listPageRowsByClassNameAndParams(Payment.class, whereParams, currentPage, pageSize);
	}

	@Override
	public int countByKeyword(String keyword) {
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_userName_like", keyword);
			whereParams.put("or_createTime_like", keyword);
			whereParams.put("or_endTime_like", keyword);
			whereParams.put("or_payTime_like",keyword);
			whereParams.put("or_money_like",keyword);
			whereParams.put("or_status_like",keyword);
			whereParams.put("or_remark_like",keyword);
		}
		return baseDao.countByClassNameAndParams(Payment.class, whereParams);
	}

	@Override
	public void deleteByIds(String[] ids) {
		baseDao.deleteByClassNameAndIds(Payment.class, ids);
		for(int i=0;i<ids.length;i++){//删除缴费记录也将缴费项删除
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("payId", ids[i]);
			baseDao.deleteByClassNameAndParams(PayItem.class, map);
		}
	}
	
}
