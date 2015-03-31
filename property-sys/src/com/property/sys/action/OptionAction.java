package com.property.sys.action;

import com.property.sys.service.OptionService;
import com.sechand.platform.base.BaseAction;

public class OptionAction extends BaseAction {
	private static final long serialVersionUID = 3987399974336330753L;
	
	private OptionService optionService;
	private String id;
	
	/**
	 * 
	 * @author lixiaowei
	 * 2015-3-31 下午2:11:29
	 * @return 
	 * TODO 选项支持人数+1
	 */
	public String increase(){
		optionService.increaseSupporter(Integer.valueOf(id));
		json.setSuccess(true);
		return SUCCESS;
	}
	
	
	
	
	
	public OptionService getOptionService() {
		return optionService;
	}
	public void setOptionService(OptionService optionService) {
		this.optionService = optionService;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
