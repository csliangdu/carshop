<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%
   String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/header.css" />
	
  </head>
  
<body>
<div id="header">
     <div class="header">
	       <div class="top">
	       </div>
		   <div class="main_index">
		        <div class="content dz" style="margin-top: 10px;width: 70%;height: 100%;margin-left: 210px;" >
				   <table align="center" border="0" width="100%" cellspacing="1" cellpadding="1">
						<tr height="28">
							<td bgcolor="#FF9797">
								<span style="float:left;color: white;font-size: 11px;">
								   <b style="font-family: 微软雅黑;font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;论坛板块</b>
								</span>
								<span style="float:right;color: white;font-size: 11px;">
								&nbsp;
								</span>
							</td>
						</tr>
						<tr bgcolor="#F9F9F9">
							<td align="center">
								<table border="0" width="100%" cellspacing="5" cellpadding="5">
									<c:forEach items="${requestScope.bankuaiList}" var="bankuai" varStatus="ss">
									<tr height="70" align="center">
										<td width="30">
											<img src="<%=path %>/img/bankuai.gif">
										</td>
										<td align="left" width="600">
											<div style="font-family: 微软雅黑;font-size: 14px;">
											    <a style="color: black" href="<%=path %>/zhutiAll.action?bankuaiId=${bankuai.id}">${bankuai.name }</a>
											</div>
											<div style="font-family: 微软雅黑;font-size: 11px;color: #9D9D9D">${bankuai.jieshao }</div>
										</td>
										<td>
											<div style="font-family: 微软雅黑;font-size: 13px;color: #9D9D9D">帖子数：${bankuai.zhutishu }</div>
										</td>
										<td>
											<div style="font-family: 微软雅黑;font-size: 13px;color: #9D9D9D">版主：${bankuai.user.loginname }</div>
										</td>
									</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
	            </div>
				<center>
				    &nbsp;
				</center>
	       </div>
		   <div class="footer">
			    <div class="copyright" style="margin-top: 8px;">		
			                          版权所有 COPY&copy;2004-2020 
			         &nbsp;&nbsp;&nbsp;&nbsp;
			         <a href="<%=path %>/login.jsp">系统后台</a>
			    </div>
		   </div>
	 </div>
</div>
</body>
</html>
