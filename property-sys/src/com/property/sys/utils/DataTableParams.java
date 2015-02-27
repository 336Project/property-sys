package com.property.sys.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 表单参数解析
 */
public class DataTableParams {
	public int current_page;
	public int page_size;
	public int draw=0;
	public String keyword;
	
	private static DataTableParams instance;
	private String iDisplayStart="";//记录开始位置
	private String iDisplayLength="";//每页大小
	private String sSearch="";//搜索关键字
	private DataTableParams() {
	}
	public static DataTableParams getInstance(){
		if(instance==null){
			instance=new DataTableParams();
		}
		return instance;
	}
	public void parse(String dataTableParams) {
		int start= 0;
		int length=10;
		//json解析
		JSONArray jsonArray=JSON.parseArray(dataTableParams);
		if(jsonArray!=null){
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject params=jsonArray.getJSONObject(i);
				if(params.getString("name").equals("draw")){
					draw=params.getIntValue("value")+1;
				}else if(params.getString("name").equals("start")){
					iDisplayStart=params.getString("value");
				}else if(params.getString("name").equals("length")){
					iDisplayLength=params.getString("value");
				}else if(params.getString("name").equals("sSearch")){
					sSearch=params.getString("value");
				}
			}
		}
		try {
			start=Integer.parseInt(iDisplayStart);
		} catch (Exception e) {
		}
		try {
			length=Integer.parseInt(iDisplayLength);
		} catch (Exception e) {
		}
		current_page=start/length+1;//计算当前页
		page_size=length;
		keyword=sSearch;
	}
	
	
}
