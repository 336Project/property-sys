package com.property.sys.serviceimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.property.sys.model.Comment;
import com.property.sys.model.User;
import com.property.sys.service.CommentService;
import com.property.sys.utils.SysUtils;
import com.sechand.platform.base.BaseServiceImpl;

public class CommentServiceImpl extends BaseServiceImpl implements
		CommentService {

	@Override
	public int add(Comment comment) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userName", comment.getReviewer());
		User user=baseDao.getByClassNameAndParams(User.class, map);
		if(user!=null){
			comment.setUserId(user.getId());
			comment.setPublishTime(SysUtils.getDateFormat(new Date()));
			return baseDao.save(comment);
		}
		return 0;
	}

	@Override
	public List<Comment> listPageRowCommentsByArticleId(int articleId,
			int page, int size) {
		Map<String, Object> whereMap=new HashMap<String, Object>();
		whereMap.put("articleId", articleId);
		//whereMap.put("order_by", "publishTime_asc");
		return baseDao.listPageRowsByClassNameAndParams(Comment.class, whereMap, page, size);
	}

	@Override
	public int countByArticelId(int articleId) {
		Map<String, Object> whereMap=new HashMap<String, Object>();
		whereMap.put("articleId", articleId);
		return baseDao.countByClassNameAndParams(Comment.class, whereMap);
	}

}
