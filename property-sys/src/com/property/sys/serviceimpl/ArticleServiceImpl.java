package com.property.sys.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.property.sys.model.Article;
import com.property.sys.service.ArticleService;
import com.sechand.platform.base.BaseServiceImpl;

public class ArticleServiceImpl extends BaseServiceImpl implements
		ArticleService {

	@Override
	public List<Article> listPageRowsByType(int currentPage,int pageSize,int type){
		Map<String, Object> whereMap=new HashMap<String, Object>();
		switch (type) {
		case 0:
			whereMap.put("order_by", "publishDate_desc");
			break;
		case 1:
			whereMap.put("order_by", "publishDate_desc");
			whereMap.put("type", Article.TYPE_COMMUNITY_ACTIVITIES);
			break;
		case 2:
			whereMap.put("order_by", "publishDate_desc");
			whereMap.put("type", Article.TYPE_COMPLAINT);
			break;
		case 3:
			whereMap.put("order_by", "publishDate_desc");
			whereMap.put("type", Article.TYPE_CONSULT);
			break;
		case 4:
			whereMap.put("order_by", "publishDate_desc");
			whereMap.put("type", Article.TYPE_COMMUNITY_ISSUES);
			break;
		case 5:
			whereMap.put("order_by", "publishDate_desc");
			whereMap.put("type", Article.TYPE_VOTE);
			break;
		case 6:
			whereMap.put("order_by", "publishDate_desc");
			whereMap.put("type", Article.TYPE_NOTICE);
			break;
		default:
			break;
		}
		
		return baseDao.listPageRowsByClassNameAndParams(Article.class, whereMap,currentPage, pageSize);
	}

	@Override
	public int countByType(int type) {
		Map<String, Object> whereMap=new HashMap<String, Object>();
		switch (type) {
		case 1:
			whereMap.put("type", Article.TYPE_COMMUNITY_ACTIVITIES);
			break;
		case 2:
			whereMap.put("type", Article.TYPE_COMPLAINT);
			break;
		case 3:
			whereMap.put("type", Article.TYPE_CONSULT);
			break;
		case 4:
			whereMap.put("type", Article.TYPE_COMMUNITY_ISSUES);
			break;
		case 5:
			whereMap.put("type", Article.TYPE_VOTE);
		case 6:
			whereMap.put("type", Article.TYPE_NOTICE);
			break;
		default:
			break;
		}
		return baseDao.countByClassNameAndParams(Article.class, whereMap);
	}

}
