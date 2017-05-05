package com.service;

import java.util.List;

import com.dao.TCatelogDAO;
import com.dao.TXiaoleibieDAO;

public class catelogService
{
    private TCatelogDAO catelogDAO;
    private TXiaoleibieDAO xiaoleibieDAO;
    
    
    public List findAllCatelog()
    {
    	
    	String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		return cateLogList;
    }
    
    
    public List findAllXiaoleibie(int catelogId)
    {
    	String sql="from TXiaoleibie where del='no' and catelogId="+catelogId;
		List xiaoleibieList=xiaoleibieDAO.getHibernateTemplate().find(sql);
		return xiaoleibieList;
    }

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
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
