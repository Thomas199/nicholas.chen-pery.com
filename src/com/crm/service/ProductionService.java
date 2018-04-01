package com.crm.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.crm.dao.ProductionMapper;
import com.crm.model.Production;
import com.crm.model.Visitlog;
import com.crm.model.easyui.PageHelper;

@Service
public class ProductionService {

	@Resource
	private ProductionMapper productionMapper;

	public Production findByName(String name) {
		return productionMapper.findByName(name);
	}
	
    public Production getUsernameById(int id){  
        return productionMapper.getProductionById(id);
    }
	
	/**
	 * 获取该产品的所有访问记录
	 * @return
	 */
	public List<Visitlog> getVisitlogById(int productionId) {
		return productionMapper.getVisitlogById(productionId);  
	}

	/**
	 * 获取总数
	 * @param production
	 * @return
	 */
	public Long getDatagridTotal(Production production) {
		return productionMapper.getDatagridTotal(production);
	}

	/**
	 * 获列表 分页
	 * @param page
	 * @return
	 */
	public List<Production> datagridProduction(PageHelper page) {
		page.setStart((page.getPage()-1)*page.getRows());
		page.setEnd(page.getPage()*page.getRows());
		return productionMapper.datagridProduction(page);  
	}

	//添加
	public void addProduction(Production production){
		productionMapper.addProduction(production);
	};

	//修改
	public void editProduction(Production production){
		productionMapper.editProduction(production);
	};
	
	//删除
	public void deleteProduction(int id){
		productionMapper.deleteProduction(id);
	};
    
}
