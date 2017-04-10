package com.yonyou.iuap.invoice.company;

import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.FK;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.OneToMany;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;
import com.yonyou.iuap.persistence.vo.BaseEntity;


/**
 * <b> 此处简要描述此类功能 </b>
 * <p>
 *   此处添加类的描述信息
 * </p>
 *  创建日期:2017-3-24
 * @author 
 * @version 
 */
@Entity(namespace = "whpoc",name = "Company")
@Table(name = "whpoc_company")
public class CompanyVO extends BaseEntity{
	
    @Id
    @GeneratedValue(strategy = Stragegy.UUID, moudle = "")  
    @Column(name = "compan_id")
    private java.lang.String companid;
      
    @Column(name = "company_code")
    private java.lang.String companycode;
      
    @Column(name = "company_name")
    private java.lang.String companyname;
      
    @Column(name = "dr")
    private java.lang.Integer dr = 0;
      
    @Column(name = "ts")
    private java.util.Date ts;
        
	
	

	/**
	 * 属性 companid的Getter方法.属性名：主键
	 *  创建日期:2017-3-24
	 * @return java.lang.String
	 */
	public java.lang.String getCompanid () {
		return companid;
	}
	   
	/**
	 * 属性companid的Setter方法.属性名：主键
	 * 创建日期:2017-3-24
	 * @param newCompanid java.lang.String
	 */
	public void setCompanid (java.lang.String newCompanid ) {
	 	this.companid = newCompanid;
	} 	 
	
	/**
	 * 属性 companycode的Getter方法.属性名：公司代码
	 *  创建日期:2017-3-24
	 * @return java.lang.String
	 */
	public java.lang.String getCompanycode () {
		return companycode;
	}
	   
	/**
	 * 属性companycode的Setter方法.属性名：公司代码
	 * 创建日期:2017-3-24
	 * @param newCompanycode java.lang.String
	 */
	public void setCompanycode (java.lang.String newCompanycode ) {
	 	this.companycode = newCompanycode;
	} 	 
	
	/**
	 * 属性 companyname的Getter方法.属性名：公司名称
	 *  创建日期:2017-3-24
	 * @return java.lang.String
	 */
	public java.lang.String getCompanyname () {
		return companyname;
	}
	   
	/**
	 * 属性companyname的Setter方法.属性名：公司名称
	 * 创建日期:2017-3-24
	 * @param newCompanyname java.lang.String
	 */
	public void setCompanyname (java.lang.String newCompanyname ) {
	 	this.companyname = newCompanyname;
	} 	 
	
	/**
	 * 属性 dr的Getter方法.属性名：dr
	 *  创建日期:2017-3-24
	 * @return java.lang.Integer
	 */
	public java.lang.Integer getDr () {
		return dr;
	}
	   
	/**
	 * 属性dr的Setter方法.属性名：dr
	 * 创建日期:2017-3-24
	 * @param newDr java.lang.Integer
	 */
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	 
	
	/**
	 * 属性 ts的Getter方法.属性名：ts
	 *  创建日期:2017-3-24
	 * @return java.util.Date
	 */
	public java.util.Date getTs () {
		return ts;
	}
	   
	/**
	 * 属性ts的Setter方法.属性名：ts
	 * 创建日期:2017-3-24
	 * @param newTs java.util.Date
	 */
	public void setTs (java.util.Date newTs ) {
	 	this.ts = newTs;
	} 	 
	
    @Override
    public String getMetaDefinedName() {
        return "Company";
    }

    @Override
    public String getNamespace() {
        return "whpoc";
    }
}