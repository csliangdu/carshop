package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TBankuaiDAO;
import com.dao.TUserDAO;
import com.dao.TZhutiDAO;
import com.model.TBankuai;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class luntanAction extends ActionSupport {
	private TBankuaiDAO bankuaiDAO;
	private TZhutiDAO zhutiDAO;
	private TUserDAO userDAO;

	public String luntanindex() {
		Map request = (Map) ServletActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();

		String sql = "from TBankuai where del='no'";
		List bankuaiList = bankuaiDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < bankuaiList.size(); i++) {
			TBankuai bankuai = (TBankuai) bankuaiList.get(i);
			bankuai.setUser(userDAO.findById(bankuai.getBanzhu()));
			bankuai.setZhutishu(get_zhutishu(bankuai.getId()));
		}

		request.put("bankuaiList", bankuaiList);
		return ActionSupport.SUCCESS;
	}

	public int get_zhutishu(int bankuaiId) {
		String s2 = "from TZhuti where catelogId= " + bankuaiId;
		List zhutiList = zhutiDAO.getHibernateTemplate().find(s2);
		return zhutiList.size();
	}

	public TBankuaiDAO getBankuaiDAO() {
		return bankuaiDAO;
	}

	public void setBankuaiDAO(TBankuaiDAO bankuaiDAO) {
		this.bankuaiDAO = bankuaiDAO;
	}

	public TZhutiDAO getZhutiDAO() {
		return zhutiDAO;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setZhutiDAO(TZhutiDAO zhutiDAO) {
		this.zhutiDAO = zhutiDAO;
	}

}
