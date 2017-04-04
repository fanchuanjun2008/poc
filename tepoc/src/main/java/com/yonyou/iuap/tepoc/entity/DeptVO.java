package com.yonyou.iuap.tepoc.entity;

import java.util.Date;
	

import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;
import com.yonyou.iuap.persistence.vo.BaseEntity;



/**
 * <b> 此处简要描述此类功能 </b>
 * <p>
 *   此处添加类的描述信息
 * </p>
 * @author 
 * @version 
 */
@Entity(namespace = "metadata",name = "dept")
@Table(name="dept")
public class DeptVO extends BaseEntity {
	  
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "pk_dept")
	private String pk_dept;

	@Column(name = "org_id")
	private String orgid;

	@Column(name = "dept_code")
	private String deptcode;

	@Column(name = "dept_name")
	private String deptname;

	@Column(name = "parent_id")
	private String parentid;

	private String parentid_name;  //参照需要显示的名字
	
	@Column(name = "dept_type")
	private String depttype;

	@Column(name = "createdate")
	private Date createdate;

	@Column(name = "short_name")
	private String shortname;

	@Column(name = "creator")
	private String creator;

	@Column(name = "creationtime")
	private Date creationtime;

	@Column(name = "deptcanceldate")
	private Date deptcanceldate;


	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;    	

	public String getPk_dept() {
		return this.pk_dept;
	}

	public void setPk_dept(String pk_dept) {
		this.pk_dept = pk_dept;
	}
	

	public String getOrgid() {
		return this.orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	

	public String getDeptcode() {
		return this.deptcode;
	}

	public void setDeptcode(String deptcode) {
		this.deptcode = deptcode;
	}
	

	public String getDeptname() {
		return this.deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	

	public String getParentid() {
		return this.parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	public String getParentid_name() {
		return this.parentid_name;
	}

	public void setParentid_name(String name) {
		this.parentid_name = name;
	}
	

	public String getDepttype() {
		return this.depttype;
	}

	public void setDepttype(String depttype) {
		this.depttype = depttype;
	}
	

	public Date getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	

	public String getShortname() {
		return this.shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
	

	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}
	

	public Date getCreationtime() {
		return this.creationtime;
	}

	public void setCreationtime(Date creationtime) {
		this.creationtime = creationtime;
	}
	

	public Date getDeptcanceldate() {
		return this.deptcanceldate;
	}

	public void setDeptcanceldate(Date deptcanceldate) {
		this.deptcanceldate = deptcanceldate;
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
	        return "dept";
	    }

	    @Override
	    public String getNamespace() {
	        return "metadata";
	    }
}