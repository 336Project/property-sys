package com.property.sys.model;

import java.io.Serializable;
/**
 * 选项表
 */
public class Option implements Serializable {
	private static final long serialVersionUID = -2473981918214395818L;
	
	private Integer id;
	private Integer articleId;//关联的文章id
	private String name;//选项名称
	private long supporters;//支持人数
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getSupporters() {
		return supporters;
	}
	public void setSupporters(long supporters) {
		this.supporters = supporters;
	}
}
