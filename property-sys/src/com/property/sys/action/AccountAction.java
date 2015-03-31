package com.property.sys.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.property.sys.model.Account;
import com.property.sys.service.AccountService;
import com.property.sys.utils.DataTableParams;
import com.sechand.platform.base.BaseAction;

public class AccountAction extends BaseAction {
	private static final long serialVersionUID = 8249786842288013721L;
	private AccountService accountService;
	private String dataTableParams;//表单参数,json格式
	private Account account;
	private String ids;
	
	/**
	 * 
	 * @author lixiaowei
	 * 2015-1-15 下午4:29:47
	 * @return 
	 * TODO 获取账户列表信息
	 */
	public String listAccountsByParams(){
		DataTableParams params=DataTableParams.getInstance();
		params.parse(dataTableParams);
		Map<String, Object> dataMap=new HashMap<String, Object>();
		List<Account> accounts=accountService.listPageRowsAccountsByKeyword(params.current_page, params.page_size, params.keyword,true);
		int count=accountService.countByKeyword(params.keyword,true);
		dataMap.put("recordsTotal", count);
		dataMap.put("recordsFiltered", count);
		dataMap.put("draw",params.draw);
		dataMap.put("data", accounts);
		json.setMsg(dataMap);
		json.setSuccess(true);
		return SUCCESS;
	}
	/**
	 * 
	 * 2015-1-15 下午5:25:59
	 * @return 
	 * TODO 账户充值(管理员操作)
	 */
	public String recharge(){
		if(account!=null) account.setSource(Account.SOURCE_PLATFORM);
		if(accountService.add(account)>0){
			json.setMsg("充值成功，等待确认!");
			json.setSuccess(true);
		}else{
			json.setMsg("充值失败!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	/**
	 * 
	 * @author lixiaowei
	 * 2015-1-15 下午6:05:58
	 * @return 
	 * TODO 确认充值
	 */
	public String confirmAccount(){
		String msg=accountService.confirmById(ids);
		if(StringUtils.isNotBlank(msg)){
			json.setMsg(msg);
			json.setSuccess(true);
		}else{
			json.setMsg("确认失败!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	/**
	 * 
	 * 2015-1-16 上午10:44:04
	 * @return 
	 * TODO 批量删除充值记录
	 */
	public String deleteAccountByIds(){
		if(StringUtils.isNotBlank(ids)){
			accountService.deleteByIds(ids.split(","));
			json.setMsg("删除成功!");
			json.setSuccess(true);
		}else{
			json.setMsg("删除失败!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	
	//用户操作
	/**
	 * 
	 * 2015-1-16 下午1:09:42
	 * @return 
	 * TODO 用户取消充值记录
	 */
	public String cancelAccountById(){
		String msg=accountService.cancelById(ids);
		if(StringUtils.isNotBlank(msg)){
			json.setMsg(msg);
			json.setSuccess(true);
		}else{
			json.setMsg("取消失败!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	/**
	 * 2015-1-16 下午1:11:57
	 * @return 
	 * TODO 用户申请充值
	 */
	public String applyRecharge(){
		if(account!=null) account.setSource(Account.SOURCE_USER);
		if(accountService.add(account)>0){
			json.setMsg("充值成功，等待确认!");
			json.setSuccess(true);
		}else{
			json.setMsg("充值失败!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	/**
	 * 
	 * 2015-1-16 下午1:41:18
	 * @return 
	 * TODO 获取相关用户的账户信息
	 */
	public String listAccountsByUser(){
		DataTableParams params=DataTableParams.getInstance();
		params.parse(dataTableParams);
		Map<String, Object> dataMap=new HashMap<String, Object>();
		List<Account> accounts=accountService.listPageRowsAccountsByKeyword(params.current_page, params.page_size, params.keyword,false);
		int count=accountService.countByKeyword(params.keyword,false);
		dataMap.put("recordsTotal", count);
		dataMap.put("recordsFiltered", count);
		dataMap.put("draw",params.draw);
		dataMap.put("data", accounts);
		json.setMsg(dataMap);
		json.setSuccess(true);
		return SUCCESS;
	}
	
	
	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public String getDataTableParams() {
		return dataTableParams;
	}
	public void setDataTableParams(String dataTableParams) {
		this.dataTableParams = dataTableParams;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
