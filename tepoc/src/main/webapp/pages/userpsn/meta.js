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
		meta : {
			search_username : {}, // 姓名
			search_sex : {}, // 性别
			search_major : {}, // 专业
			search_work_date : {}// 入职时间
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
