package com.property.sys.service;

import com.property.sys.model.Application;
import com.sechand.platform.base.BaseService;

public interface ApplicationService extends BaseService {
	public int save(Application app,int type);
}
