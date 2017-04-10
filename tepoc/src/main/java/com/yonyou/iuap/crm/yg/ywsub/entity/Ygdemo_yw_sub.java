package com.yonyou.iuap.crm.yg.ywsub.entity;

import java.util.Date;

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
 *  创建日期:2016-11-17
 * @author 
 * @version 
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity(namespace = "iuaptraincrm",name = "ygdemo_yw_sub")
@Table(name = "iuaptraincrm_ygdemo_yw_sub")
public class Ygdemo_yw_sub extends BaseEntity{
	 
    @FK(name = "fk_id_ygdemo_yw_sub", referenceTableName = "iuaptraincrm_ygdemo_yw_info", referencedColumnName = "id") 
    @Column(name = "fk_id_ygdemo_yw_sub")
    private java.lang.String fk_id_ygdemo_yw_sub;
    
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "sub_id")
	private String sub_id;
	
	@Column(name = "sub_code")
	private String sub_code;
	
	@Column(name = "sub_name")
	private String sub_name;
	
	@Column(name = "zbr")
	private String zbr;
	
	private String zbr_name;  //参照需要显示的名字
	
	@Column(name = "sub_ms")
	private String sub_ms;
	
	@Column(name = "begin_date")
	private Date begin_date;
	
	@Column(name = "end_date")
	private Date end_date;
	
	@Column(name = "create_name")
	private String create_name;
	
	private String create_name_name;  //参照需要显示的名字
	
	@Column(name = "create_time")
	private Date create_time;
	
	@Column(name = "update_name")
	private String update_name;
	
	private String update_name_name;  //参照需要显示的名字
	
	@Column(name = "update_time")
	private Date update_time;
	
	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.util.Date ts ;
	

	/**
	 * 属性 fk的Getter方法.属性名：parentPK
	 *  创建日期:2016-11-17
	 * @return java.lang.String
	 */
	public java.lang.String getFk_id_ygdemo_yw_sub() {
		return fk_id_ygdemo_yw_sub;
	}
	   
	/**
	 * 属性fk的Setter方法.属性名：parentPK
	 * 创建日期:2016-11-17
	 * @param newFk java.lang.String
	 */
	public void setFk_id_ygdemo_yw_sub (java.lang.String fk_id_ygdemo_yw_sub ) {
	 	this.fk_id_ygdemo_yw_sub = fk_id_ygdemo_yw_sub;
	} 	 
	

	public String getSub_id() {
		return this.sub_id;
	}

	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}


	public String getSub_code() {
		return this.sub_code;
	}

	public void setSub_code(String sub_code) {
		this.sub_code = sub_code;
	}


	public String getSub_name() {
		return this.sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}


	public String getZbr() {
		return this.zbr;
	}

	public void setZbr(String zbr) {
		this.zbr = zbr;
	}

	public String getZbr_name() {
		return this.zbr_name;
	}

	public void setZbr_name(String name) {
		this.zbr_name = name;
	}
	

	public String getSub_ms() {
		return this.sub_ms;
	}

	public void setSub_ms(String sub_ms) {
		this.sub_ms = sub_ms;
	}


	public Date getBegin_date() {
		return this.begin_date;
	}

	public void setBegin_date(Date begin_date) {
		this.begin_date = begin_date;
	}


	public Date getEnd_date() {
		return this.end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}


	public String getCreate_name() {
		return this.create_name;
	}

	public void setCreate_name(String create_name) {
		this.create_name = create_name;
	}

	public String getCreate_name_name() {
		return this.create_name_name;
	}

	public void setCreate_name_name(String name) {
		this.create_name_name = name;
	}
	

	public Date getCreate_time() {
		return this.create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}


	public String getUpdate_name() {
		return this.update_name;
	}

	public void setUpdate_name(String update_name) {
		this.update_name = update_name;
	}

	public String getUpdate_name_name() {
		return this.update_name_name;
	}

	public void setUpdate_name_name(String name) {
		this.update_name_name = name;
	}
	

	public Date getUpdate_time() {
		return this.update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
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
        return "ygdemo_yw_sub";
    }

    @Override
    public String getNamespace() {
        return "iuaptraincrm";
    }
}