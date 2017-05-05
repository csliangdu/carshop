<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<style type="text/css">
           .style12 {color: #FF6633;font-size: 14px;}
		    td {FONT-SIZE:9pt; LINE-HEIGHT:150%; COLOR: #353535} 
		    body {background-image: url(<%=path %>/img/background.gif);FONT-SIZE:9pt;LINE-HEIGHT:150%;margin: 0px;} 
			a:link {color: #333333; text-decoration: none}
			a:visited {color: #333333; text-decoration: none}
			a:active {color: #333333; text-decoration: none}
			a:hover {color: #ff0000; text-decoration: underline}
			A:unknown LINK {TEXT-DECORATION: none}
			.list_link {FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #8d1c1c; TEXT-DECORATION: none}
			.wenbenkuang {BORDER-RIGHT: #999999 1px solid; BORDER-TOP: #999999 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #999999 1px solid; COLOR: #333333; BORDER-BOTTOM: #999999 1px solid; FONT-FAMILY: "宋体"}
			.go-wenbenkuang {BORDER-RIGHT: #666666 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #ffffff 1px solid; PADDING-LEFT: 1px; FONT-SIZE: 9pt; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffffff 1px solid; CURSOR: hand; COLOR: #333333; PADDING-TOP: 1px; BORDER-BOTTOM: #666666 1px solid; FONT-FAMILY: "宋体"; HEIGHT: 19px; BACKGROUND-COLOR: #eeeeee}
			.table-zuoyou {BORDER-RIGHT: #A9A9A9 1px solid; BORDER-LEFT: #A9A9A9 1px solid}
			.table-shangxia {BORDER-TOP: #A9A9A9 1px solid; BORDER-BOTTOM: #A9A9A9 1px solid}
			.table-sxzy {BORDER-TOP: #A9A9A9 1px solid; BORDER-BOTTOM: #A9A9A9 1px solid;#A9A9A9 1px solid; BORDER-LEFT: #A9A9A9 1px solid;BORDER-RIGHT: #A9A9A9 1px solid}
			.table-you {BORDER-RIGHT: #A9A9A9 1px solid}
			.table-zuo {BORDER-LEFT: #A9A9A9 1px solid}
			.table-shang {BORDER-TOP: #A9A9A9 1px solid}
			.table-xia {BORDER-BOTTOM: #A9A9A9 1px solid}
			.table-xu {BORDER-BOTTOM: #A9A9A9 1px dotted}
			.matrix {FONT-SIZE: 12px}
			.matrix A {COLOR: #93393a}
			.matrix_sub {BORDER-RIGHT: #c9c9c9 1px solid; PADDING-RIGHT: 4px; BORDER-TOP: 0px; PADDING-LEFT: 4px; BACKGROUND-IMAGE: url(<%=path %>/img/botton2.gif); PADDING-BOTTOM: 4px; BORDER-LEFT: #c9c9c9 1px solid; COLOR: #000000; PADDING-TOP: 1px; BORDER-BOTTOM: #c9c9c9 1px solid; BACKGROUND-COLOR: #f7f7f7}
			.matrix_header {BORDER-RIGHT: #c9c9c9 1px solid; BORDER-TOP: #c9c9c9 1px solid; PADDING-LEFT: 5px; BACKGROUND-IMAGE: url(<%=path %>/img/botton2.gif); PADDING-BOTTOM: 6px; BORDER-LEFT: #c9c9c9 1px solid; COLOR: #00469e; PADDING-TOP: 6px; BORDER-BOTTOM: #838383 1px solid; BACKGROUND-COLOR: #ffffff}
			.matrix_info {BORDER-RIGHT: #c9c9c9 1px solid; PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #c9c9c9 1px solid; PADDING-TOP: 4px; BORDER-BOTTOM: #eae9e9 1px solid; BACKGROUND-COLOR: #f7f7f7}
			.matrix_info_header {BORDER-RIGHT: #c9c9c9 1px solid; PADDING-RIGHT: 4px; BORDER-TOP: #c9c9c9 1px solid; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #c9c9c9 1px solid; PADDING-TOP: 4px; BORDER-BOTTOM: #eae9e9 1px solid; BACKGROUND-COLOR: #ebeaea}
			.matrix_content {COLOR: #353535; BACKGROUND-COLOR: #ffffff}
			.matrix_left {BORDER-LEFT: #c9c9c9 1px solid}
			.error {BORDER-RIGHT: #ff0000 2px solid; BORDER-TOP: #ff0000 2px solid; BORDER-LEFT: #ff0000 2px solid; WIDTH: 95%; BORDER-BOTTOM: #ff0000 2px solid; BACKGROUND-COLOR: #ffdede}
			.error TD {FONT-SIZE: 12px; COLOR: #ff0000}
			.error .title {BACKGROUND-COLOR: #ff9393}
			.error .title TD {FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #ffffff}
			.select {BORDER-TOP: #c4c4c4 1px solid; BORDER-LEFT: #c4c4c4 1px solid}
			.tableBorder {WIDTH: 98%;BACKGROUND-COLOR: #ffffff;border: 1px solid #0066FF;}
			.edfour {BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; BACKGROUND-COLOR: #ffffff}
			.color {FONT-SIZE: 12px; COLOR: #d7fd62; TEXT-DECORATION: none}
			.line {FONT-SIZE: 12px; LINE-HEIGHT: 25px; TEXT-DECORATION: none}
			.unnamed1 {FONT-SIZE: 12px; COLOR: #000000; TEXT-DECORATION: none}
			.unnamed2 {FONT-SIZE: 12px; LINE-HEIGHT: 25px; TEXT-DECORATION: none}
			.da {font-size: 14px;color: #FFFFFF;letter-spacing: 1px;}
      </style>
      
      <script language="javascript">
            function back1()
	        {
	           window.history.go(-1);
	        }
	        
	        function dd()
	        {
	            var odderFukuangfangshi=document.f.odderFukuangfangshi.value;
	            //alert(odderFukuangfangshi);
	            if(odderFukuangfangshi=="银行付款")
	            {
	                 document.getElementById("qufukuan").style.display="block";
	            }
	            if(odderFukuangfangshi=="货到付款")
	            {
	                 document.getElementById("qufukuan").style.display="none";
	            }
	        }
	        
	        function kahao()
	        {
	            var strUrl = "<%=path %>/qiantai/order/kahao.jsp";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:700px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
	        }
    </script>
  </head>
  
  <BODY leftMargin=0 topMargin=0 bgColor=#ffffff>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width=960 bgColor=#ffffff align=center style="background-image: url('<%=path %>/img/logo.jpg'); background-repeat : repeat-xy">
		  <TR>
		    <TD height=357 width=960 align=center>
			     &nbsp;
		    </TD>
		  </TR>
		</TABLE>
		
        <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
  
		<TABLE border=0 cellSpacing=0 cellPadding=0 width=960 bgColor=#ffffff align=center>
		  <TR>
		    <TD class=b vAlign=top width=220>
		       <jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>
		    </TD>
		    
		    
		    <td width="1" bgcolor="#A9A9A9"></td>
		    <td width="3" bgcolor="white"></td>
		    <!-- 右部分-->
		    <TD class=b vAlign=top width=591 align=left>
		      <TABLE border=0 cellSpacing=0 cellPadding=0 width=732 align=center   style="color:white;font-weight: 700;margin-top: 2px; background-image: url('<%=path %>/img/banner.jpg'); background-repeat : repeat-xy;FONT-SIZE:12pt;">
		        <TR>
		          <TD height="50">
		               &nbsp;&nbsp;&nbsp;订单确认
                  </TD>
		        </TR>
		      </TABLE>
		      <TABLE border=0 cellSpacing=0 cellPadding=2 width=732 align=left height=133>
		        <TR>
		          <TD height=129 vAlign=top align=left>
		              <form action="<%=path %>/orderSubmit.action" name="f" method="post">
		                        <table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人帐号：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userName"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人姓名：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userRealname"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人联系电话：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userTel"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">收货人地址：</td>
					                  <td width="80%" align="left">
					                      <input type="text" readonly="readonly" value="<s:property value="#session.user.userAddress"/>"/>
					                  </td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">送货地址：</td>
					                  <td width="80%" align="left"><input type="text" name="odderSonghuodizhi"/></td>
					              </tr>
					              <tr align='center' bgcolor="#FFFFFF" height="22">
					                  <td width="20%" align="left">付款方式：</td>
					                  <td width="80%" align="left">
		   		                          <select name="odderFukuangfangshi" style="width:155px;" onchange="dd()">
		   		                               <option value="货到付款">货到付款</option>
		   		                               <option value="银行付款">银行付款</option>
		   		                          </select>
		   		                          <input type="button" onclick="kahao()" id="qufukuan" style="display: none" value="查看卡号"/>
		                              </td>
					              </tr>
		        				</table>
		        				<table>
		        				   <tr height="7"><td></td></tr>
				                   <tr>
				                       <td><a href="#" onclick="back1()"><img border="0" src="<%=path %>/img/back.jpg"/></a></td>
				                       <td><img border="0" src="<%=path %>/img/orderSub.jpg" onclick="javascript:document.f.submit();"/></td>
				                   </tr>
				               </table>
				      </form>
		          </TD>
		        </TR>
		      </TABLE>
		   </TD>
		  </TR>
		</TABLE>


		<TABLE border=0 cellSpacing=0 cellPadding=0 width=960 bgColor=#a9a9a9 align=center>
		  <TR><TD rowSpan=5 width=1></TD></TR>
		</TABLE>
    
    
        <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
  </BODY>
</html>
