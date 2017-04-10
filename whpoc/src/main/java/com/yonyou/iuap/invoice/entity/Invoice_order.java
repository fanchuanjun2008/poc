package com.yonyou.iuap.invoice.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.FK;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;
import com.yonyou.iuap.persistence.vo.BaseEntity;

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
@Entity(namespace = "whpoc",name = "invoice_order")
@Table(name = "whpoc_invoice_order")
public class Invoice_order extends BaseEntity{
	 
    @FK(name = "fk_id_invoice_order", referenceTableName = "whpoc_Invoice", referencedColumnName = "ts_id") 
    @Column(name = "fk_id_invoice_order")
    private java.lang.String fk_id_invoice_order;
    
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "invoice_order_id")
	private String invoiceorderid;
	
	@Column(name = "order_number")
	private String ordernumber;
	
	@Column(name = "no_invoice")
	private Double noinvoice;
	
	@Column(name = "tax")
	private Double tax;
	
	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.util.Date ts ;
	

	/**
	 * 属性 fk的Getter方法.属性名：parentPK
	 *  创建日期:2016-11-17
	 * @return java.lang.String
	 */
	public java.lang.String getFk_id_invoice_order() {
		return fk_id_invoice_order;
	}
	   
	/**
	 * 属性fk的Setter方法.属性名：parentPK
	 * 创建日期:2016-11-17
	 * @param newFk java.lang.String
	 */
	public void setFk_id_invoice_order (java.lang.String fk_id_invoice_order ) {
	 	this.fk_id_invoice_order = fk_id_invoice_order;
	} 	 
	

	public String getInvoiceorderid() {
		return this.invoiceorderid;
	}

	public void setInvoiceorderid(String invoiceorderid) {
		this.invoiceorderid = invoiceorderid;
	}


	public String getOrdernumber() {
		return this.ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}


	public Double getNoinvoice() {
		return this.noinvoice;
	}

	public void setNoinvoice(Double noinvoice) {
		this.noinvoice = noinvoice;
	}


	public Double getTax() {
		return this.tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
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
        return "invoice_order";
    }

    @Override
    public String getNamespace() {
        return "whpoc";
    }
}