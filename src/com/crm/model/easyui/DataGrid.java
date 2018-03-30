package com.crm.model.easyui;

import java.util.List;

/**
 * 后台向前台返回JSON，用于easyui的datagrid
 */
public class DataGrid implements java.io.Serializable {

	private static final long serialVersionUID = 6280886620778740437L;
	private Long total;	// 总记录数
	private List<?> rows;	// 每行记录
	
	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

}
