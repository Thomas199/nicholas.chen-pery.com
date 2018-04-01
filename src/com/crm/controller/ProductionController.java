package com.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.model.Production;
import com.crm.model.easyui.DataGrid;
import com.crm.model.easyui.Json;
import com.crm.model.easyui.PageHelper;
import com.crm.service.ProductionService;

/**
 * 产品管理
 * @author momo
 */
@Controller
public class ProductionController {
	
	private final Logger log = LoggerFactory.getLogger(ProductionController.class);
	
	@Resource
	private ProductionService productionService;
	
	/**
	 * 跳转到产品表格页面
	 * @return
	 */
	@RequestMapping(value = "/production/list",method = RequestMethod.GET)
    public String productionList(Model model) {
        return "crm/production_list";
    }
	
	/**
	 * 表格
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/production/datagrid", method = RequestMethod.POST)
	public DataGrid datagrid(PageHelper page,Production production) {
		DataGrid dg = new DataGrid();
		dg.setTotal(productionService.getDatagridTotal(production));
		List<Production> list = productionService.datagridProduction(page);
		dg.setRows(list);
		return dg;
	}
	
	/**
	 * 新增
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/production/add",method = RequestMethod.POST)
    public Json add(Production production) {
		Json j = new Json();
		try {
			productionService.addProduction(production);
            j.setSuccess(true);
            j.setMsg("产品新增成功！");
            j.setObj(production);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }
	
	/**
     * 修改
     * 
     * @return
     */
	@ResponseBody
    @RequestMapping(value = "/production/edit",method = RequestMethod.POST)
    public Json editUser(Production production) {
        Json j = new Json();
        log.debug("穿过来的用户ID为："+production.getId());
        try {
        	productionService.editProduction(production);
            j.setSuccess(true);
            j.setMsg("编辑成功！");
            j.setObj(production);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }
	
	/**
	 * 删除某个
	 * @param out
	 */
	@ResponseBody
	@RequestMapping(value = "/production/delete",method = RequestMethod.POST)
	public Json delete(Production production) {
		Json j = new Json();
        log.debug("穿过来的用户ID为："+production.getId());
        try {
        	productionService.deleteProduction(production.getId());
			j.setSuccess(true);
	        j.setMsg("删除成功！");
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
	}
}
