package com.crm.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.crm.model.Production;
import com.crm.model.Visitlog;
import com.crm.model.easyui.PageHelper;

public interface ProductionMapper {

	//根据名称查询
	public Production findByName(@Param("productionname") String productionname);

	//根据id查询
	public Production getProductionById(@Param("id") int id);
	
	//根据 客户id获取其所有访问记录
	public List<Visitlog> getVisitlogById(@Param("productionId") int productionId);
	
	//获取所有
	public List<Production> getDatagrid();

	//获取总数
	public Long getDatagridTotal(Production production);

	//分页
	public List<Production> datagridProduction(PageHelper page);

	//添加
	public void addProduction(Production production);

	//修改
	public void editProduction(Production production);
	
	//删除
	public void deleteProduction(int id);

}
