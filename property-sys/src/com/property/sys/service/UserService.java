package com.property.sys.service;

import java.util.List;

import com.property.sys.model.User;
import com.sechand.platform.base.BaseService;




public interface UserService extends BaseService{
	public User login(String username,String password,String roleName);
	public String add(User user);
	public List<User> listUsers();
	/**
	 * 
	 * 2015-1-6 下午12:43:16
	 * @param currentPage
	 * @param pageSize
	 * @param keyword
	 * @return 
	 * TODO 根据搜索关键字分页获取数据
	 */
	public List<User> listPageRowsUsersByKeyword(int currentPage,int pageSize,String keyword);
	/**
	 * 
	 * 2015-1-6 下午12:54:15
	 * @param keyword
	 * @return 
	 * TODO 根据搜索关键字统计记录条数
	 */
	public int countByKeyword(String keyword);
	/**
	 * 
	 * 2015-1-8 下午4:50:25
	 * @param ids 
	 * TODO 批量删除
	 */
	public void deleteByIds(String[] ids);
	/**
	 * 
	 * 2015-1-13 上午11:21:33
	 * @param account
	 * @return 
	 * TODO 更新用户信息
	 */
	public boolean updateUser(User account);
}
