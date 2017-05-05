<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
	
	<script type="text/javascript">
         function check()
		 {                                                                                         
		     if(document.ThisForm.loginname.value=="")
			 {
			 	alert("请输入用户名");
				return false;
			 }
			 if(document.ThisForm.loginpw.value=="")
			 {
			 	alert("请输入密码");
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.ThisForm.loginname.value,document.ThisForm.loginpw.value,1,callback);
		 }
		
		 function callback(data)
		 {
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {   
		        alert("登陆成功");
		        var url="<%=path %>/qiantai/default.jsp";
		        window.location.href=url;
		    }
		 }
    </script>
	
  </head>
  
<body>
<div id="header">
     <div class="header">
	       <div class="top">
	             <jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>  
	       </div>
		   <div class="main_index">
		        <div class="content dz" style="margin-top: 10px;width: 70%;height: 100%;margin-left: 210px;" >
				    <form action="<%=path %>/11.action" name="ThisForm" method="post">
	                     <table align="left" border="0" cellpadding="4" cellspacing="4">
							<tr align='center'>
								<td style="width: 50px;" align="center">
									账号：										    
								</td>
								<td align="left">
									<input type="text" name="loginname" style="width: 200px;"/>
								</td>
							</tr>
							<tr align='center'>
								<td style="width: 50px;" align="center">
									密码：										    
								</td>
								<td align="left">
									<input type="password" name="loginpw" style="width: 200px;"/>
								</td>
							</tr>
							<tr align='center'>
							   <td style="width: 50px;" align="center"></td>
							   <td align="left">
							      <input type="button" value="登陆" style="width: 60px;height: 22px;" onclick="check()"/>
	                              <input type="reset" value="重置" style="width: 60px;height: 22px;"/>
	                              <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							   </td>
							</tr>
						 </table>
                     </form>
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
