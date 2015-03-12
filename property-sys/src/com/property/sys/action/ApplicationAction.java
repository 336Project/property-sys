package com.property.sys.action;

import com.property.sys.model.Application;
import com.property.sys.service.ApplicationService;
import com.sechand.platform.base.BaseAction;

public class ApplicationAction extends BaseAction {
	private static final long serialVersionUID = 4019962411786162070L;
	
	private ApplicationService applicationService;
	private Application app;
	private int type;
	
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
}
