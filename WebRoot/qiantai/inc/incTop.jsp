<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <script type="text/javascript">
         function userReg()
         {
                var url="<%=path %>/qiantai/userinfo/userReg.jsp";
                var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
         }
         
         function myXinxi()
         {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
                var url="<%=path %>/qiantai/userinfo/userXinxi.jsp";
                var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
            </s:else>
         }
         function myCart()
         {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
                 var s="<%=path %>/myCart.action";
                 window.location.href=s;
            </s:else>
         }
        
         function myOrder()
         {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
                 var s="<%=path %>/myOrder.action";
                 window.location.href=s;
            </s:else>
         }
         
          function luntanindex()
         {
            <s:if test="#session.user==null">
                  alert("请先登录");
            </s:if>
            
            <s:else>
                alert("SSSSSSSSSSS");
                 var s="<%=path %>/luntanindex.action";
                 window.location.href=s;
            </s:else>
         }        
         
      </script>
  </head>
  
  <body>
       <TABLE  border=0 cellSpacing=0 cellPadding=0 width=960 align=center style="background-image: url('<%=path %>/img/banner.jpg'); background-repeat : repeat-xy">
		  <TR>
		    <TD style="height: 50px;font-weight: 900;">
		         &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/goodsAll.action">所有汽车</A>
		         &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="myCart()">我的购物车</A>
		         &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="myOrder()">我的订单</A>
		         &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="userReg()">免费注册</A>
		         &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="myXinxi()">我的信息</A>
		         &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/luntanindex.action">论坛</A>
		         
		         &nbsp;&nbsp;&nbsp;&nbsp;(排序：<a href="<%=path %>/goodsPaihang.action">销售排行</A>
		         &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/goodsNew.action">最新上架</A>)
		    </TD>
		  </TR>
	   </TABLE>
  </body>
</html>
