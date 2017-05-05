<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
   String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <meta http-equiv="pragma" content="no-cache">
	  <meta http-equiv="cache-control" content="no-cache">
	  <meta http-equiv="expires" content="0">    
	  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	  <meta http-equiv="description" content="This is my page">
      
      <style type="text/css">
		.my_left_category
		{
			font-size:12px;
			font-family:arial,sans-serif;
			letter-spacing:2px;
		}
		.my_left_category h1
		{
			background-image:url(<%=path %>/img/spring_06.gif);
			height:20px;
			background-repeat:no-repeat;
			font-size:14px;
			font-weight:bold;
			padding-left:15px;
			padding-top:8px;
			margin:0px;
			color:#FFF;
		}
		.my_left_category .my_left_cat_list
		{
			width:100px;/*这个地方的100可以随便填*/
			border-color:white;
			border-style:solid;
			border-width:0px 1px 1px 1px;
			line-height:13.5pt;
		}
		.my_left_category .my_left_cat_list h2 
		{
			margin:0px;
			padding:3px 5px 0px 9px;
		}
		.my_left_category .my_left_cat_list h2 a 
		{
			color:#d6290b;
			font-weight:bold;
			font-size:14px;
			line-height:22px;
		}
		.my_left_category .my_left_cat_list h2 a:hover 
		{
			color:#d6290b;
			font-weight:bold;
			font-size:14px;
			line-height:22px;
		}
		.my_left_category .h2_cat
		{
			width:160px;/*这个地方的158不可以可以随便填，是控制长短的*/
			height:26px;
			background-repeat:no-repeat;
			line-height:26px;
			font-weight:normal;
			color:#333333;
			position:relative;
		}
		.my_left_category .h2_cat_1
		{
			width:160px;
			height:26px;
			background-repeat:no-repeat;
			line-height:26px;
			font-weight:normal;
			color:#333333;
			position:relative;
		}
		.my_left_category a
		{
			font:12px;
			text-decoration:none;
			color:#333333;
		}
		.my_left_category a:hover
		{
			text-decoration:underline;
			color:#ff3333;
		}
		.my_left_category h3
		{
			margin:0px;
			padding:0px;
			height:26px;
			font-size:12px;
			font-weight:normal;
			display:block;
			padding-left:8px;
		}
		.my_left_category h3 span{color:#999999; width:145px; float:right;}
		.my_left_category h3 a{	line-height:26px;}
		.my_left_category .h3_cat
		{
			display:none;
			width:244px;
			position:absolute;
			left:123px;
			margin-top:-26px;
			cursor:auto;
		}
		.my_left_category .shadow
		{
			position:inherit;
			background:url(<%=path %>/img/shadow_04.gif) left top;
			width:244px;
		}
		.my_left_category .shadow_border
		{
			position:inherit;
			width:300px;/*鼠标onmouseover后，弹出的那个曾的宽度和高度*/
			height:160px;
			border:1px solid #959595; margin-top:1px;
			border-left-width:0px;
			background-color:#ffffff;
			margin-bottom:3px
		}
		.my_left_category .shadow_border ul{margin:0; padding:0; margin-left:15px}
		.my_left_category .shadow_border ul li 
		{
			list-style:none;
			padding-left:10px;
			
			background-repeat:no-repeat;
			background-position:0px 8px;
			float:left;
			width:100px;
			height:26px;
			overflow:hidden;
			letter-spacing:0px;
		}
		.my_left_category .active_cat{ z-index:99;background-position:0 -25px;cursor:pointer;}
		.my_left_category .active_cat h3 { font-weight:bold}
		.my_left_category .active_cat h3 span{ display:none;}
		.my_left_category .active_cat div{display:block;}
    </style>
      
      <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
      <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
      <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
     
      <script type="text/javascript">
            function check()
			{                                                                                         
			     if(document.ThisForm.loginname.value=="")
				 {
				 	alert("请输入账号");
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
			        alert("账号或密码错误");
			    }
			    if(data=="yes")
			    {   
			        alert("登陆成功");
			        var url="<%=path %>/qiantai/default.jsp";
			        window.location.href=url;
			    }
			}
	        
	        
	        
	        function userLogout()
	        {
	            document.getElementById("indicator1").style.display="block";
	            loginService.userLogout(callback1);
	        }
	        function callback1(data)
			{
			    document.getElementById("indicator1").style.display="none";
			    if(data=="no")
			    {
			        alert("系统错误，请联系管理员");
			    }
			    if(data=="yes")
			    {   
			        alert("安全退出系统");
			        var url="<%=path %>/qiantai/default.jsp";
			        window.location.href=url;
			    }
			    
			}
			
			
			function c()
	        {
	           if(document.form1.goodsName.value=="")
	           {
	               alert("请输入关键字");
	               return false;
	           }
	           document.form1.submit();
	        }
      </script>
  </head>
  
  <body>
        <TABLE border=0 cellSpacing=0 cellPadding=0>
		        <!--  -->
		        <TR>
		          <TD height="50" style="background-image: url('<%=path %>/img/gonggao.gif'); background-repeat : repeat-xy;">
		             &nbsp;&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: 700">>>系统公告</font>
		          </TD>
		        </TR>
		        <TR>
		          <TD class=b>
		            <TABLE border=0 cellSpacing=0 cellPadding=0 width=220 align=center height=100%>
		              <TR>
		                <TD width=220 align=center>
		                    <MARQUEE onmouseover=this.stop() onmouseout=this.start() direction=up height=90 width=160 scrollAmount=3 scrollDelay=166 border="0">本站于xxxx年xx月xx日正式开通,欢迎大家访问本网站,各种汽车信息应有尽有，欢迎各位选购。</MARQUEE>
		                </TD>
		              </TR>
		            </TABLE>
		         </TD>
		        </TR>
		        <tr><td height="20"></td></tr>
		        <!-- -->
		        
		        
		        <!--  -->
		        <TR>
		          <TD height="50" style="background-image: url('<%=path %>/img/gonggao.gif'); background-repeat : repeat-xy;">
		             &nbsp;&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: 700">>>汽车查询</font>
		          </TD>
		        </TR>
		        <TR>
		          <TD class=b>
		            <TABLE border=0 cellSpacing=0 cellPadding=0 width=220 align=center height=100%>
		              <TR>
		                <TD width=220 align=center>
		                     <form action="<%=path %>/goodsSearch.action" name="form1" method="post">
						        <table>
						            <tr>
						                <td>
						                    <input type="text" name="goodsName" size="14"/>
						                </td>
						                <td>
						                    <input type="button" value="查询" onclick="c()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;"/>
						                </td>
						            </tr>
						        </table>
						     </form>
		                </TD>
		              </TR>
		            </TABLE>
		         </TD>
		        </TR>
		        <tr><td height="5"></td></tr>
		        <!-- -->
		        
		        
		        <!-- -->
		        <TR>
		          <TD height="50" style="background-image: url('<%=path %>/img/gonggao.gif'); background-repeat : repeat-xy;">
		             &nbsp;&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: 700">>>汽车品牌</font>
		          </TD>
		        </TR>
		        <TR>
		          <TD class=b>
		              <div class="my_left_category" style="margin-top: 10px;">
						   <div class="my_left_cat_list">
								<h2><span style="font-size: 11px;color: red"></span></h2>
								<c:forEach items="${sessionScope.cateLogList}" var="catelog">
								<div class="h2_cat" onmouseover="this.className='h2_cat active_cat'" onmouseout="this.className='h2_cat'">
									<h3><img src="<%=path %>/img/arr3.gif"/>&nbsp;&nbsp;${catelog.catelogName}</h3>
									<div class="h3_cat">
										<div class="shadow">
											<div class="shadow_border">
												<ul>
												    <c:forEach items="${catelog.xiaoleibieList}" var="xiaoleibie">
													<li><a href="<%=path %>/goods_xiaoleibie.action?xiaoleibieId=${xiaoleibie.id}">${xiaoleibie.mingcheng}</a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
						    </div>
					  </div>
		          </TD>
		        </TR>
		        <tr><td height="10"></td></tr>
		        <!-- -->
		        
		        
		        
		        <!-- -->
		        <TR>
		          <TD class=b vAlign=top>
		            <TABLE border=0 cellSpacing=0 cellPadding=0 width=220>
		              <TR>
				          <TD height="50" style="background-image: url('<%=path %>/img/gonggao.gif'); background-repeat : repeat-xy;">
				             &nbsp;&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: 700">>>登录窗口</font>
				          </TD>
				      </TR>
		            </TABLE>
		            <TABLE border=0 cellSpacing=3 cellPadding=3 width=220 height=22>
		              <TR>
		                <TD height=22 vAlign=middle width="100%">
		                    <c:if test="${sessionScope.user==null}">
		                    <form action="<%=path %>/user?type=userLogin" name="ThisForm" method="post">
							      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" height="60">
							          <tr>
							            <td align="center" colspan="2" height="10"></td>
							          </tr>
							          <tr>
							            <td align="right" width="31%" height="30" style="font-size: 11px;">账号：</td>
							            <td align="left" width="69%"><input name="loginname" type="text" style="width: 100px;"/></td>
							          </tr>
							          <tr>
							            <td align="right" height="30" style="font-size: 11px;">密码：</td>
							            <td align="left"><input type="password" style="width: 100px;" name="loginpw"/></td>
							          </tr>
							          <tr>
							            <td align="center" colspan="2" height="10"></td>
							          </tr>
							          <tr>
							            <td align="center" colspan="2" height="30">
							               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							               <input type="button" value="登  录" onclick="check()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
										   &nbsp;
										   <input type="button" value="注  册" onclick="userReg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
							               &nbsp;
							               <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							            </td>
							          </tr>
							      </table>
						    </form>
						    </c:if>
						    <c:if test="${sessionScope.user!=null}">
						        <br/>
						        &nbsp;&nbsp;&nbsp;&nbsp;欢迎您：${sessionScope.user.loginname } &nbsp;&nbsp;&nbsp;&nbsp;
							    <a href="#" onclick="userLogout()">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
							    <img id="indicator1" src="<%=path %>/img/loading.gif" style="display:none"/>
							    <br/><br/><br/>
							</c:if>
		                </TD>
		              </TR>
		            </TABLE>
		          </TD>
		        </TR>
		</TABLE> 
  </body>
</html>
