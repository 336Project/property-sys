package com.property.sys.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.property.sys.model.Option;
import com.property.sys.service.OptionService;
import com.sechand.platform.base.BaseServiceImpl;

public class OptionServiceImpl extends BaseServiceImpl implements OptionService {

	@Override
	public int add(Option option) {
		if(option!=null){
			return baseDao.save(option);
		}
		return 0;
	}

	@Override
	public List<Option> listByArticleId(int articleId) {
		Map<String, Object> whereMap=new HashMap<String, Object>();
		whereMap.put("articleId", articleId);
		return baseDao.listByClassNameAndParams(Option.class, whereMap);
	}

	@Override
	public void increaseSupporter(int id) {
		Option option=baseDao.getByClassAndId(Option.class, id);
		baseDao.updateColumnById(Option.class, "supporters", (option.getSupporters()+1), id);
	}

}
