package com.property.sys.serviceimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.property.sys.model.Application;
import com.property.sys.model.User;
import com.property.sys.service.ApplicationService;
import com.property.sys.utils.SysUtils;
import com.sechand.platform.base.BaseServiceImpl;
import com.sechand.platform.base.BaseUtil;

public class ApplicationServiceImpl extends BaseServiceImpl implements
		ApplicationService {

	@Override
	public int save(Application app,int type) {
		User user=(User) BaseUtil.getSession(BaseUtil.KEY_LOGIN_USER_SESSION);
		if(user!=null&&app!=null&&type>=1&&type<=3){
			app.setUserId(user.getId());
			app.setUserName(user.getUserName());
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

	@Override
	public int countUnhandle() {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", Application.STATUS_APPLYING);
		return baseDao.countByClassNameAndParams(Application.class, map);
	}

	@Override
	public List<Application> listPageRowsApplicationsByKeyword(int currentPage,
			int pageSize, String keyword) {
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_realName_like", keyword);
			whereParams.put("or_contactNumber_like", keyword);
			whereParams.put("or_type_like", keyword);
			whereParams.put("or_content_like",keyword);
			whereParams.put("or_status_like",keyword);
			whereParams.put("or_address_like", keyword);
			whereParams.put("or_reply_like", keyword);
		}
		return baseDao.listPageRowsByClassNameAndParams(Application.class, whereParams, currentPage, pageSize);
	}

	@Override
	public int countByKeyword(String keyword) {
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_realName_like", keyword);
			whereParams.put("or_contactNumber_like", keyword);
			whereParams.put("or_type_like", keyword);
			whereParams.put("or_content_like",keyword);
			whereParams.put("or_status_like",keyword);
			whereParams.put("or_address_like", keyword);
			whereParams.put("or_reply_like", keyword);
		}
		return baseDao.countByClassNameAndParams(Application.class, whereParams);
	}

	@Override
	public void deleteByIds(String[] ids) {
		baseDao.deleteByClassNameAndIds(Application.class, ids);
	}

	@Override
	public void pass(String[] ids) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", Application.STATUS_COMPLETE);
		map.put("completeTime", SysUtils.getDateFormat(new Date()));
		baseDao.updateColumnsByParmas(Application.class, ids, map);
		for (String id : ids) {
			Application app=baseDao.getByClassNameAndId(Application.class, id);
			if(app.getType().equals(Application.TYPE_CHECK_IN)){//入住申请，通过审核后，修改用户信息
				User u=baseDao.getByClassNameAndId(User.class, app.getUserId());
				u.setUnit(app.getAddress());
				baseDao.update(u);
			}
		}
	}

	@Override
	public String replyById(String id, int type, String reply) {
		try{
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("completeTime", SysUtils.getDateFormat(new Date()));
			switch (type) {
			case 1://通过
				map.put("status", Application.STATUS_COMPLETE);
				break;
			case 2://不通过
				if(StringUtils.isBlank(reply)) return "回复内容不能为空";
				map.put("status", Application.STATUS_NO_PASS);
				break;
			default:
				break;
			}
			map.put("reply", reply);
			baseDao.updateColumnsByParmas(Application.class, id, map);
			Application app=baseDao.getByClassNameAndId(Application.class, id);
			if(app.getType().equals(Application.TYPE_CHECK_IN)){//入住申请，通过审核后，修改用户信息
				User u=baseDao.getByClassNameAndId(User.class, app.getUserId());
				u.setUnit(app.getAddress());
				baseDao.update(u);
			}
		}catch(Exception e){
			return "系统错误";
		}
		return "";
	}
	
}
