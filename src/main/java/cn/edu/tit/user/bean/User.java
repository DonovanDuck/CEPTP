package cn.edu.tit.user.bean;


import java.io.InputStream;
import java.util.Arrays;
import java.util.Date;

import org.springframework.stereotype.Repository;
@Repository
public class User {
	private String user_id;// 学号、工号
	private String user_name;// 姓名
	private Boolean sex;// 性别
	private String password;// 密码
	private String class_name;// 班级
	private String professional_title; //职称
	private String detail; //简介
	private byte[] face; //头像
	private String pro;// 专业
	private String qq;// QQ号
	private String mobile;// 移动电话
	private Boolean delete_flg;//是否删除
	private String create_user;//创建者
	private Date create_time;//创建时间
	private String update_user;//更新者
	private Date update_time;//更新时间
	public User() {
		super();
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Boolean getSex() {
		return sex;
	}
	public void setSex(Boolean sex) {
		this.sex = sex;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getProfessional_title() {
		return professional_title;
	}
	public void setProfessional_title(String professional_title) {
		this.professional_title = professional_title;
	}
	
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
	public User(String user_id, String user_name, Boolean sex, String password, String class_name,
			String professional_title, String detail, byte[] face, String pro, String qq, String mobile
			) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.sex = sex;
		this.password = password;
		this.class_name = class_name;
		this.professional_title = professional_title;
		this.detail = detail;
		this.face = face;
		this.pro = pro;
		this.qq = qq;
		this.mobile = mobile;
	}
	public byte[] getFace() {
		return face;
	}
	public void setFace(byte[] face) {
		this.face = face;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Boolean getDelete_flg() {
		return delete_flg;
	}
	public void setDelete_flg(Boolean delete_flg) {
		this.delete_flg = delete_flg;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	
	
}
