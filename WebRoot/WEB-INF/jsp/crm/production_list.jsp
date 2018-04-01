<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>产品信息管理</title>
<%@include file="/WEB-INF/jsp/include/easyui_core.jsp"%>
<!-- 对话框的样式 -->
<link href="${path}/css/list.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	//请求地址
	var url;
	//提示消息
	var mesTitle;

	//添加产品信息
	function addObject() {
		$('#dlg').dialog('open').dialog('setTitle', '新增产品');
		$('#fm').form('clear');
		url = path + "/production/add";
		mesTitle = '新增产品成功';
	}

	//编辑产品信息
	function editObject() {
		var row = $('#datagrid').datagrid('getSelected');
		if (row) {
			var id = row.id;
			$('#dlg').dialog('open').dialog('setTitle', '编辑产品');
			$('#fm').form('load', row);
			url = path + "/production/edit?id=" + id;
			mesTitle = '编辑产品成功';
		} else {
			$.messager.alert('提示', '请选择要编辑的记录！', 'error');
		}
	}

	//删除用信息
	function deleteObject() {
		var row = $('#datagrid').datagrid('getSelected');
		if (row) {
			var id = row.id;
			$('#dlg_delete').dialog('open').dialog('setTitle', '删除产品');
			$('#fm').form('load', row);
			url = path + "/production/delete?id=" + id;
			mesTitle = '删除产品成功';
		} else {
			$.messager.alert('提示', '请选择要删除的记录！', 'error');
		}
	}

	//保存添加、修改内容
	function saveObject() {
		$('#fm').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$('#dlg').dialog('close');
					$('#datagrid').datagrid('reload');
				} else {
					mesTitle = '新增产品失败！';
				}
				$.messager.show({
					title : mesTitle,
					msg : result.msg
				});
			}
		});
	}

	//提交删除内容
	function saveObject_del() {
		$('#fm').form('submit', {
			url : url,
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$('#dlg_delete').dialog('close');
					$('#datagrid').datagrid('reload');
				} else {
					mesTitle = '删除产品失败';
				}
				$.messager.show({
					title : mesTitle,
					msg : result.msg
				});
			}
		});
	}

	//刷新
	function reload() {
		$('#datagrid').datagrid('reload');
	}
</script>

</head>
<body class="easyui-layout" fit="true">
	<div region="center" border="false" style="overflow: hidden;">
		<table id="datagrid" class="easyui-datagrid" fit="true"
			url="${path}/production/datagrid" toolbar="#toolbar" pagination="true"
			fitColumns="true" singleSelect="true" rownumbers="true"
			striped="true" border="false" nowrap="false">
			<thead>
				<tr>
					<th field="id" width="100">编号</th>
					<th field="production_name" width="100">产品名称</th>
					<th field="description" width="100">描述</th>
					<th field="price" width="100">价格</th>
					<th field="status" width="100">状态</th>
				</tr>
			</thead>
		</table>

		<!-- 按钮 -->
		<div id="toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton"
				iconCls="icon-reload" plain="true" onclick="reload();">刷新</a> <a
				href="javascript:void(0);" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onclick="addObject();">新增产品</a> <a
				href="javascript:void(0);" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onclick="editObject();">编辑产品</a> <a
				href="javascript:void(0);" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true" onclick="deleteObject();">删除产品</a>
		</div>

		<!-- 添加/修改对话框 -->
		<div id="dlg" class="easyui-dialog"
			style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
			buttons="#dlg-buttons">
			<div class="ftitle">新增产品</div>
			<form id="fm" method="post" novalidate>
				<div class="fitem">
					<label>产品名称:</label> <input name="production_name" class="easyui-textbox"
						required="true">
				</div>
				<div class="fitem">
					<label>描述:</label> <input name="description" class="easyui-textbox"
						required="true">
				</div>
				<div class="fitem">
					<label>价格:</label> <input name="price" class="easyui-textbox"
						required="true">
				</div>
				<div class="fitem">
					<label>状态:</label> <input name="status" class="easyui-textbox"
						required="true">
				</div>
			</form>

			<!-- 添加/修改对话框按钮 -->
			<div id="dlg-buttons">
				<a href="javascript:void(0)" class="easyui-linkbutton c6"
					iconCls="icon-ok" onclick="saveObject()" style="width: 90px">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-cancel"
					onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">取消</a>
			</div>

			<!-- 删除对话框 -->
			<div id="dlg_delete" class="easyui-dialog"
				style="width: 300px; height: 200px; padding: 10px 20px"
				closed="true" buttons="#dlg-del-buttons">
				<div class="ftitle">删除产品</div>
				<form id="fm" method="post" novalidate>
					<label>确定删除产品吗？</label>
				</form>
			</div>

			<!-- 删除对话框按钮 -->
			<div id="dlg-del-buttons">
				<a href="javascript:void(0)" class="easyui-linkbutton c6"
					iconCls="icon-ok" onclick="saveObject_del()" style="width: 90px">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-cancel"
					onclick="javascript:$('#dlg_delete').dialog('close')"
					style="width: 90px">取消</a>
			</div>

		</div>
</body>
</html>
