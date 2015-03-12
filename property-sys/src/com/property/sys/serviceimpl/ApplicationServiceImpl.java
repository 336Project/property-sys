package com.property.sys.serviceimpl;

import java.util.Date;

import com.property.sys.model.Application;
import com.property.sys.service.ApplicationService;
import com.property.sys.utils.SysUtils;
import com.sechand.platform.base.BaseServiceImpl;

public class ApplicationServiceImpl extends BaseServiceImpl implements
		ApplicationService {

	@Override
	public int save(Application app,int type) {
		if(app!=null&&type>=1&&type<=3){
			app.setApplyTime(SysUtils.getDateFormat(new Date()));
			app.setStatus(Application.STATUS_APPLYING);
			switch (type) {
				case 1:
					app.setType(Application.TYPE_CHECK_IN);
					break;
				case 2:
					app.setType(Application.TYPE_REPAIR);
					break;
				case 3:
					app.setType(Application.TYPE_FITMENT);
					break;
				default:
					break;
			}
			return baseDao.save(app);
		}
		return 0;
	}
	
}
