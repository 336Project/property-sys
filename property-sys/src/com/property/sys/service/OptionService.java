package com.property.sys.service;

import java.util.List;

import com.property.sys.model.Option;
import com.sechand.platform.base.BaseService;

public interface OptionService extends BaseService {
	/**
	 * 
	 * @author lixiaowei
	 * 2015-3-31 下午12:13:30
	 * @param option
	 * @return 
	 * TODO 添加选项
	 */
	public int add(Option option);
	/**
	 * 
	 * @author lixiaowei
	 * 2015-3-31 下午12:14:35
	 * @param articleId
	 * @return 
	 * TODO 获取文章选项
	 */
	public List<Option> listByArticleId(int articleId);
	/**
	 * 
	 * @author lixiaowei
	 * 2015-3-31 下午12:17:14
	 * @param option 
	 * TODO 选项支持人数+1
	 */
	public void increaseSupporter(int id);
}
