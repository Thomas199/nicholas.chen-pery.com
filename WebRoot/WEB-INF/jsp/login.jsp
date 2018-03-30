<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生鲜果蔬管理系统</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/login.css" />
<script src="js/easyui/jquery.min.js" type="text/javascript"></script>
</head>
<div class="page">
	<div class="loginwarrp">
		<div class="logo">管理员登录</div>
		<div class="login_form">
			<form action="login" method="post" name="loginForm" id="loginForm">
				<li class="login-item"><span>用户名：</span> <input type="text"
					id="loginname" name="loginname" class="login_input"
					value="${loginname }"> <span id="nameerr" class="errInfo"></span>
				</li>

				<li class="login-item"><span>密 码：</span> <input type="password"
					id="password" name="password" class="login_input"
					value="${password }"> <span id="pwderr" class="errInfo"></span>
				</li>

				<li class="login-item verify"><span>验证码：</span> <input
					type="text" name="code" id="code" class="login_input" /> <span
					id="codeerr" class="errInfo"></span></li> <img id="codeImg" alt="点击更换"
					title="点击更换" src="" class="verifyimg" />
				<p>
				<div class="clearfix"></div>
				<li class="login-sub"><input type="button" name="loginBtn"
					id="loginBtn" value="登录" onclick="login()" /> <input type="reset"
					name="cancelBtn" id="cancelBtn" value="取消" /></li>
				<br>
				<li class="login-sub"><input type="checkbox" id="autologin"
					name="autologin" value=""
					style="margin: 0px; vertical-align: middle; padding: 0px; width: 16px; height: 16px; font-size: 20px;" />&nbsp;一周内自动登录
					<input type="hidden" id="autologinch" name="autologinch" value="" />
				</li>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	var errInfo = "${errInfo}";
	$(document).ready(function() {
		changeCode();
		$("#codeImg").bind("click", changeCode);
		if (errInfo != "") {
			if (errInfo.indexOf("验证码") > -1) {
				$("#codeerr").show();
				$("#codeerr").html(errInfo);
				$("#code").focus();
			} else {
				$("#nameerr").show();
				$("#nameerr").html(errInfo);
			}
		}
		$("#loginname").focus();
	});

	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}

	function changeCode() {
		$("#codeImg").attr("src", "code?t=" + genTimestamp());
	}

	function resetErr() {
		$("#nameerr").hide();
		$("#nameerr").html("");
		$("#pwderr").hide();
		$("#pwderr").html("");
		$("#codeerr").hide();
		$("#codeerr").html("");
	}

	function check() {
		resetErr();
		if ($("#loginname").val() == "") {
			$("#nameerr").show();
			$("#nameerr").html("用户名不得为空！");
			$("#loginname").focus();
			return false;
		}
		if ($("#password").val() == "") {
			$("#pwderr").show();
			$("#pwderr").html("密码不得为空！");
			$("#password").focus();
			return false;
		}
		if ($("#code").val() == "") {
			$("#codeerr").show();
			$("#codeerr").html("验证码不得为空！");
			$("#code").focus();
			return false;
		}
		if ($(".autologin").is(":checked")) {
			$(".autologinch").val("Y");
		}
		return true;
	}

	function login() {
		check();
		document.loginForm.submit();
	}
	
	window.onload = function() {
		var config = {
			vx : 4,
			vy : 4,
			height : 2,
			width : 2,
			count : 100,
			color : "121, 162, 185",
			stroke : "100, 200, 180",
			dist : 6000,
			e_dist : 20000,
			max_conn : 10
		}
		CanvasParticle(config);
	}
</script>
<script type="text/javascript" src="js/easyui/canvas-particle.js"></script>
</html>