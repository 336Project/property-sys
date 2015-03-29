package com.property.sys.action;

import com.property.sys.model.Comment;
import com.property.sys.service.CommentService;
import com.sechand.platform.base.BaseAction;

public class CommentAction extends BaseAction {
	private static final long serialVersionUID = -1570507793268319377L;
	
	private CommentService commentService;
	private Comment comment;
	
	/**
	 * 
	 * @Author:Helen  
	 * 2015-3-29下午9:01:31
	 * @return
	 * String
	 * @TODO 发表评论
	 */
	public String publish(){
		if(comment!=null){
			if(commentService.add(comment)>0){
				json.setMsg("发表成功!");
				json.setSuccess(true);
			}else{
				json.setMsg("发表失败!");
				json.setSuccess(false);
			}
		}else{
			json.setMsg("发表失败!");
			json.setSuccess(false);
		}
		return SUCCESS;
	}
	
	
	
	
	
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	
	
}
