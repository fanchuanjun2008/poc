CREATE TABLE bd_countryzone (pk_timezone CHARACTER VARYING(20), wholename CHARACTER VARYING(200), modifier CHARACTER VARYING(50), creationtime TIMESTAMP(6) WITHOUT TIME ZONE, creator CHARACTER VARYING(50), modifiedtime TIMESTAMP(6) WITHOUT TIME ZONE, name CHARACTER VARYING(200), description CHARACTER VARYING(100), pk_country CHARACTER(36) NOT NULL, code CHARACTER VARYING(40), phonecode CHARACTER VARYING(20), pk_lang CHARACTER VARYING(50), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_countryzone PRIMARY KEY (pk_country));
CREATE TABLE cardtable (name CHARACTER VARYING(100) NOT NULL, code CHARACTER VARYING(50) NOT NULL, pk_system CHARACTER VARYING(50) NOT NULL, i18n CHARACTER VARYING(50), gateway CHARACTER VARYING(100), radiodatacontroller CHARACTER VARYING(50), radiodataassociate CHARACTER VARYING(50), combodatamodel CHARACTER VARYING(50), tag CHARACTER VARYING(50), system CHARACTER VARYING(50), tenant CHARACTER VARYING(50), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr NUMERIC, secretkey CHARACTER VARYING(50), createtime TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(), PRIMARY KEY (pk_system));
CREATE TABLE cardtablemeta (radiodataassociate CHARACTER VARYING(50), gateway CHARACTER VARYING(50), tag CHARACTER VARYING(50), combodatamodel CHARACTER VARYING(50), code CHARACTER VARYING(50), name CHARACTER VARYING(100), pk_system CHARACTER(36) NOT NULL, createtime TIMESTAMP(6) WITHOUT TIME ZONE, radiodatacontroller CHARACTER VARYING(50), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_cardtablemeta PRIMARY KEY (pk_system));
CREATE TABLE dept (pk_dept CHARACTER(36) NOT NULL, dept_code CHARACTER VARYING(40) NOT NULL, dept_name CHARACTER VARYING(50), createdate TIMESTAMP(6) WITHOUT TIME ZONE, org_id CHARACTER VARYING(50) NOT NULL, dept_type CHARACTER VARYING(20), creationtime TIMESTAMP(6) WITHOUT TIME ZONE, parent_id CHARACTER VARYING(36), short_name CHARACTER VARYING(50), deptcanceldate TIMESTAMP(6) WITHOUT TIME ZONE, creator CHARACTER VARYING(20), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_dept PRIMARY KEY (pk_dept));
CREATE TABLE instit (creationtime TIMESTAMP(6) WITHOUT TIME ZONE, instit_name CHARACTER VARYING(200) NOT NULL, short_name CHARACTER VARYING(50), instit_type CHARACTER VARYING(10), institid CHARACTER(36) NOT NULL, creator CHARACTER VARYING(20), parent_id CHARACTER VARYING(36), instit_code CHARACTER VARYING(200) NOT NULL, email CHARACTER VARYING(50), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_instit PRIMARY KEY (institid));

CREATE TABLE org (org_name CHARACTER VARYING(200) NOT NULL, email CHARACTER VARYING(50), creator CHARACTER VARYING(20), org_type CHARACTER VARYING(10), org_code CHARACTER VARYING(200) NOT NULL, org_id CHARACTER(36) NOT NULL, creationtime TIMESTAMP(6) WITHOUT TIME ZONE, parent_id CHARACTER VARYING(36), short_name CHARACTER VARYING(50), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_org PRIMARY KEY (org_id));
CREATE TABLE post (dept_id CHARACTER VARYING(50) NOT NULL, pk_post CHARACTER(36) NOT NULL, post_name CHARACTER VARYING(50), creator CHARACTER VARYING(20), parentid CHARACTER VARYING(36), post_code CHARACTER VARYING(40), short_name CHARACTER VARYING(200), creationtime TIMESTAMP(6) WITHOUT TIME ZONE, org_id CHARACTER VARYING(50) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, PRIMARY KEY (pk_post));
CREATE TABLE pub_multilang (charsetname CHARACTER VARYING(50), dislpayname CHARACTER(75), dr NUMERIC(10,0) DEFAULT 0, langcode CHARACTER VARYING(50), langdirpath CHARACTER VARYING(50), langseq NUMERIC(10,0), localcountry CHARACTER VARYING(50), locallang CHARACTER VARYING(50), pk_multilang CHARACTER VARYING(50) NOT NULL, transclassname CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), CONSTRAINT pk_pub_multilang PRIMARY KEY (pk_multilang));
CREATE TABLE sys_dict_type (dict_id CHARACTER VARYING NOT NULL, dict_type_code CHARACTER VARYING(100) NOT NULL, dict_type_name CHARACTER VARYING(100) NOT NULL, is_fixed CHARACTER(1) DEFAULT 'N'::bpchar NOT NULL, remark CHARACTER VARYING(512), creator_id CHARACTER VARYING(40) NOT NULL, creator CHARACTER VARYING(20) NOT NULL, create_time DATE NOT NULL, modifier_id CHARACTER VARYING(40), modifier CHARACTER VARYING(20), modify_time TIMESTAMP(6) WITHOUT TIME ZONE, dr CHARACTER(1) DEFAULT '0'::bpchar NOT NULL, PRIMARY KEY (dict_id));
CREATE TABLE sys_dict_type_meta (dict_type_name CHARACTER VARYING(100), is_fixed CHARACTER VARYING(50), remark CHARACTER VARYING(512), create_time TIMESTAMP(6) WITHOUT TIME ZONE, creator CHARACTER VARYING(20), modifier CHARACTER VARYING(20), dict_id CHARACTER(36) NOT NULL, modifier_id CHARACTER VARYING(40), modify_time TIMESTAMP(6) WITHOUT TIME ZONE, dict_type_code CHARACTER VARYING(100), creator_id CHARACTER VARYING(40), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_sysdicttypemeta PRIMARY KEY (dict_id));
CREATE TABLE sys_prompt (moudle CHARACTER VARYING(32) NOT NULL, error_code CHARACTER VARYING(32) NOT NULL, error_version CHARACTER VARYING(32) NOT NULL, error_desc CHARACTER VARYING(32) DEFAULT NULL::character varying, error_cause CHARACTER VARYING(255) DEFAULT NULL::character varying, error_solution CHARACTER VARYING(255) DEFAULT NULL::character varying, locale CHARACTER VARYING(32) DEFAULT NULL::character varying, PRIMARY KEY (moudle, error_code, error_version));
CREATE TABLE sys_user (register_date TIMESTAMP(6) WITHOUT TIME ZONE, level_name CHARACTER VARYING(16), user_name CHARACTER VARYING(20), status_name CHARACTER VARYING(16), modifier CHARACTER VARYING(20), user_mobile CHARACTER VARYING(16), org_id CHARACTER(36) NOT NULL, image_url CHARACTER VARYING(64), sex_id CHARACTER VARYING(50), platform_name CHARACTER VARYING(16), birthdate TIMESTAMP(6) WITHOUT TIME ZONE, create_time TIMESTAMP(6) WITHOUT TIME ZONE, org_name CHARACTER VARYING(64), creator CHARACTER VARYING(20), certificate_name CHARACTER VARYING(16), remark CHARACTER VARYING(512), level_id CHARACTER VARYING(1), modifier_id CHARACTER VARYING(40), id CHARACTER(36) NOT NULL, user_code CHARACTER VARYING(32), status_id CHARACTER VARYING(1), certificate_code CHARACTER VARYING(32), login_name CHARACTER VARYING(64), user_email CHARACTER VARYING(64), modify_time TIMESTAMP(6) WITHOUT TIME ZONE, certificate_id CHARACTER VARYING(1), user_password CHARACTER VARYING(64), platform_id CHARACTER VARYING(1), creator_id CHARACTER VARYING(40), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_sysuser PRIMARY KEY (id));
CREATE TABLE sys_user_job (create_time TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL, modifier_id CHARACTER VARYING(40), user_job_note CHARACTER VARYING(256), org_id CHARACTER(36) NOT NULL, fk_id_sys_user_job CHARACTER(36), modify_time TIMESTAMP(6) WITHOUT TIME ZONE, is_active CHARACTER VARYING(50), creator CHARACTER VARYING(20) NOT NULL, user_name CHARACTER VARYING(24) NOT NULL, user_id CHARACTER VARYING(40) NOT NULL, creator_id CHARACTER VARYING(40) NOT NULL, dept_id CHARACTER(36) NOT NULL, modifier CHARACTER VARYING(20), id CHARACTER(36) NOT NULL, is_default CHARACTER VARYING(50) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_sysuserjob PRIMARY KEY (id));
CREATE TABLE telbook (tel CHARACTER VARYING(100), institid CHARACTER(36), sex CHARACTER VARYING(50), office CHARACTER VARYING(100), worktel CHARACTER VARYING(100), peocode CHARACTER VARYING(100) NOT NULL, id CHARACTER(36) NOT NULL, peoname CHARACTER VARYING(50) NOT NULL, countryzone CHARACTER VARYING(36), email CHARACTER VARYING(100), ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_telbook PRIMARY KEY (id));


CREATE TABLE ext_bd_countryzone (ext_pk_country CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_bd_countryzone PRIMARY KEY (ext_pk_country));
CREATE TABLE ext_cardtablemeta (ext_pk_system CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_cardtablemeta PRIMARY KEY (ext_pk_system));
CREATE TABLE ext_dept (ext_pk_dept CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_dept PRIMARY KEY (ext_pk_dept));
CREATE TABLE ext_instit (ext_institid CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_instit PRIMARY KEY (ext_institid));
CREATE TABLE ext_org (ext_org_id CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_org PRIMARY KEY (ext_org_id));
CREATE TABLE ext_post (ext_pk_post CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, PRIMARY KEY (ext_pk_post));
CREATE TABLE ext_sys_dict_type_meta (ext_dict_id CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_sys_dict_type_meta PRIMARY KEY (ext_dict_id));
CREATE TABLE ext_sys_user (ext_id CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_sys_user PRIMARY KEY (ext_id));
CREATE TABLE ext_sys_user_job (ext_id CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_sys_user_job PRIMARY KEY (ext_id));
CREATE TABLE ext_telbook (ext_id CHARACTER(36) NOT NULL, ts TIMESTAMP(6) WITHOUT TIME ZONE, dr SMALLINT DEFAULT 0, CONSTRAINT pk_ext_telbook PRIMARY KEY (ext_id));
CREATE TABLE md_accessorpara (id CHARACTER VARYING(256) NOT NULL, assosequence SMALLINT NOT NULL, paravalue CHARACTER VARYING(512), versiontype SMALLINT, industry CHARACTER VARYING(50), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_accessorpara PRIMARY KEY (id, assosequence));
CREATE TABLE md_association (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, name CHARACTER VARYING(60) NOT NULL, componentid CHARACTER VARYING(50), startbeanid CHARACTER VARYING(50) NOT NULL, startelementid CHARACTER VARYING(50) NOT NULL, endelementid CHARACTER VARYING(50) NOT NULL, startcardinality CHARACTER VARYING(10), endcardinality CHARACTER VARYING(10), type SMALLINT, cascadeupdate CHARACTER(1), cascadedelete CHARACTER(1), isactive CHARACTER(1), creator CHARACTER VARYING(30), modifier CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), industry CHARACTER VARYING(50), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_association PRIMARY KEY (id));
CREATE TABLE md_bizitfmap (bizinterfaceid CHARACTER VARYING(50) NOT NULL, intattrid CHARACTER VARYING(50) NOT NULL, classid CHARACTER VARYING(50) NOT NULL, classattrid CHARACTER VARYING(50), bizitfimpclassname CHARACTER VARYING(256), classattrpath CHARACTER VARYING(512), versiontype SMALLINT, industry CHARACTER VARYING(50), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_bizitfmap PRIMARY KEY (intattrid, classid));
CREATE TABLE md_class (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, parentclassid CHARACTER VARYING(50), componentid CHARACTER VARYING(50), keyattribute CHARACTER VARYING(50), name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), fullclassname CHARACTER VARYING(256), classtype SMALLINT, accessorclassname CHARACTER VARYING(256), fixedlength CHARACTER(1), precise SMALLINT, refmodelname CHARACTER VARYING(768), returntype CHARACTER VARYING(50), isprimary CHARACTER(1), isactive CHARACTER(1), creator CHARACTER VARYING(30), modifier CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), isauthen CHARACTER(1), resid CHARACTER VARYING(90), bizitfimpclassname CHARACTER VARYING(256), modinfoclassname CHARACTER VARYING(256), iscreatesql CHARACTER(1), defaulttablename CHARACTER VARYING(50), isextendbean CHARACTER(1), userdefclassname CHARACTER VARYING(256), stereotype CHARACTER VARYING(256), industry CHARACTER VARYING(50) NOT NULL, tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_class PRIMARY KEY (id, versiontype, industry));
CREATE TABLE md_column (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, tableid CHARACTER VARYING(50), name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), isactive CHARACTER(1), sqldatetype CHARACTER VARYING(50), pkey CHARACTER(1), identitied CHARACTER(1), incrementstep SMALLINT, incrementseed SMALLINT, nullable CHARACTER(1), precise SMALLINT, columnlength SMALLINT, defaultvalue CHARACTER VARYING(512), columnsequence SMALLINT, modifytime CHARACTER(19), createtime CHARACTER(19), modifier CHARACTER VARYING(30), creator CHARACTER VARYING(30), resid CHARACTER VARYING(90), groupid CHARACTER VARYING(50), columntype SMALLINT, forlocale CHARACTER(1), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_column PRIMARY KEY (id));
CREATE TABLE md_comp_busimodule (componentid CHARACTER VARYING(50) NOT NULL, busimodulecode CHARACTER VARYING(50), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_c_b_mod PRIMARY KEY (componentid));
CREATE TABLE md_component (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, namespace CHARACTER VARYING(512), ownmodule CHARACTER VARYING(50), name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), creator CHARACTER VARYING(30), modifier CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), version CHARACTER VARYING(512), resmodule CHARACTER VARYING(90), resid CHARACTER VARYING(90), preload CHARACTER(1), isbizmodel CHARACTER(1), fromsourcebmf CHARACTER(1), industry CHARACTER VARYING(50) NOT NULL, tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_component PRIMARY KEY (id, versiontype, industry));
CREATE TABLE md_db (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), isactive CHARACTER(1) NOT NULL, modifytime CHARACTER(19), createtime CHARACTER(19), modifier CHARACTER VARYING(30), creator CHARACTER VARYING(30), resid CHARACTER VARYING(90), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_db PRIMARY KEY (id, versiontype));
CREATE TABLE md_db_relation (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, name CHARACTER VARYING(90) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), starttableid CHARACTER VARYING(50) NOT NULL, startfieldid CHARACTER VARYING(50) NOT NULL, startattrid CHARACTER VARYING(50), startcardinality CHARACTER VARYING(10), endtableid CHARACTER VARYING(50) NOT NULL, endfieldid CHARACTER VARYING(50) NOT NULL, endcardinality CHARACTER VARYING(10), asstype SMALLINT, creator CHARACTER VARYING(30), createtime CHARACTER(19), modifier CHARACTER VARYING(30), modifytime CHARACTER(19), resid CHARACTER VARYING(90), isforeignkey CHARACTER(1), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_db_relation PRIMARY KEY (id, versiontype));
CREATE TABLE md_enumvalue (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, value CHARACTER VARYING(512) NOT NULL, name CHARACTER VARYING(512), description CHARACTER VARYING(512), resid CHARACTER VARYING(90), enumsequence SMALLINT, hidden CHARACTER(1), industry CHARACTER VARYING(50) NOT NULL, tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_enumvalue PRIMARY KEY (id, versiontype, value, industry));
CREATE TABLE md_module (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), parentmoduleid CHARACTER VARYING(50), isactive CHARACTER(1), creator CHARACTER VARYING(30), modifier CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), resid CHARACTER VARYING(90), resmodule CHARACTER VARYING(90), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_module PRIMARY KEY (id, versiontype));
CREATE TABLE md_opinterface (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), parentid CHARACTER VARYING(50), componentid CHARACTER VARYING(50) NOT NULL, fullclassname CHARACTER VARYING(256), isservice CHARACTER(1), visibility SMALLINT, remote CHARACTER(1), singleton CHARACTER(1), creator CHARACTER VARYING(30), modifier CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), implstrategy CHARACTER VARYING(256), resid CHARACTER VARYING(90), authorizable CHARACTER(1), ownertype CHARACTER VARYING(50), defaultimplclassname CHARACTER VARYING(256), isbusioperation CHARACTER(1), isbusiactivity CHARACTER(1), industry CHARACTER VARYING(50) NOT NULL, tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_interface PRIMARY KEY (id, versiontype, industry));
CREATE TABLE md_ormap (classid CHARACTER VARYING(50) NOT NULL, attributeid CHARACTER VARYING(50) NOT NULL, tableid CHARACTER VARYING(50) NOT NULL, columnid CHARACTER VARYING(50) NOT NULL, tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_ormap PRIMARY KEY (attributeid));
CREATE TABLE md_parameter (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, operationid CHARACTER VARYING(50), name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), datatype CHARACTER VARYING(50) NOT NULL, datatypestyle SMALLINT NOT NULL, parasequence SMALLINT NOT NULL, modifier CHARACTER VARYING(30), creator CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), resid CHARACTER VARYING(90), paramdefclassname CHARACTER VARYING(50), isaggvo CHARACTER(1), paramtypeforlog CHARACTER VARYING(10), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_parameter PRIMARY KEY (id, versiontype));
CREATE TABLE md_property (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, name CHARACTER VARYING(50) NOT NULL, displayname CHARACTER VARYING(90), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), classid CHARACTER VARYING(50), defaultvalue CHARACTER VARYING(512), attrminvalue CHARACTER VARYING(50), attrmaxvalue CHARACTER VARYING(50), fixedlength CHARACTER(1), attrlength SMALLINT, precise SMALLINT, datatype CHARACTER VARYING(50), datatypestyle SMALLINT, nullable CHARACTER(1), customattr CHARACTER(1), calculation CHARACTER(1), readonly CHARACTER(1), visibility SMALLINT, accessorclassname CHARACTER VARYING(256), attrsequence SMALLINT, hided CHARACTER(1), refmodelname CHARACTER VARYING(256), isactive CHARACTER(1), creator CHARACTER VARYING(30), modifier CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), isauthen CHARACTER(1), resid CHARACTER VARYING(90), dynamicattr CHARACTER(1), notserialize CHARACTER(1), accesspower CHARACTER(1), accesspowergroup CHARACTER VARYING(256), industry CHARACTER VARYING(50) NOT NULL, createindustry CHARACTER VARYING(50), tenantid CHARACTER VARYING(50), dynamictable CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_property PRIMARY KEY (id, versiontype, industry));
CREATE TABLE md_sysmoduleconfig (tablename CHARACTER VARYING(50), codefield CHARACTER VARYING(50), namefield CHARACTER VARYING(50), resmodulefield CHARACTER VARYING(50), resmodulevalue CHARACTER VARYING(50), residfield CHARACTER VARYING(50), tenantid CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0);
CREATE TABLE md_table (id CHARACTER VARYING(50) NOT NULL, versiontype SMALLINT NOT NULL, displayname CHARACTER VARYING(90), name CHARACTER VARYING(50) NOT NULL, databaseid CHARACTER VARYING(50), description CHARACTER VARYING(512), help CHARACTER VARYING(1024), isactive CHARACTER(1), creator CHARACTER VARYING(30), modifier CHARACTER VARYING(30), createtime CHARACTER(19), modifytime CHARACTER(19), resid CHARACTER VARYING(90), parenttable CHARACTER VARYING(50), isextendtable CHARACTER(1), fromsourcebmf CHARACTER(1), industry CHARACTER VARYING(50), tenantid CHARACTER VARYING(50), resmodule CHARACTER VARYING(50), ts CHARACTER(19) DEFAULT to_char(now(), 'yyyy-mm-dd hh24:mi:ss'::text), dr NUMERIC(10,0) DEFAULT 0, CONSTRAINT pk_md_table PRIMARY KEY (id));

