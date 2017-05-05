<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function c1()
		   {
		        if(document.f1.mingcheng.value=="")
		        {
		            alert("请输入类别名称");
		            return false;
		        }
		        document.f1.submit();
		   } 
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="4" background="<%=path %>/img/tbg.gif">&nbsp;小类别管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="40%">小类别名称</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.xiaoleibieList" id="xiaoleibie" status="sta">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#sta.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#xiaoleibie.mingcheng"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<form action="<%=path %>/xiaoleibieDel.action" name="f2" method="post">
						    <input type="hidden" name="id" value="<s:property value="#xiaoleibie.id"/>"/>
						    <input type="submit" value="删除"/>&nbsp; 
						</form>
					</td>
				</tr>
				</s:iterator>
			</table>
			<br/>
			<form action="<%=path %>/xiaoleibieAdd.action" name="f1" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="right">
						         小类别名称：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="mingcheng" size="60"/>
						        <input type="hidden" name="catelogId" value="<s:property value="#request.catelogId"/>"/>
						        <input type="button" value="添加" onclick="c1()"/>&nbsp; 
						    </td>
						</tr>
					 </table>
			</form>
	</body>
</html>
