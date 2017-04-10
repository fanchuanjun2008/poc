package com.yonyou.iuap.crm.yg.ywsub.entity;

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
@Entity(namespace = "iuaptraincrm",name = "ygdemo_yw_info")
@Table(name = "iuaptraincrm_ygdemo_yw_info")
public class Ygdemo_yw_info extends BaseEntity{
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "id")
	private String id;

	@Column(name = "code")
	private String code;

	@Column(name = "name")
	private String name;

	@Column(name = "ly_code")
	private String ly_code;

	@Column(name = "ly_sm")
	private String ly_sm;

	@Column(name = "zr_dw")
	private String zr_dw;

	private String zr_dw_name;  //参照需要显示的名字
	
	@Column(name = "zrr")
	private String zrr;

	private String zrr_name;  //参照需要显示的名字
	
	@Column(name = "xb_dw")
	private String xb_dw;

	private String xb_dw_name;  //参照需要显示的名字
	
	@Column(name = "xbr")
	private String xbr;

	private String xbr_name;  //参照需要显示的名字
	
	@Column(name = "begin_date")
	private Date begin_date;

	@Column(name = "end_date")
	private Date end_date;

	@Column(name = "zy_cd")
	private Integer zy_cd;

	@Column(name = "qt_ld")
	private String qt_ld;

	private String qt_ld_name;  //参照需要显示的名字
	
	@Column(name = "zbr")
	private String zbr;

	private String zbr_name;  //参照需要显示的名字
	
	@Column(name = "dbr")
	private String dbr;

	private String dbr_name;  //参照需要显示的名字
	
	@Column(name = "jfyq")
	private String jfyq;

	@Column(name = "db_info")
	private String db_info;

	@Column(name = "jd_bl")
	private Double jd_bl;

	@Column(name = "rwpf")
	private Double rwpf;

	@Column(name = "kpi_flag")
	private Integer kpi_flag;

	@Column(name = "kpi_level")
	private Integer kpi_level;

	@Column(name = "state")
	private Integer state;

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

	@Column(name = "unitid")
	private String unitid;

	private String unitid_name;  //参照需要显示的名字
	
	@OneToMany(targetEntity = Ygdemo_yw_sub.class)
	private List<Ygdemo_yw_sub> id_ygdemo_yw_sub;

	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;


	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}


	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getLy_code() {
		return this.ly_code;
	}

	public void setLy_code(String ly_code) {
		this.ly_code = ly_code;
	}


	public String getLy_sm() {
		return this.ly_sm;
	}

	public void setLy_sm(String ly_sm) {
		this.ly_sm = ly_sm;
	}


	public String getZr_dw() {
		return this.zr_dw;
	}

	public void setZr_dw(String zr_dw) {
		this.zr_dw = zr_dw;
	}

	public String getZr_dw_name() {
		return this.zr_dw_name;
	}

	public void setZr_dw_name(String name) {
		this.zr_dw_name = name;
	}
	

	public String getZrr() {
		return this.zrr;
	}

	public void setZrr(String zrr) {
		this.zrr = zrr;
	}

	public String getZrr_name() {
		return this.zrr_name;
	}

	public void setZrr_name(String name) {
		this.zrr_name = name;
	}
	

	public String getXb_dw() {
		return this.xb_dw;
	}

	public void setXb_dw(String xb_dw) {
		this.xb_dw = xb_dw;
	}

	public String getXb_dw_name() {
		return this.xb_dw_name;
	}

	public void setXb_dw_name(String name) {
		this.xb_dw_name = name;
	}
	

	public String getXbr() {
		return this.xbr;
	}

	public void setXbr(String xbr) {
		this.xbr = xbr;
	}

	public String getXbr_name() {
		return this.xbr_name;
	}

	public void setXbr_name(String name) {
		this.xbr_name = name;
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


	public Integer getZy_cd() {
		return this.zy_cd;
	}

	public void setZy_cd(Integer zy_cd) {
		this.zy_cd = zy_cd;
	}


	public String getQt_ld() {
		return this.qt_ld;
	}

	public void setQt_ld(String qt_ld) {
		this.qt_ld = qt_ld;
	}

	public String getQt_ld_name() {
		return this.qt_ld_name;
	}

	public void setQt_ld_name(String name) {
		this.qt_ld_name = name;
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
	

	public String getDbr() {
		return this.dbr;
	}

	public void setDbr(String dbr) {
		this.dbr = dbr;
	}

	public String getDbr_name() {
		return this.dbr_name;
	}

	public void setDbr_name(String name) {
		this.dbr_name = name;
	}
	

	public String getJfyq() {
		return this.jfyq;
	}

	public void setJfyq(String jfyq) {
		this.jfyq = jfyq;
	}


	public String getDb_info() {
		return this.db_info;
	}

	public void setDb_info(String db_info) {
		this.db_info = db_info;
	}


	public Double getJd_bl() {
		return this.jd_bl;
	}

	public void setJd_bl(Double jd_bl) {
		this.jd_bl = jd_bl;
	}


	public Double getRwpf() {
		return this.rwpf;
	}

	public void setRwpf(Double rwpf) {
		this.rwpf = rwpf;
	}


	public Integer getKpi_flag() {
		return this.kpi_flag;
	}

	public void setKpi_flag(Integer kpi_flag) {
		this.kpi_flag = kpi_flag;
	}


	public Integer getKpi_level() {
		return this.kpi_level;
	}

	public void setKpi_level(Integer kpi_level) {
		this.kpi_level = kpi_level;
	}


	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
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


	public String getUnitid() {
		return this.unitid;
	}

	public void setUnitid(String unitid) {
		this.unitid = unitid;
	}

	public String getUnitid_name() {
		return this.unitid_name;
	}

	public void setUnitid_name(String name) {
		this.unitid_name = name;
	}
	

	public List<Ygdemo_yw_sub> getId_ygdemo_yw_sub() {
		return this.id_ygdemo_yw_sub;
	}

	public void setId_ygdemo_yw_sub(List<Ygdemo_yw_sub> id_ygdemo_yw_sub) {
		this.id_ygdemo_yw_sub = id_ygdemo_yw_sub;
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
        return "ygdemo_yw_info";
    }

    @Override
    public String getNamespace() {
        return "iuaptraincrm";
    }
}