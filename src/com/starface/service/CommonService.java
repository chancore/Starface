package com.starface.service;


import com.starface.domain.Inform;
import com.starface.domain.vo.SystemCityVo;

public interface CommonService {
	
	/**
	 * 获取省/市/区(县)
	 * @return
	 */
	public String getSystemCities(SystemCityVo systemCityVo);
	
	/**
	 * 根据ID获取省/市/区(县)名称
	 * @param id
	 * @return
	 */
	public String getAreaName(Integer id);
	/**
	 * 获取所有的省市区
	 * @return
	 */
	public String getAllArea();
	/**
	 * 举报词汇列表
	 * @return
	 */
	public String illegalList();
	/**
	 * 举报日志
	 * @param inform
	 * @return
	 */
	public String informBlog(Inform inform);
	/**
	 * 举报聊天
	 * @param inform
	 * @return
	 */
	public String informMsg(Inform inform);
	/**
	 * 举报用户
	 * @param inform
	 * @return
	 */
	public String informUser(Inform inform);
 
}
