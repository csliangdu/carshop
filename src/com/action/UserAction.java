package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class UserAction extends ActionSupport {

	private Integer userId;
	private String loginname;
	private String userPw;
	private String userRealname;

	private String userSex;
	private String userAge;
	private String userAddress;
	private String userTel;

	private String userEmail;

	private String fujian;
	private Integer jifen;

	private String message;
	private String path;

	private TUserDAO userDAO;

	// 会员注册
	public String userReg() {

		String sql = "from TUser where loginname=? and del='no'";
		Object[] c = { loginname.trim() };
		List list = userDAO.getHibernateTemplate().find(sql, c);
		if (list.size() > 0) {
			this.setMessage("账号已被占用，请重新注册");
			this.setPath("/qiantai/userinfo/userReg.jsp");
			return "succeed";
		}

		TUser user = new TUser();

		user.setLoginname(loginname);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		user.setUserSex(userSex);

		user.setUserAge(userAge);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);

		user.setUserDel("no");

		if (fujian.equals("")) {
			user.setFujian("/img/user2.gif");
		} else {
			user.setFujian(fujian);
		}

		user.setJifen(0);
		userDAO.save(user);

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("msg", "注册成功，请登录");
		return "msg";

	}

	// 会员修改个人资料
	public String userEdit() {
		TUser user = userDAO.findById(userId);

		user.setLoginname(loginname);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		user.setUserSex(userSex);

		user.setUserAge(userAge);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		user.setFujian(fujian);
		userDAO.attachDirty(user);

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("msg", "修改成功。重新登录后生效");
		return "msg";
	}

	// 管理员删除会员
	public String userDel() {
		TUser user = userDAO.findById(userId);
		user.setUserDel("yes");
		userDAO.attachDirty(user);

		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}

	// 管理员查看会员信息
	public String userXinxi() {
		String sql = "from TUser where userId=" + userId;

		List userList = userDAO.getHibernateTemplate().find(sql);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}

	// 会员管理
	public String userMana() {
		String sql = "from TUser where userDel='no'";

		List userList = userDAO.getHibernateTemplate().find(sql);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
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

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAge() {
		return userAge;
	}

	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public Integer getJifen() {
		return jifen;
	}

	public void setJifen(Integer jifen) {
		this.jifen = jifen;
	}

}
