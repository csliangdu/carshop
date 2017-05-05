package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.dao.TXiaoleibieDAO;
import com.model.TCatelog;
import com.model.TXiaoleibie;
import com.opensymphony.xwork2.ActionSupport;

public class xiaoleibieAction extends ActionSupport
{
	private int id;
	private String mingcheng;
	private int catelogId;
	
	private TXiaoleibieDAO xiaoleibieDAO;
	
	
	public String xiaoleibieMana()
	{
		String sql="from TXiaoleibie where del='no' and catelogId="+catelogId;
		List xiaoleibieList=xiaoleibieDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("xiaoleibieList", xiaoleibieList);
		request.put("catelogId", catelogId);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String xiaoleibieAdd()
	{
		TXiaoleibie xiaoleibie=new TXiaoleibie();

System.out.println(catelogId+"%%%");
		xiaoleibie.setMingcheng(mingcheng);
		xiaoleibie.setDel("no");
		xiaoleibie.setCatelogId(catelogId);
		
		xiaoleibieDAO.save(xiaoleibie);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "小类别添加完毕");
		return "msg";
	}
	
	public String xiaoleibieDel()
	{
		
		TXiaoleibie xiaoleibie=xiaoleibieDAO.findById(id);
		xiaoleibie.setDel("yes");
		xiaoleibieDAO.attachDirty(xiaoleibie);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "小类别删除完毕");
		return "msg";
	}



	public int getId()
	{
		return id;
	}



	public void setId(int id)
	{
		this.id = id;
	}



	public String getMingcheng()
	{
		return mingcheng;
	}



	public int getCatelogId()
	{
		return catelogId;
	}



	public void setCatelogId(int catelogId)
	{
		this.catelogId = catelogId;
	}



	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}



	public TXiaoleibieDAO getXiaoleibieDAO()
	{
		return xiaoleibieDAO;
	}



	public void setXiaoleibieDAO(TXiaoleibieDAO xiaoleibieDAO)
	{
		this.xiaoleibieDAO = xiaoleibieDAO;
	}
	
}
