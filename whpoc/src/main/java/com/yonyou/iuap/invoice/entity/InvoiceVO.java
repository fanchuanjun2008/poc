package com.yonyou.iuap.invoice.entity;

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
@Entity(namespace = "whpoc",name = "Invoice")
@Table(name = "whpoc_Invoice")
public class InvoiceVO extends BaseEntity{
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "ts_id")
	private String tsid;

	@Column(name = "company_code")
	private String companycode;

	private String companycode_name;  //参照需要显示的名字
	
	@Column(name = "invoice_type")
	private String invoicetype;

	private String invoicetype_name;  //参照需要显示的名字
	
	@Column(name = "total")
	private Double total;

	@Column(name = "amount")
	private String amount;

	@OneToMany(targetEntity = Invoice_order.class)
	private List<Invoice_order> id_invoice_order;

	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;


	public String getTsid() {
		return this.tsid;
	}

	public void setTsid(String tsid) {
		this.tsid = tsid;
	}


	public String getCompanycode() {
		return this.companycode;
	}

	public void setCompanycode(String companycode) {
		this.companycode = companycode;
	}

	public String getCompanycode_name() {
		return this.companycode_name;
	}

	public void setCompanycode_name(String name) {
		this.companycode_name = name;
	}
	

	public String getInvoicetype() {
		return this.invoicetype;
	}

	public void setInvoicetype(String invoicetype) {
		this.invoicetype = invoicetype;
	}

	public String getInvoicetype_name() {
		return this.invoicetype_name;
	}

	public void setInvoicetype_name(String name) {
		this.invoicetype_name = name;
	}
	

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}


	public String getAmount() {
		return this.amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}


	public List<Invoice_order> getId_invoice_order() {
		return this.id_invoice_order;
	}

	public void setId_invoice_order(List<Invoice_order> id_invoice_order) {
		this.id_invoice_order = id_invoice_order;
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
        return "Invoice";
    }

    @Override
    public String getNamespace() {
        return "whpoc";
    }
}