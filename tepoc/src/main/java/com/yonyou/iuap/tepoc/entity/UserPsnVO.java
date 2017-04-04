package com.yonyou.iuap.tepoc.entity;

import java.util.Date;
	import java.util.List;
	

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.OneToMany;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;
import com.yonyou.iuap.persistence.vo.BaseEntity;


/**
 * <b> 此处简要描述此类功能 </b>
 * <p>
 *   此处添加类的描述信息
 * </p>
 *  创建日期:2016-11-17
 * @author 
 * @version 
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity(namespace = "tepoc",name = "UserPsn")
@Table(name = "userpsn")
public class UserPsnVO extends BaseEntity{
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "pk_user")
	private String pk_user;

	@Column(name = "username")
	private String username;

	@Column(name = "sex")
	private String sex;

	@Column(name = "idcard")
	private String idcard;

	@Column(name = "brithdate")
	private Date brithdate;

	@Column(name = "email")
	private String email;

	@Column(name = "telphone")
	private String telphone;

	@Column(name = "edution")
	private String edution;

	@Column(name = "major")
	private String major;

	@Column(name = "work_date")
	private Date work_date;

	@Column(name = "pk_corp")
	private String pk_corp;

	private String pk_corp_name;  //参照需要显示的名字
	
	@Column(name = "pk_dept")
	private String pk_dept;

	private String pk_dept_name;  //参照需要显示的名字
	
	@Column(name = "photo")
	private String photo;

	@Column(name = "defitem1")
	private String defitem1;

	@Column(name = "defitem2")
	private String defitem2;

	@Column(name = "defitem3")
	private String defitem3;

	@Column(name = "defitem4")
	private String defitem4;

	@Column(name = "defitem5")
	private String defitem5;

	@OneToMany(targetEntity = UserRoleVO.class)
	private List<UserRoleVO> id_userrole;
	
	@OneToMany(targetEntity = UserDeptVO.class)
	private List<UserDeptVO> id_userdept;

	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;


	public String getPk_user() {
		return this.pk_user;
	}

	public void setPk_user(String pk_user) {
		this.pk_user = pk_user;
	}


	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}


	public Date getBrithdate() {
		return this.brithdate;
	}

	public void setBrithdate(Date brithdate) {
		this.brithdate = brithdate;
	}


	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getTelphone() {
		return this.telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}


	public String getEdution() {
		return this.edution;
	}

	public void setEdution(String edution) {
		this.edution = edution;
	}


	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}


	public Date getWork_date() {
		return this.work_date;
	}

	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}


	public String getPk_corp() {
		return this.pk_corp;
	}

	public void setPk_corp(String pk_corp) {
		this.pk_corp = pk_corp;
	}

	public String getPk_corp_name() {
		return this.pk_corp_name;
	}

	public void setPk_corp_name(String name) {
		this.pk_corp_name = name;
	}
	

	public String getPk_dept() {
		return this.pk_dept;
	}

	public void setPk_dept(String pk_dept) {
		this.pk_dept = pk_dept;
	}

	public String getPk_dept_name() {
		return this.pk_dept_name;
	}

	public void setPk_dept_name(String name) {
		this.pk_dept_name = name;
	}
	

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getDefitem1() {
		return this.defitem1;
	}

	public void setDefitem1(String defitem1) {
		this.defitem1 = defitem1;
	}


	public String getDefitem2() {
		return this.defitem2;
	}

	public void setDefitem2(String defitem2) {
		this.defitem2 = defitem2;
	}


	public String getDefitem3() {
		return this.defitem3;
	}

	public void setDefitem3(String defitem3) {
		this.defitem3 = defitem3;
	}


	public String getDefitem4() {
		return this.defitem4;
	}

	public void setDefitem4(String defitem4) {
		this.defitem4 = defitem4;
	}


	public String getDefitem5() {
		return this.defitem5;
	}

	public void setDefitem5(String defitem5) {
		this.defitem5 = defitem5;
	}


	public List<UserRoleVO> getId_userrole() {
		return this.id_userrole;
	}

	public void setId_userrole(List<UserRoleVO> id_userrole) {
		this.id_userrole = id_userrole;
	}

	public List<UserDeptVO> getId_userdept() {
		return id_userdept;
	}

	public void setId_userdept(List<UserDeptVO> id_userdept) {
		this.id_userdept = id_userdept;
	}

	public java.lang.Integer getDr () {
		return dr;
	}
	
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	
	
	public java.sql.Timestamp getTs () {
		return ts;
	}
	
	public void setTs (java.sql.Timestamp newTs ) {
	 	this.ts = newTs;
	} 
	
	@Override
    public String getMetaDefinedName() {
        return "UserPsn";
    }

    @Override
    public String getNamespace() {
        return "tepoc";
    }
}