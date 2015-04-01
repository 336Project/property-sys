package com.property.sys.serviceimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

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
	public String add(Article article, String optionStr) {
		User user=(User) BaseUtil.getSession(BaseUtil.KEY_LOGIN_USER_SESSION);
		if(article!=null&&user!=null){
			if(StringUtils.isBlank(article.getTitle())){
				return "标题不能为空";
			}
			if(StringUtils.isBlank(article.getContent())||article.getContent().length()>300){
				return "内容不能为空且最多300个字符";
			}
			article.setAuthor(user.getUserName());
			article.setUserId(user.getId());
			article.setPublishDate(SysUtils.getDateFormat(new Date()));
			int id=baseDao.save(article);
			if(id<0){
				return "系统错误";
			}
			if(article.getType().equals(Article.TYPE_COMMUNITY_ACTIVITIES)||
					article.getType().equals(Article.TYPE_VOTE)){
				if(StringUtils.isBlank(optionStr)){
					return "投票必须至少有两个选项!";
				}else{
					String[] optionNames=optionStr.split(",");
					if(optionNames.length>=2){
						for (String name : optionNames) {
							Option option=new Option();
							option.setArticleId(id);
							option.setName(name);
							baseDao.save(option);
						}
					}else{
						return "投票必须至少有两个选项!";
					}
				}
			}
		}else{
			return "操作异常";
		}
		return "";
	}

	@Override
	public Article getById(int id) {
		//并发问题
		Article article=baseDao.getByClassAndId(Article.class, id);
		article.setVisitors(article.getVisitors()+1);
		baseDao.updateColumnById(Article.class, "visitors", article.getVisitors(), id);
		return article;
	}

	@Override
	public List<Article> listPageRowsArticlesByKeyword(int currentPage,
			int pageSize, String keyword) {
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_type_like", keyword);
			whereParams.put("or_title_like", keyword);
			whereParams.put("or_content_like", keyword);
			whereParams.put("or_author_like",keyword);
		}
		return baseDao.listPageRowsByClassNameAndParams(Article.class, whereParams, currentPage, pageSize);
	}

	@Override
	public int countByKeyword(String keyword) {
		Map<String, Object> whereParams=new HashMap<String, Object>();
		if(!StringUtils.isEmpty(keyword)){
			whereParams.put("or_type_like", keyword);
			whereParams.put("or_title_like", keyword);
			whereParams.put("or_content_like", keyword);
			whereParams.put("or_author_like",keyword);
		}
		return baseDao.countByClassNameAndParams(Article.class, whereParams);
	}

	@Override
	public void deleteByIds(String[] ids) {
		baseDao.deleteByClassNameAndIds(Article.class, ids);
		for(int i=0;i<ids.length;i++){//删除文章也将文章下的选项删除
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("articleId", ids[i]);
			baseDao.deleteByClassNameAndParams(Option.class, map);
		}
	}

}
