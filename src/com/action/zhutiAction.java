package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.THuifuDAO;
import com.dao.TUserDAO;
import com.dao.TZhutiDAO;
import com.model.THuifu;
import com.model.TUser;
import com.model.TZhuti;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class zhutiAction extends ActionSupport {
	private int id;
	private String title;
	private String content;
	private String fujian;

	private String fujianYuanshiming;
	private String shijian;
	private Integer userId;
	private Integer bankuaiId;

	private String shifouding;

	private String message;
	private String path;

	private TZhutiDAO zhutiDAO;
	private THuifuDAO huifuDAO;
	private TUserDAO userDAO;

	public String zhutiAdd() {
		TZhuti zhuti = new TZhuti();

		zhuti.setTitle(title);
		zhuti.setContent(content);
		zhuti.setFujian(fujian);
		zhuti.setFujianYuanshiming(fujianYuanshiming);

		zhuti.setShijian(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		zhuti.setUserId(userId);
		zhuti.setCatelogId(bankuaiId);
		zhuti.setShifouding("否");
		zhuti.setShifoujing("否");

		zhutiDAO.save(zhuti);

		update_user_jifen_jia1(userId);

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("msg", "信息发布成功");
		return "msg";
	}

	public String zhutiAll() {
		String s2 = "from TZhuti where catelogId=" + bankuaiId
				+ "and shifouding='是'";
		List zhuti_list_all = zhutiDAO.getHibernateTemplate().find(s2);

		String s3 = "from TZhuti where catelogId=" + bankuaiId
				+ "and shifouding='否' order by shijian desc";
		List zhuti_list_fouzhiding = zhutiDAO.getHibernateTemplate().find(s3);

		for (int i = 0; i < zhuti_list_fouzhiding.size(); i++) {
			TZhuti zhuti = (TZhuti) zhuti_list_fouzhiding.get(i);
			zhuti_list_all.add(zhuti);
		}

		for (int j = 0; j < zhuti_list_all.size(); j++) {
			TZhuti zhuti = (TZhuti) zhuti_list_all.get(j);
			zhuti.setUser(userDAO.findById(zhuti.getUserId()));
			zhuti.setHuifushu(huifuDAO.getHibernateTemplate()
					.find("from THuifu where zhutiId=" + zhuti.getId()).size());
		}

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("zhuti_list_all", zhuti_list_all);
		req.setAttribute("catelogId", bankuaiId);
		return ActionSupport.SUCCESS;
	}

	public String zhutiRes() {
		String s2 = "from TZhuti where title like '%" + title.trim() + "%'";
		List zhuti_list_all = zhutiDAO.getHibernateTemplate().find(s2);

		for (int j = 0; j < zhuti_list_all.size(); j++) {
			TZhuti zhuti = (TZhuti) zhuti_list_all.get(j);
			zhuti.setUser(userDAO.findById(zhuti.getUserId()));
			zhuti.setHuifushu(huifuDAO.getHibernateTemplate()
					.find("from THuifu where zhutiId=" + zhuti.getId()).size());
		}

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("zhuti_list_all", zhuti_list_all);
		return ActionSupport.SUCCESS;
	}

	public String zhutiMana() {
		String s2 = "from TZhuti where shifouding='是'";
		List zhuti_list_all = zhutiDAO.getHibernateTemplate().find(s2);

		String s3 = "from TZhuti where shifouding='否' order by shijian desc";
		List zhuti_list_fouzhiding = zhutiDAO.getHibernateTemplate().find(s3);

		for (int i = 0; i < zhuti_list_fouzhiding.size(); i++) {
			TZhuti zhuti = (TZhuti) zhuti_list_fouzhiding.get(i);
			zhuti_list_all.add(zhuti);
		}

		for (int j = 0; j < zhuti_list_all.size(); j++) {
			TZhuti zhuti = (TZhuti) zhuti_list_all.get(j);
			zhuti.setUser(userDAO.findById(zhuti.getUserId()));
			zhuti.setHuifushu(huifuDAO.getHibernateTemplate()
					.find("from THuifu where zhutiId=" + zhuti.getId()).size());
		}

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("zhuti_list_all", zhuti_list_all);
		return ActionSupport.SUCCESS;
	}

	public String zhutiDel() {

		TZhuti zhuti = zhutiDAO.findById(id);
		zhutiDAO.delete(zhuti);

		String sql = "delete from THuifu where zhutiId=" + zhuti.getId();
		huifuDAO.getHibernateTemplate().bulkUpdate(sql);

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("msg", "成功删除");
		return "msg";
	}

	public String zhuti_zhiding_shezhi() {

		TZhuti zhuti = zhutiDAO.findById(id);
		zhuti.setShifouding("是");
		zhutiDAO.getHibernateTemplate().update(zhuti);

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("msg", "设置置顶成功");
		return "msg";
	}

	public String zhuti_zhiding_quxiao() {

		TZhuti zhuti = zhutiDAO.findById(id);
		zhuti.setShifouding("否");
		zhutiDAO.getHibernateTemplate().update(zhuti);

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("msg", "取消置顶成功");
		return "msg";
	}

	public String zhuti_jinghua_shezhi() {

		TZhuti zhuti = zhutiDAO.findById(id);
		zhuti.setShifoujing("是");
		zhutiDAO.getHibernateTemplate().update(zhuti);

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("msg", "设置精华成功");
		return "msg";
	}

	public String zhuti_jinghua_quxiao() {

		TZhuti zhuti = zhutiDAO.findById(id);
		zhuti.setShifoujing("否");
		zhutiDAO.getHibernateTemplate().update(zhuti);

		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("msg", "取消精华成功");
		return "msg";
	}

	public String zhutiMe() {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		TUser user = (TUser) session.getAttribute("user");

		String s2 = "from TZhuti where userId=" + user.getUserId()
				+ " and shifouding='是'";
		List zhuti_list_all = zhutiDAO.getHibernateTemplate().find(s2);

		String s3 = "from TZhuti where userId=" + user.getUserId()
				+ " and shifouding='否' order by shijian desc";
		List zhuti_list_fouzhiding = zhutiDAO.getHibernateTemplate().find(s3);

		for (int i = 0; i < zhuti_list_fouzhiding.size(); i++) {
			TZhuti zhuti = (TZhuti) zhuti_list_fouzhiding.get(i);
			zhuti_list_all.add(zhuti);
		}

		for (int j = 0; j < zhuti_list_all.size(); j++) {
			TZhuti zhuti = (TZhuti) zhuti_list_all.get(j);
			zhuti.setUser(userDAO.findById(zhuti.getUserId()));
			zhuti.setHuifushu(huifuDAO.getHibernateTemplate()
					.find("from THuifu where zhutiId=" + zhuti.getId()).size());
		}

		req.setAttribute("zhuti_list_all", zhuti_list_all);
		return ActionSupport.SUCCESS;
	}

	public void update_user_jifen_jia1(int id) {
		String sql = "update TUser set jifen=jifen+1 where id=" + id;
		userDAO.getHibernateTemplate().bulkUpdate(sql);
	}

	public Integer getBankuaiId() {
		return bankuaiId;
	}

	public void setBankuaiId(Integer bankuaiId) {
		this.bankuaiId = bankuaiId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public THuifuDAO getHuifuDAO() {
		return huifuDAO;
	}

	public void setHuifuDAO(THuifuDAO huifuDAO) {
		this.huifuDAO = huifuDAO;
	}

	public int getId() {
		return id;
	}

	public String getShifouding() {
		return shifouding;
	}

	public void setShifouding(String shifouding) {
		this.shifouding = shifouding;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public String getFujianYuanshiming() {
		return fujianYuanshiming;
	}

	public void setFujianYuanshiming(String fujianYuanshiming) {
		this.fujianYuanshiming = fujianYuanshiming;
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

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public TZhutiDAO getZhutiDAO() {
		return zhutiDAO;
	}

	public void setZhutiDAO(TZhutiDAO zhutiDAO) {
		this.zhutiDAO = zhutiDAO;
	}

}
