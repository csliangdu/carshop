package com.model;


public class TBankuai implements java.io.Serializable
{

	private Integer id;
	private String name;
	private String jieshao;
	private int banzhu;
	
	private String del;
	
	private TUser user;
	private int zhutishu;
	
	public String getDel()
	{
		return del;
	}
	public void setDel(String del)
	{
		this.del = del;
	}
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	
	
	
	public int getZhutishu()
	{
		return zhutishu;
	}
	public void setZhutishu(int zhutishu)
	{
		this.zhutishu = zhutishu;
	}
	public TUser getUser()
	{
		return user;
	}
	public void setUser(TUser user)
	{
		this.user = user;
	}
	public String getJieshao()
	{
		return jieshao;
	}
	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}
	public int getBanzhu()
	{
		return banzhu;
	}
	public void setBanzhu(int banzhu)
	{
		this.banzhu = banzhu;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

}