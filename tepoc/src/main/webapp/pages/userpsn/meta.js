var metaDt = {
    meta: {
        pk_user: {

        },
        username: {
        	required:true
        },
        sex: {
        	required:true
        },
        idcard: {
        	required:true
        },
        brithdate: {
        	required:true
        },
        email: {

        },
        telphone: {

        },
        edution: {

        },
        major: {

        },
        work_date: {

        },
        pk_corp: {

        },
        pk_corp_name: {

        },
        pk_dept: {

        },
        pk_dept_name: {

        },
        photo: {

        },
        defitem1: {

        },
        defitem2: {

        },
        defitem3: {

        },
        defitem4: {

        },
        defitem5: {

        },
        id_userrole: {

        },
    }
};
var metaUserRole = {
    meta: {
        fk_id_userrole: {

        },
        pk_user_role: {

        },
        pk_role: {

        },
        pk_role_name: {

        },
        rolecode: {

        },
        rolename: {

        },
        roletype: {

        },
        status: {
        	
        }
    }
};

var metaUserDept = {
    meta: {
        fk_id_userdept: {

        },
        pk_user_dept: {

        },
        pk_dept: {

        },
        pk_dept_name: {

        },
        deptcode: {

        },
        deptname: {

        },
        status: {
        	
        }
    }
};

var metaSearch = {
    meta: {
        search_name: {}, //国补单号
        search_sex: {}, //企业申报文号
        search_entryTime: {}, //申报城市
        search_vvin: {}, //车辆识别代码
        search_birthdate_start: {}, //申报日期开始日期
        search_birthdate_end: {}, //申报日期结束日期
        search_vvehicleseries: {}, //车系
        search_vrundept: {}, //车辆运营单位
        search_doverduedate_start: {}, //超期回款日期
        search_doverduedate_end: {}, //超期回款日期
        search_vstatus: {} //国补申报状态
    }
};
var metaUserFile ={
		meta: {
			id:{},
			url: {}, //图片url
			filename: {} //图片
	    }
};
//end userjob meta
