package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TBankuaiDAO;
import com.dao.TUserDAO;
import com.model.TBankuai;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class bankuaiAction extends ActionSupport {
	private Integer id;
	private String name;
	private String jieshao;
	private int banzhu;
	private String del;

	private String message;
	private String path;

	private TBankuaiDAO bankuaiDAO;
	private TUserDAO userDAO;

	public String bankuaiAdd() {
		TBankuai bankuai = new TBankuai();

		bankuai.setName(name);
		bankuai.setJieshao(jieshao);
		bankuai.setBanzhu(0);
		bankuai.setDel("no");

		bankuaiDAO.save(bankuai);

		this.setMessage("操作成功");
		this.setPath("bankuaiMana.action");
		return "succeed";
	}

	public String bankuaiMana() {
		String sql = "from TBankuai where del='no'";
		List bankuaiList = bankuaiDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < bankuaiList.size(); i++) {
			TBankuai bankuai = (TBankuai) bankuaiList.get(i);
			bankuai.setUser(userDAO.findById(bankuai.getBanzhu()));
		}
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("bankuaiList", bankuaiList);
		return ActionSupport.SUCCESS;
	}

	public String bankuaiDel() {

		TBankuai bankuai = bankuaiDAO.findById(id);
		bankuai.setDel("yes");
		bankuaiDAO.attachDirty(bankuai);

		this.setMessage("操作成功");
		this.setPath("bankuaiMana.action");
		return "succeed";
	}

	public String banzhushezhi() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String loginname = request.getParameter("loginname").trim();

		String sql = "from TUser where loginname=? and del='no'";
		Object[] c = { loginname.trim() };
		List list = userDAO.getHibernateTemplate().find(sql, c);
		if (list.size() == 0) {
			request.setAttribute("msg", "你输入的账号不存在");
			return "msg";
		}

		TUser user = (TUser) list.get(0);

		TBankuai bankuai = bankuaiDAO.findById(id);
		bankuai.setBanzhu(user.getUserId());
		bankuaiDAO.attachDirty(bankuai);

		request.setAttribute("msg", "版主设置完毕");
		return "msg";
	}

	public TBankuaiDAO getBankuaiDAO() {
		return bankuaiDAO;
	}

	public void setBankuaiDAO(TBankuaiDAO bankuaiDAO) {
		this.bankuaiDAO = bankuaiDAO;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJieshao() {
		return jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	public int getBanzhu() {
		return banzhu;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setBanzhu(int banzhu) {
		this.banzhu = banzhu;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
