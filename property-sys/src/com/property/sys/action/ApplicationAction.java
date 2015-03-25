package com.property.sys.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.property.sys.model.Application;
import com.property.sys.service.ApplicationService;
import com.property.sys.utils.DataTableParams;
import com.sechand.platform.base.BaseAction;

public class ApplicationAction extends BaseAction {
	private static final long serialVersionUID = 4019962411786162070L;
	
	private ApplicationService applicationService;
	private Application app;
	private int type;
	private String dataTableParams;//表单参数,json格式
	
	public String apply(){
		int id=applicationService.save(app, type);
		if(id>0){
			json.setMsg("申请成功，等待处理!");
			json.setSuccess(true);
		}else{
			json.setMsg("申请失败，出现异常!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-23下午10:47:39
	 * @return
	 * String
	 * @TODO 获取申请列表
	 */
	public String listApplyByParams(){
		DataTableParams params=DataTableParams.getInstance();
		params.parse(dataTableParams);
		Map<String, Object> dataMap=new HashMap<String, Object>();
		List<Application> applications=applicationService.listPageRowsApplicationsByKeyword(params.current_page, params.page_size, params.keyword);
		int count=applicationService.countByKeyword(params.keyword);
		dataMap.put("recordsTotal", count);
		dataMap.put("recordsFiltered", count);
		dataMap.put("draw",params.draw);
		dataMap.put("data", applications);
		json.setMsg(dataMap);
		json.setSuccess(true);
		return SUCCESS;
	}
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-23下午10:12:41
	 * @return
	 * String
	 * @TODO 计算未待处理的申请
	 */
	public String countUnhandle(){
		json.setMsg(applicationService.countUnhandle());
		json.setSuccess(true);
		return SUCCESS;
	}
	
	public ApplicationService getApplicationService() {
		return applicationService;
	}

	public void setApplicationService(ApplicationService applicationService) {
		this.applicationService = applicationService;
	}

	public Application getApp() {
		return app;
	}

	public void setApp(Application app) {
		this.app = app;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	public String getDataTableParams() {
		return dataTableParams;
	}
	public void setDataTableParams(String dataTableParams) {
		this.dataTableParams = dataTableParams;
	}
}
