package com.yonyou.iuap.tepoc.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.FK;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;
import com.yonyou.iuap.persistence.vo.BaseEntity;

import java.util.Date;
	import java.util.List;
	


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
@Entity(namespace = "tepoc",name = "UserRole")
@Table(name = "user_role")
public class UserRoleVO extends BaseEntity{
	 
    @FK(name = "fk_id_userrole", referenceTableName = "userpsn", referencedColumnName = "pk_user") 
    @Column(name = "fk_id_userrole")
    private java.lang.String fk_id_userrole;
    
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "pk_user_role")
	private String pk_user_role;
	
	@Column(name = "pk_role")
	private String pk_role;
	
	private String pk_role_name;  //参照需要显示的名字
	
	@Column(name = "rolecode")
	private String rolecode;
	
	@Column(name = "rolename")
	private String rolename;
	
	@Column(name = "roletype")
	private String roletype;
	
	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.util.Date ts ;
	

	/**
	 * 属性 fk的Getter方法.属性名：parentPK
	 *  创建日期:2016-11-17
	 * @return java.lang.String
	 */
	public java.lang.String getFk_id_userrole() {
		return fk_id_userrole;
	}
	   
	/**
	 * 属性fk的Setter方法.属性名：parentPK
	 * 创建日期:2016-11-17
	 * @param newFk java.lang.String
	 */
	public void setFk_id_userrole (java.lang.String fk_id_userrole ) {
	 	this.fk_id_userrole = fk_id_userrole;
	} 	 
	

	public String getPk_user_role() {
		return this.pk_user_role;
	}

	public void setPk_user_role(String pk_user_role) {
		this.pk_user_role = pk_user_role;
	}


	public String getPk_role() {
		return this.pk_role;
	}

	public void setPk_role(String pk_role) {
		this.pk_role = pk_role;
	}

	public String getPk_role_name() {
		return this.pk_role_name;
	}

	public void setPk_role_name(String name) {
		this.pk_role_name = name;
	}
	

	public String getRolecode() {
		return this.rolecode;
	}

	public void setRolecode(String rolecode) {
		this.rolecode = rolecode;
	}


	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}


	public String getRoletype() {
		return this.roletype;
	}

	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}

	
	/**
	 * 属性 dr的Getter方法.属性名：dr
	 *  创建日期:2016-11-17
	 * @return java.lang.Integer
	 */
	public java.lang.Integer getDr () {
		return dr;
	}
	   
	/**
	 * 属性dr的Setter方法.属性名：dr
	 * 创建日期:2016-11-17
	 * @param newDr java.lang.Integer
	 */
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	 
	
	/**
	 * 属性 ts的Getter方法.属性名：ts
	 *  创建日期:2016-11-17
	 * @return java.util.Date
	 */
	public java.util.Date getTs () {
		return ts;
	}
	   
	/**
	 * 属性ts的Setter方法.属性名：ts
	 * 创建日期:2016-11-17
	 * @param newTs java.util.Date
	 */
	public void setTs (java.util.Date newTs ) {
	 	this.ts = newTs;
	} 	 
	
	@Override
    public String getMetaDefinedName() {
        return "UserRole";
    }

    @Override
    public String getNamespace() {
        return "tepoc";
    }
}