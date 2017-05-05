<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function bankuaiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/bankuaiDel.action?id="+id;
               }
           }
           
           function bankuaiAdd()
           {
                 var url="<%=path %>/admin/bankuai/bankuaiAdd.jsp";
				 window.location.href=url;
           }
           
           function banzhushezhi(id)
           {
                 var url="<%=path %>/admin/bankuai/banzhushezhi.jsp?id="+id;
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">序号</td>
					<td width="20%">板块名称</td>
					<td width="30%">板块介绍</td>
					<td width="10%">版主</td>
					
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.bankuaiList" id="catelog" status="sta">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#sta.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#catelog.name"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#catelog.jieshao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#catelog.user.loginname"/>
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="bankuaiDel(<s:property value="#catelog.id"/>)"/>
						<input type="button" value="版主设置" onclick="banzhushezhi(<s:property value="#catelog.id"/>)"/>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 8px;">
			  <tr>
			    <td>
			      <input type="button" value="添加论坛板块" style="width: 130px;" onclick="bankuaiAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
