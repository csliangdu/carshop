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
	<script type="text/javascript">
         function zhutiAdd(catelogId)
	     {
	           <c:if test="${sessionScope.user==null}">
		           alert("请先登录");
		       </c:if> 
		       <c:if test="${sessionScope.user!=null}">
		           var url="<%=path %>/qiantai/zhuti/zhutiAdd.jsp?catelogId="+catelogId;
		           var ret = window.showModalDialog(url,"","dialogWidth:850px; dialogHeight:450px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	               window.location.reload();
	           </c:if> 
	     }
    </script>
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
								   <b style="font-family: 微软雅黑;font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;</b>
								</span>
								<span style="float:right;color: white;font-size: 11px;">
								&nbsp;
								</span>
							</td>
						</tr>
						<tr bgcolor="#F9F9F9">
							<td align="center">
								<table border="0" width="100%" cellspacing="5" cellpadding="5">
									<c:forEach items="${requestScope.zhuti_list_all}" var="zhuti">
									<tr height="40" align="center">
										<td width="30">
											<img src="<%=path %>/img/icon.gif">
										</td>
										<td align="left" width="600">
										    <div style="font-family: 微软雅黑;font-size: 14px;">
										        <A href="<%=path %>/huifuAll.action?zhutiId=${zhuti.id}" style="color: black">${zhuti.title}</A>
										        <c:if test='${zhuti.shifouding=="是"}'>
												     <img src="<%=path %>/img/ding.jpg">
												</c:if>
												<c:if test='${zhuti.shifoujing=="是"}'>
												     <img src="<%=path %>/img/jing.jpg">
												</c:if>
											</div>
										</td>
										<td>
											<div style="font-family: 微软雅黑;font-size: 13px;color: #9D9D9D">回复数：${zhuti.huifushu}</div>
										</td>
										<td>
											<div style="font-family: 微软雅黑;font-size: 13px;color: #9D9D9D">${zhuti.user.loginname}</div>
										</td>
										<td>
											<div style="font-family: 微软雅黑;font-size: 13px;color: #9D9D9D">${zhuti.shijian}</div>
										</td>
									</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
					<br/>
					<A href="#" onclick="zhutiAdd(${requestScope.catelogId})" style="margin-left: 10px;">
					   <IMG src="<%=path %>/img/newtopic.gif">
					</A>
	            </div>
				<center>
				    &nbsp;
				</center>
	       </div>
		   <div class="footer">
			    <div class="copyright" style="margin-top: 8px;">		
			                          版权所有 COPY&copy;2015-2020 
			         &nbsp;&nbsp;&nbsp;&nbsp;
			    </div>
		   </div>
	 </div>
</div>
</body>
</html>
