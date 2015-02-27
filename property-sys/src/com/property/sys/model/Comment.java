package com.property.sys.model;

import java.io.Serializable;
/**
 * 评论表
 */
public class Comment implements Serializable{
	private static final long serialVersionUID = -6152958021585198911L;
	
	private Integer id;
	private Integer articleId;//关联的文章id
	private Integer userId;//关联的用户id
	private String reviewer;//评论者
	private String content;//评论内容
	private String publishTime;//发表时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	
}
