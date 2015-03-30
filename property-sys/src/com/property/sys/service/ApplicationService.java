package com.property.sys.service;

import java.util.List;

import com.property.sys.model.Application;
import com.sechand.platform.base.BaseService;

public interface ApplicationService extends BaseService {
	public int save(Application app,int type);
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-23下午10:10:29
	 * @return
	 * int
	 * @TODO 获取未处理的条数
	 */
	public int countUnhandle();
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-23下午10:49:11
	 * @param currentPage
	 * @param pageSize
	 * @param keyword
	 * @return
	 * @TODO
	 */
	public List<Application> listPageRowsApplicationsByKeyword(int currentPage,int pageSize,String keyword);
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
	 * @author lixiaowei
	 * 2015-3-30 下午1:59:09
	 * @param ids 
	 * TODO 批量删除
	 */
	public void deleteByIds(String[] ids);
	/**
	 * 
	 * @author lixiaowei
	 * 2015-3-30 下午2:16:08
	 * @param ids
	 * @return 
	 * TODO 批量通过申请
	 */
	public void pass(String[] ids);
}
