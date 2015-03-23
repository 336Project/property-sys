package com.property.sys.serviceimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.property.sys.model.Article;
import com.property.sys.model.Option;
import com.property.sys.model.User;
import com.property.sys.service.ArticleService;
import com.property.sys.utils.SysUtils;
import com.sechand.platform.base.BaseServiceImpl;
import com.sechand.platform.base.BaseUtil;

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

	@Override
	public int add(Article article, String[] optionNames) {
		User user=(User) BaseUtil.getSession(BaseUtil.KEY_LOGIN_USER_SESSION);
		if(article!=null){
			article.setAuthor(user.getUserName());
			article.setUserId(user.getId());
			article.setPublishDate(SysUtils.getDateFormat(new Date()));
			int id=baseDao.save(article);
			if(id>0){
				for (String name : optionNames) {
					Option option=new Option();
					option.setArticleId(id);
					option.setName(name);
					baseDao.save(option);
				}
			}
			return id;
		}
		return 0;
	}

	@Override
	public Article getById(int id) {
		//并发问题
		Article article=baseDao.getByClassAndId(Article.class, id);
		article.setVisitors(article.getVisitors()+1);
		baseDao.updateColumnById(Article.class, "visitors", article.getVisitors(), id);
		return article;
	}

}
