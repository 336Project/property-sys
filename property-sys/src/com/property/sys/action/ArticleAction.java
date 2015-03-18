package com.property.sys.action;

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
	private Article article;
	private String options;
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-18下午9:15:28
	 * @return
	 * String
	 * @TODO 获取文章
	 */
	public String list(){
		List<Article> articles=articleService.listPageRowsByType(currentPage, pageSize,type);
		Page page=new Page(currentPage, articleService.countByType(type), pageSize);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", articles);
		map.put("curent", page.getCrr());
		map.put("pg", page.getEnd());
		json.setSuccess(true);
		json.setMsg(map);
		return SUCCESS;
	}
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-18下午9:17:25
	 * @return
	 * String
	 * @TODO 发布文章
	 */
	public String publish(){
		String[] opts=options.split(",");
		if(opts!=null&&opts.length>=2){
			int id=articleService.add(article, opts);
			if(id>0){
				json.setMsg("发布成功!");
				json.setSuccess(true);
			}else {
				json.setMsg("发布失败!");
				json.setSuccess(false);
			}
		}else{
			json.setMsg("投票必须至少有两个选项!");
			json.setSuccess(false);
		}
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
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
}
