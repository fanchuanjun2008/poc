package com.yonyou.iuap.crm.psn.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;


/**
 * The persistent class for the bter_bd_psndoc database table.
 * 
 */
@Entity(namespace = "iuaptraincrm",name = "psndoc")
@Table(name="bd_psndoc")
public class BdPsndocVO extends com.yonyou.iuap.persistence.vo.BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="pk_psndoc")
	@GeneratedValue(strategy = Stragegy.UAPOID, moudle = "pk_psndoc")
	private String pk_psndoc;
	
	@Column(name="pk_corp")
	private String pk_corp;

	@Column(name="pk_dept")
	private String pk_dept;

	@Column(name="psncode")		
	private String psncode;

	@Column(name="psnid")			
	private String psnid;

	@Column(name="psnname")		
	private String psnname;

	@Column(name="psnseal")		
	private int psnseal;
	
	@Column(name="email")
	private String email;
	
	@Column(name="psntel")
	private String psntel;
	
	@Column(name="number")
	private String number;
	
	@Column(name="creationtime")
	private Date creationtime;

	@Column(name="creator")
	private String creator;
	
	@Column(name="modifiedtime")
	private Date modifiedtime;
	
	@Column(name="modifier")
	private String modifier;
	
	@Column(name="ts")			
	private Timestamp ts;
	
	@Column(name="dr")		
	private int dr;

	@Column(name="def1")
	private String def1;

	@Column(name="def2")			
	private String def2;
	
	@Column(name="def3")		
	private String def3;
	
	@Column(name="def4")		
	private String def4;
	
	@Column(name="def5")		
	private String def5;
	
	@Column(name="def6")		
	private String def6;
	
	@Column(name="def7")			
	private String def7;
	
	@Column(name="def8")		
	private String def8;
	
	@Column(name="def9")		
	private String def9;
	
	@Column(name="def10")
	private String def10;

	@Column(name="def11")	
	private String def11;

	@Column(name="def12")		
	private String def12;

	@Column(name="def13")		
	private String def13;

	@Column(name="def14")		
	private String def14;

	@Column(name="def15")		
	private String def15;
	
	private List<BdPsnDutyVO> bdPsndutys;

	public List<BdPsnDutyVO> getBdPsndutys() {
		return bdPsndutys;
	}

	public void setBdPsndutys(List<BdPsnDutyVO> bterPsndutys) {
		this.bdPsndutys = bterPsndutys;
	}

	public BdPsndocVO() {
	}
	
	@Override
	public String getMetaDefinedName() {
		return "BdPsndocVO";
	}

	@Override
	public String getNamespace() {
		return "com.yonyou.iuap.crm.psn.entity";
	}

	public String getPk_psndoc() {
		return this.pk_psndoc;
	}

	public void setPk_psndoc(String pkPsndoc) {
		this.pk_psndoc = pkPsndoc;
	}

	public Date getCreationtime() {
		return this.creationtime;
	}

	public void setCreationtime(Date creationtime) {
		this.creationtime = creationtime;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getDef1() {
		return this.def1;
	}

	public void setDef1(String def1) {
		this.def1 = def1;
	}

	public String getDef10() {
		return this.def10;
	}

	public void setDef10(String def10) {
		this.def10 = def10;
	}

	public String getDef11() {
		return this.def11;
	}

	public void setDef11(String def11) {
		this.def11 = def11;
	}

	public String getDef12() {
		return this.def12;
	}

	public void setDef12(String def12) {
		this.def12 = def12;
	}

	public String getDef13() {
		return this.def13;
	}

	public void setDef13(String def13) {
		this.def13 = def13;
	}

	public String getDef14() {
		return this.def14;
	}

	public void setDef14(String def14) {
		this.def14 = def14;
	}

	public String getDef15() {
		return this.def15;
	}

	public void setDef15(String def15) {
		this.def15 = def15;
	}

	public String getDef2() {
		return this.def2;
	}

	public void setDef2(String def2) {
		this.def2 = def2;
	}

	public String getDef3() {
		return this.def3;
	}

	public void setDef3(String def3) {
		this.def3 = def3;
	}

	public String getDef4() {
		return this.def4;
	}

	public void setDef4(String def4) {
		this.def4 = def4;
	}

	public String getDef5() {
		return this.def5;
	}

	public void setDef5(String def5) {
		this.def5 = def5;
	}

	public String getDef6() {
		return this.def6;
	}

	public void setDef6(String def6) {
		this.def6 = def6;
	}

	public String getDef7() {
		return this.def7;
	}

	public void setDef7(String def7) {
		this.def7 = def7;
	}

	public String getDef8() {
		return this.def8;
	}

	public void setDef8(String def8) {
		this.def8 = def8;
	}

	public String getDef9() {
		
	if(getPsnseal()==1){
			return "封存";
		}else{
		return "正常";

		}
	}

	public void setDef9(String def9) {
		this.def9 = def9;
	}

	public int getDr() {
		return this.dr;
	}

	public void setDr(int dr) {
		this.dr = dr;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getModifier() {
		return this.modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getPk_corp() {
		return this.pk_corp;
	}

	public void setPk_corp(String pkCorp) {
		this.pk_corp = pkCorp;
	}

	public String getPk_dept() {
		return this.pk_dept;
	}

	public void setPk_dept(String pkDept) {
		this.pk_dept = pkDept;
	}

	public String getPsncode() {
		return this.psncode;
	}

	public void setPsncode(String psncode) {
		this.psncode = psncode;
	}

	public String getPsnid() {
		return this.psnid;
	}

	public void setPsnid(String psnid) {
		this.psnid = psnid;
	}

	public String getPsnname() {
		return this.psnname;
	}

	public void setPsnname(String psnname) {
		this.psnname = psnname;
	}

	public int getPsnseal() {
		return this.psnseal;
	}

	public void setPsnseal(int psnseal) {
		this.psnseal = psnseal;
	}
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Timestamp getTs() {
		return this.ts;
	}

	public void setTs(Timestamp ts) {
		this.ts = ts;
	}
	public String getPsntel() {
		return this.psntel;
	}

	public void setPsntel(String psntel) {
		this.psntel = psntel;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	

}