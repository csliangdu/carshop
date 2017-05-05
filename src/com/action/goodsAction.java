package com.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderItemDAO;
import com.model.TGoods;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;

public class goodsAction extends ActionSupport
{
	private Integer goodsId;
	private Integer xiaoleibieId;
	private String goodsName;
	private String goodsZuozhe;

	private String goodsMulu;
	private String fujian;
	private Integer goodsShichangjia;
	private Integer goodsTejia;

	private String fabushi;
	private String goodsDel;
	
	private String message;
	private String path;
	
	private TGoodsDAO goodsDAO;
	private TOrderItemDAO orderItemDAO;
	
	
	//添加汽车信息
	public String goodsAdd()
	{
		TGoods goods=new TGoods();
		
		goods.setXiaoleibieId(xiaoleibieId);
		goods.setGoodsName(goodsName);
		goods.setGoodsZuozhe(goodsZuozhe);
		goods.setGoodsMulu(goodsMulu);
		
		goods.setGoodsPic(fujian);
		goods.setGoodsShichangjia(goodsShichangjia);
		goods.setGoodsTejia(goodsShichangjia);
		goods.setFabushi(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		goods.setGoodsDel("no");
		
		goodsDAO.save(goods);
		this.setMessage("操作成功");
		this.setPath("goodsMana.action");
		return "succeed";
		
	}
	
	
	
	
	//删除汽车信息
	public String goodsDel()
	{
		TGoods goods=goodsDAO.findById(goodsId);
		goods.setGoodsDel("yes");
		goodsDAO.attachDirty(goods);
		this.setMessage("操作成功");
		this.setPath("goodsMana.action");
		return "succeed";
	}
	
	
	
	//汽车管理
	public String goodsMana()
	{
		String sql="from TGoods where goodsDel='no'";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	//汽车详细信息
	public String goodsDetailHou()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	
	//会员查看汽车详细信息
	public String goodsDetailQian()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	
	
	//会员查看所有汽车
	public String goodsAll()
	{
        HttpServletRequest request=ServletActionContext.getRequest();
		
        String sql="from TGoods where goodsDel='no' order by xiaoleibieId";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		
		
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, goodsList.size());
		List goodsList1 = goodsList.subList(fromIndex, toIndex);
		
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(goodsList.size());//设置总共的条数
        p.setData(goodsList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
		
	}
	
	
	
	
	//按照类别查看汽车信息
	public String goods_xiaoleibie()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and xiaoleibieId=?";
		Object[] con={xiaoleibieId};
		List goodsList=goodsDAO.getHibernateTemplate().find(sql,con);
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	//汽车查询
	public String goodsSearch()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and goodsName like '%"+goodsName.trim()+"%'";
		
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}

	public String goodsNew()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' order by fabushi desc";
		
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		
		if(goodsList.size()>8)
		{
			goodsList=goodsList.subList(0, 8);
		}
		
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}

	public String goodsPaihang()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
        List goodsList=new ArrayList();
		String sql="select sum(goodsQuantity),goodsId from TOrderItem group by goodsId order by sum(goodsQuantity) desc";
		List list=orderItemDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<list.size();i++)
		{
			Object[] b=(Object[])list.get(i);
			int goodsId=Integer.parseInt(b[1].toString());
			System.out.println(goodsId+"&&");
			TGoods goods=goodsDAO.findById(goodsId);
			goodsList.add(goods);
		}
		if(goodsList.size()>8)
		{
			goodsList=goodsList.subList(0, 8);
		}
		
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}
	

	public String getFabushi()
	{
		return fabushi;
	}
	public void setFabushi(String fabushi)
	{
		this.fabushi = fabushi;
	}
	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}
	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}
	public String getGoodsDel()
	{
		return goodsDel;
	}
	public void setGoodsDel(String goodsDel)
	{
		this.goodsDel = goodsDel;
	}
	public Integer getGoodsId()
	{
		return goodsId;
	}
	public void setGoodsId(Integer goodsId)
	{
		this.goodsId = goodsId;
	}
	public String getGoodsMulu()
	{
		return goodsMulu;
	}
	public void setGoodsMulu(String goodsMulu)
	{
		this.goodsMulu = goodsMulu;
	}
	public String getGoodsName()
	{
		return goodsName;
	}
	public void setGoodsName(String goodsName)
	{
		this.goodsName = goodsName;
	}
	public String getFujian()
	{
		return fujian;
	}
	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}
	public Integer getGoodsShichangjia()
	{
		return goodsShichangjia;
	}
	public void setGoodsShichangjia(Integer goodsShichangjia)
	{
		this.goodsShichangjia = goodsShichangjia;
	}
	public Integer getGoodsTejia()
	{
		return goodsTejia;
	}
	public void setGoodsTejia(Integer goodsTejia)
	{
		this.goodsTejia = goodsTejia;
	}
	public String getGoodsZuozhe()
	{
		return goodsZuozhe;
	}
	public void setGoodsZuozhe(String goodsZuozhe)
	{
		this.goodsZuozhe = goodsZuozhe;
	}
	public TOrderItemDAO getOrderItemDAO()
	{
		return orderItemDAO;
	}
	public void setOrderItemDAO(TOrderItemDAO orderItemDAO)
	{
		this.orderItemDAO = orderItemDAO;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public Integer getXiaoleibieId()
	{
		return xiaoleibieId;
	}
	public void setXiaoleibieId(Integer xiaoleibieId)
	{
		this.xiaoleibieId = xiaoleibieId;
	}
	
}
