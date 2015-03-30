package com.property.sys.service;

import java.util.List;

import com.property.sys.model.Comment;
import com.sechand.platform.base.BaseService;

public interface CommentService extends BaseService {
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-29下午8:54:15
	 * @param comment
	 * @return
	 * int
	 * @TODO 发表评论
	 */
	public int add(Comment comment);
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-29下午9:08:24
	 * @param articleId
	 * @return
	 * List<Comment>
	 * @TODO 
	 */
	public List<Comment> listPageRowCommentsByArticleId(int articleId,int page,int size);
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-29下午10:06:38
	 * @param articleId
	 * @return
	 * int
	 * @TODO 根据文章id统计评论数
	 */
	public int countByArticelId(int articleId);
}
