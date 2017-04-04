package com.yonyou.iuap.tepoc.entity;

import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.FK;
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
@Entity(namespace = "tepoc",name = "UserDept")
@Table(name="user_dept")
public class UserDeptVO extends BaseEntity {
	
	@FK(name = "fk_id_userdept", referenceTableName = "userpsn", referencedColumnName = "pk_user") 
    @Column(name = "fk_id_userdept")
    private java.lang.String fk_id_userdept;
	
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "pk_user_dept")
	private String pk_user_dept;
	
	@Column(name = "pk_dept")
	private String pk_dept;
	
	private String pk_dept_name;  //参照需要显示的名字
	
	@Column(name = "deptcode")
	private String deptcode;
	
	@Column(name = "deptname")
	private String deptname;
	

	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;    	

	public String getPk_user_dept() {
		return this.pk_user_dept;
	}

	public void setPk_user_dept(String pk_user_dept) {
		this.pk_user_dept = pk_user_dept;
	}
	
	public java.lang.String getFk_id_userdept() {
		return fk_id_userdept;
	}

	public void setFk_id_userdept(java.lang.String fk_id_userdept) {
		this.fk_id_userdept = fk_id_userdept;
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
	        return "UserDept";
	    }

	    @Override
	    public String getNamespace() {
	        return "tepoc";
	    }
}