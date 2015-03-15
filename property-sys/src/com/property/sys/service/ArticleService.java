package com.property.sys.service;

import java.util.List;

import com.property.sys.model.Article;
import com.sechand.platform.base.BaseService;

public interface ArticleService extends BaseService {
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-15下午2:07:42
	 * @param currentPage
	 * @param pageSize
	 * @param type 0:：全部，1：社区活动，2投诉，3：咨询，4：社会议题，5：投票，6：公告
	 * @return
	 * List<Article>
	 * @TODO
	 */
	public List<Article> listPageRowsByType(int currentPage,int pageSize,int type);
	public int countByType(int type);
}
