package com.property.sys.serviceimpl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.property.sys.model.Role;
import com.property.sys.model.User;
import com.property.sys.service.UserService;
import com.property.sys.utils.SysUtils;
import com.sechand.platform.base.BaseServiceImpl;


public class UserServiceImpl extends BaseServiceImpl implements UserService{

	@Override
	public User login(String username, String password,String roleType) {
		Map<String, Object> whereParams=new HashMap<String, Object>();
		whereParams.put("userName", username);
		whereParams.put("password", SysUtils.encrypt(password));
		whereParams.put("roleCode", roleType);
		return baseDao.getByClassNameAndParams(User.class, whereParams);
	}

	@Override
	public String add(User user) {
		if(user!=null){
			Map<String, Object> whereParams=new HashMap<String, Object>();
			whereParams.put("code", user.getRoleCode());
			Role role=baseDao.getByClassNameAndParams(Role.class, whereParams);
			if(role==null){
				return "注册失败,该角色不存在!";
			}
			if(StringUtils.isBlank(user.getUserName())){
				return "用户名不能为空!";
			}
			whereParams.clear();
			whereParams.put("userName", user.getUserName());
			User u=baseDao.getByClassNameAndParams(User.class, whereParams);
			if(u!=null){
				return "该用户名已存在,请重新注册!";
			}
			whereParams.clear();
			whereParams.put("nickName", user.getNickName());
			u=baseDao.getByClassNameAndParams(User.class, whereParams);
			if(u!=null){
				return "该昵称太抢手啦,已经被人注册过了，请重新填写!";
			}
			u=new User();
			u.setBalance("0");
			u.setEmail(user.getEmail());
			u.setIntroduction(user.getIntroduction());
			u.setNickName(user.getNickName());
			u.setPassword(SysUtils.encrypt(user.getPassword()));
			u.setRegisterTime(SysUtils.getDateFormat(new Date()));
			u.setRoleCode(role.getCode());
			u.setRoleName(role.getName());
			u.setSource(user.getSource());
			u.setStatus(User.STATUS_NORMAL);
			u.setTel(user.getTel());
			u.setUserName(user.getUserName());
			int id=baseDao.save(u);
			if(id>0){
				return "恭喜,注册成功!";
			}else{
				return "不好意思，服务器异常,请稍后再试!";
			}
		}
		return null;
	}

	@Override
	public List<User> listUsers() {
		return baseDao.listByClassName(User.class);
	}

	@Override
	public List<User> listPageRowsUsersByKeyword(int currentPage,
			int pageSize, String keyword) {
		/*String hql="from Account where 1=1";
		if(!StringUtils.isEmpty(keyword)){
			hql+=" and (userName like '%"+keyword+"%' or realName like '%"+keyword+"%' or nickName like '%"+keyword+"%' or email like '%"+keyword+"%' or tel like '%"+keyword+"%')";
		}
		return baseDao.listPageRowsByHQL(hql, currentPage, pageSize);*/
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_userName_like", keyword);
			whereParams.put("or_realName_like", keyword);
			whereParams.put("or_nickName_like", keyword);
			whereParams.put("or_email_like", keyword);
			whereParams.put("or_tel_like", keyword);
			whereParams.put("or_status_like",keyword);
			whereParams.put("or_balance_like",keyword);
		}
		return baseDao.listPageRowsByClassNameAndParams(User.class, whereParams, currentPage, pageSize);
	}

	@Override
	public int countByKeyword(String keyword) {
		/*String hql="from Account where 1=1";
		if(!StringUtils.isEmpty(keyword)){
			hql+=" and (userName like '%"+keyword+"%' or realName like '%"+keyword+"%' or nickName like '%"+keyword+"%' or email like '%"+keyword+"%' or tel like '%"+keyword+"%')";
		}
		return baseDao.countByHQL(hql);*/
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_userName_like", keyword);
			whereParams.put("or_realName_like", keyword);
			whereParams.put("or_nickName_like", keyword);
			whereParams.put("or_email_like", keyword);
			whereParams.put("or_tel_like", keyword);
			whereParams.put("or_status_like", keyword);
		}
		return baseDao.countByClassNameAndParams(User.class, whereParams);
	}

	@Override
	public void deleteByIds(String[] ids) {
		baseDao.deleteByClassNameAndIds(User.class, ids);
	}

	@Override
	public boolean updateUser(User user) {
		try {
			Map<String, Object> parmas=new HashMap<String, Object>();
			parmas.put("email", user.getEmail());
			parmas.put("tel", user.getTel());
			parmas.put("introduction", user.getIntroduction());
			baseDao.updateColumnsByParmas(User.class, user.getId(), parmas);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
