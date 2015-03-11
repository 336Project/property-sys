package com.property.sys.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.property.sys.model.Article;
import com.property.sys.service.ArticleService;
import com.property.sys.utils.Page;
import com.sechand.platform.base.BaseAction;

public class ArticleAction extends BaseAction {
	private static final long serialVersionUID = -3008564197229636900L;
	
	private ArticleService articleService;
	private int currentPage=1;
	private int pageSize=9;
	private int type;
	public String list(){
		List<Article> articles=articleService.listPageRowsByType(currentPage, pageSize,type);
		Map<String, Object> dataMap=new HashMap<String, Object>();
		List<Map<String, Object>> dataList=new ArrayList<Map<String,Object>>();
		if(articles!=null){
			for (Article article : articles) {
				Map<String, Object> obj=new HashMap<String, Object>();
				obj.put("title", article.getTitle());
				obj.put("author", article.getAuthor());
				obj.put("content", article.getContent());
				obj.put("date", article.getPublishDate());
				dataList.add(obj);
			}
		}
		Page page=new Page(currentPage, articleService.countByType(type), pageSize);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", dataList);
		map.put("curent", page.getCrr());
		map.put("pg", page.getEnd());
		dataMap.put("data", map);
		json.setSuccess(true);
		json.setMsg(dataMap);
		return SUCCESS;
	}
	
	
	public ArticleService getArticleService() {
		return articleService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
