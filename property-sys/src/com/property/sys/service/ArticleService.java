package com.property.sys.service;

import java.util.List;

import com.property.sys.model.Article;
import com.sechand.platform.base.BaseService;

public interface ArticleService extends BaseService {
	
	public List<Article> listPageRowsByType(int currentPage,int pageSize,int type);
	public int countByType(int type);
}
