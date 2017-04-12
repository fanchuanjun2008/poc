package com.yonyou.iuap.saleorder.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
 *  创建日期:2017-2-20
 * @author 
 * @version 
 */
@Entity(namespace = "train",name = "receiveinfo")
@JsonIgnoreProperties(ignoreUnknown = true)
@Table(name = "train_receiveinfo")
public class Receiveinfo extends BaseEntity{
	
    @FK(name = "fk_id_receiveinfo", referenceTableName = "train_saleorder", referencedColumnName = "pk_projectapp")
    @Column(name="fk_id_receiveinfo")
    private java.lang.String fk_id_receiveinfo;
    
    @Id
    @GeneratedValue(strategy = Stragegy.UUID, moudle = "")  
    @Column(name = "pk_receiveinfo")
    private java.lang.String pk_receiveinfo;
      
    @Column(name = "creceiveadddocid")
    private java.lang.String creceiveadddocid;
      
    @Column(name = "csendstockorgvid")
    private java.lang.String csendstockorgvid;
      
    @Column(name = "csendstordocid")
    private java.lang.String csendstordocid;
      
    @Column(name = "dreceivedate")
    private java.util.Date dreceivedate;
      
    @Column(name = "dsenddate")
    private java.util.Date dsenddate;
      
    @Column(name = "dr")
    private java.lang.Integer dr = 0;
      
    @Column(name = "ts")
    private java.util.Date ts;
        
	
	

	public java.lang.String getFk_id_receiveinfo() {
		return fk_id_receiveinfo;
	}

	public void setFk_id_receiveinfo(java.lang.String fk_id_receiveinfo) {
		this.fk_id_receiveinfo = fk_id_receiveinfo;
	}

	/**
	 * 属性 pk_receiveinfo的Getter方法.属性名：收货信息主键
	 *  创建日期:2017-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getPk_receiveinfo () {
		return pk_receiveinfo;
	}
	   
	/**
	 * 属性pk_receiveinfo的Setter方法.属性名：收货信息主键
	 * 创建日期:2017-2-20
	 * @param newPk_receiveinfo java.lang.String
	 */
	public void setPk_receiveinfo (java.lang.String newPk_receiveinfo ) {
	 	this.pk_receiveinfo = newPk_receiveinfo;
	} 	 

	
	/**
	 * 属性 creceiveadddocid的Getter方法.属性名：收货地点
	 *  创建日期:2017-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getCreceiveadddocid () {
		return creceiveadddocid;
	}
	   
	/**
	 * 属性creceiveadddocid的Setter方法.属性名：收货地点
	 * 创建日期:2017-2-20
	 * @param newCreceiveadddocid java.lang.String
	 */
	public void setCreceiveadddocid (java.lang.String newCreceiveadddocid ) {
	 	this.creceiveadddocid = newCreceiveadddocid;
	} 	 
	
	/**
	 * 属性 csendstockorgvid的Getter方法.属性名：发货库存组织
	 *  创建日期:2017-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getCsendstockorgvid () {
		return csendstockorgvid;
	}
	   
	/**
	 * 属性csendstockorgvid的Setter方法.属性名：发货库存组织
	 * 创建日期:2017-2-20
	 * @param newCsendstockorgvid java.lang.String
	 */
	public void setCsendstockorgvid (java.lang.String newCsendstockorgvid ) {
	 	this.csendstockorgvid = newCsendstockorgvid;
	} 	 
	
	/**
	 * 属性 csendstordocid的Getter方法.属性名：发货仓库
	 *  创建日期:2017-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getCsendstordocid () {
		return csendstordocid;
	}
	   
	/**
	 * 属性csendstordocid的Setter方法.属性名：发货仓库
	 * 创建日期:2017-2-20
	 * @param newCsendstordocid java.lang.String
	 */
	public void setCsendstordocid (java.lang.String newCsendstordocid ) {
	 	this.csendstordocid = newCsendstordocid;
	} 	 
	
	/**
	 * 属性 dreceivedate的Getter方法.属性名：到货日期
	 *  创建日期:2017-2-20
	 * @return java.util.Date
	 */
	public java.util.Date getDreceivedate () {
		return dreceivedate;
	}
	   
	/**
	 * 属性dreceivedate的Setter方法.属性名：到货日期
	 * 创建日期:2017-2-20
	 * @param newDreceivedate java.util.Date
	 */
	public void setDreceivedate (java.util.Date newDreceivedate ) {
	 	this.dreceivedate = newDreceivedate;
	} 	 
	
	/**
	 * 属性 dsenddate的Getter方法.属性名：发货日期
	 *  创建日期:2017-2-20
	 * @return java.util.Date
	 */
	public java.util.Date getDsenddate () {
		return dsenddate;
	}
	   
	/**
	 * 属性dsenddate的Setter方法.属性名：发货日期
	 * 创建日期:2017-2-20
	 * @param newDsenddate java.util.Date
	 */
	public void setDsenddate (java.util.Date newDsenddate ) {
	 	this.dsenddate = newDsenddate;
	} 	 
	
	/**
	 * 属性 dr的Getter方法.属性名：dr
	 *  创建日期:2017-2-20
	 * @return java.lang.Integer
	 */
	public java.lang.Integer getDr () {
		return dr;
	}
	   
	/**
	 * 属性dr的Setter方法.属性名：dr
	 * 创建日期:2017-2-20
	 * @param newDr java.lang.Integer
	 */
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	 
	
	/**
	 * 属性 ts的Getter方法.属性名：ts
	 *  创建日期:2017-2-20
	 * @return java.util.Date
	 */
	public java.util.Date getTs () {
		return ts;
	}
	   
	/**
	 * 属性ts的Setter方法.属性名：ts
	 * 创建日期:2017-2-20
	 * @param newTs java.util.Date
	 */
	public void setTs (java.util.Date newTs ) {
	 	this.ts = newTs;
	} 

	@Override
    public String getMetaDefinedName() {
        return "receiveinfo";
    }

    @Override
    public String getNamespace() {
        return "train";
    }
}