define(['iReferComp', 'refComp', 'text!pages/userpsn/userpsn.html', 'pages/userpsn/meta', 'css!pages/userpsn/userpsn.css', 'uuitree', 'uuigrid', 'config/sys_const', 'ajaxfileupload', 'ossupload', 'interfaceFile', 'interfaceFileImpl'], function(iReferComp, refComp, template) {

    // 开始初始页面基础数据
    var init = function(element, params) {
        var viewModel = {
            draw: 1, // 页数(第几页)
            childdraw: 1, // 子表角色页号
            deptchilddraw: 1, // 子表部门页号
            filechilddraw: 1, // 子表图片页号
            pageSize: 5, // 主表分页
            childPageSize: 5, // 子表角色分页
            deptchildPageSize: 5, // 子表部门分页
            filechildPageSize: 5, // 子表图片分页
            searchURL: tepoc_ctx + '/UserPsn/list',
            addURL: tepoc_ctx + "/UserPsn/savecard", //新增和修改，后台统一处理，主表pk来判断：为空是新增，否则为修改；子表通过status来判断：默认是0不操作，1表示修改，2表示新增，3表示删除
            updateURL: tepoc_ctx + "/UserPsn/savecard",
            delURL: tepoc_ctx + "/UserPsn/delBatch",
            formStatus: _CONST.FORM_STATUS_ADD,
            fileindex: null,
            UserPsnDa: new u.DataTable(metaDt), // 主表显示
            UserPsnFormDa: new u.DataTable(metaDt), // 主表编辑
            UserRoleFormDa: new u.DataTable(metaUserRole), // 子表角色
            UserDeptFormDa: new u.DataTable(metaUserDept), // 子表部门
            UserFileFormDa: new u.DataTable(metaUserFile), // 子表图片 //
            // lyk备注：创建对应datatable
            searchData: new u.DataTable(metaSearch), // 查询用
            addRefDa: new u.DataTable({ // 子表新增用
                meta: {
                    'role': {},
                    'dept': {},
                    'deptedit': {}
                }
            }),

            comboData: [{
                name: '男',
                value: '0'
            }, {
                name: '女',
                value: '1'
            }],
            comboDataMajor: [{
                name: '软件工程',
                value: '01'
            }, {
                name: '生物工程',
                value: '02'
            }],
            comboDataEdution: [{
                name: '本科',
                value: '01'
            }, {
                name: '硕士',
                value: '02'
            }],

            event: {
                changeUserPsnsex: function(id) {
                    var v = id();
                    var comboData = viewModel.comboData;
                    for (var i = 0; i < comboData.length; i++) {
                        if (v == comboData[i].value) {
                            return comboData[i].name;
                        }

                    }
                },
                changeUseEdu: function(id) {
                    var v = id();
                    var comboDataEdution = viewModel.comboDataEdution;
                    for (var i = 0; i < comboDataEdution.length; i++) {
                        if (v == comboDataEdution[i].value) {
                            return comboDataEdution[i].name;
                        }

                    }
                },
                changeUseMajor: function(id) {
                    var v = id();
                    var comboDataMajor = viewModel.comboDataMajor;
                    for (var i = 0; i < comboDataMajor.length; i++) {
                        if (v == comboDataMajor[i].value) {
                            return comboDataMajor[i].name;
                        }
                    }
                },
                changeUserBri:function(date){
                	var v = date();
                	if(v){
                		return u.dateRender(new Date(v),'YYYY-MM-DD')
                	}else{
                		return ''
                	}	
                },
                ex_export: function() {
                    // var dats = [];
                    // var pks = ""
                    // var row = viewModel.gridVehicleData.getSelectedRows();
                    // if(row==null || row.length==0){
                    // u.messageDialog({msg:"请选择要导出的数据",title:"提示", btnText:"OK"});
                    // return
                    // }
                    // for(var i=0;i<row.length;i++){
                    // var pkItem = row[i].getValue("pk_countrysubsidy_items");
                    // dats.push(row[i].getSimpleData());
                    // if(pks.length==0){
                    // pks = pkItem;
                    // }else{
                    // pks = pks+","+pkItem;
                    // }
                    // }
                    var form = $("<form>"); // 定义一个form表单
                    form.attr('style', 'display:none'); // 在form表单中添加查询参数
                    form.attr('target', '');
                    form.attr('method', 'post');
                    form.attr('action', tepoc_ctx + "/UserPsn/excelExport");

                    var input1 = $('<input>');
                    input1.attr('type', 'hidden');
                    // input1.attr('name', 'pkVehicleIds');
                    // input1.attr('value', pks);
                    $('#user-mdlayout').append(form); // 将表单放置在web中
                    form.append(input1); // 将查询参数控件提交到表单上
                    form.submit();
                },
                /**
                 * 点击展开或隐藏查询列表
                 */
                showSearchClick: function() {
                    $('#showSearch').toggleClass('hide');
                },
                /**
                 * 执行查询
                 */
                search: function() {
                    viewModel.draw = 1;
                    viewModel.event.initUerList();
                },
                /**
                 * 清空
                 */
                cleanSearch: function() {
                    this.searchData.setSimpleData({});
                },

                /**
                 * 子表角色新建点击触发参照
                 */
                addUserRole: function() {
                    $('#rolerefadd').find('span').trigger("click.refer");
                },

                /**
                 * 子表部门新建点击触发参照
                 */
                addUserDept: function() {
                    $('#deptAddRef').find('span').trigger("click.refer");
                },

                /**
                 * 子表部门新建点击触发参照
                 */
                editUserDept: function() {
                    var userJobs = viewModel.UserDeptFormDa.getSimpleData({
                        type: 'select'
                    })
                    if (!userJobs || userJobs.length < 1) {
                        u.messageDialog({
                            msg: "请选择要编辑的行!",
                            title: "提示",
                            btnText: "OK"
                        });
                    } else {
                        $('#deptAddRef1').find('span').trigger("click.refer");
                    }
                },
                // 打开附件上传界面
                onOpenInfoUploadWin: function() {
                    if (viewModel.UserPsnFormDa.getValue("pk_user")) {
                        window.countrysubsid_md = u.dialog({
                            id: 'countrysubsid_testDialg4',
                            content: "#countrysubsid_dialog_uploadfileinfo",
                            hasCloseMenu: true
                        });
                        $('.sub-list2-new').css('display', 'inline-block');
                    } else {
                        u.messageDialog({
                            msg: "请先创建用户!",
                            title: "提示",
                            btnText: "OK"
                        });
                    }

                },
                // 上传附件
                onInfoFileUpload: function() {
                    // 获取表单
                    var pk = viewModel.UserPsnFormDa.getValue("pk_user");
                    if (pk) {
                        var par = {
                            fileElementId: "infofile_id", // 【必填】文件上传空间的id属性
                            // <input
                            // type="file"
                            // id="id_file"
                            // name="file"
                            // />,可以修改，主要看你使用的
                            // id是什么
                            filepath: pk, // 【必填】单据相关的唯一标示，一般包含单据ID，如果有多个附件的时候由业务自己制定规则
                            groupname: "INFOCOUNTRYSUBSIDY", // 【必填】分組名称,未来会提供树节点
                            permission: "read", // 【选填】 read是可读=公有
                            // private=私有
                            // 当这个参数不传的时候会默认private
                            url: true, // 【选填】是否返回附件的连接地址，并且会存储到数据库
                            thumbnail: "100w", // 【选填】缩略图--可调节大小，和url参数配合使用，不会存储到数据库
                            cross_url: window.ctxfilemng // 【选填】跨iuap-saas-fileservice-base
                            // 时候必填
                        }
                        var f = new interface_file();
                        f.filesystem_upload(par, function(data) {
                            onCloseLoading();
                            if (null == data) {
                                u.messageDialog({
                                    msg: "上传图片不能超过1M，请优化后再上传！",
                                    title: "提示",
                                    btnText: "OK"
                                });
                            } else {
                                if (1 == data.status) { // 上传成功状态
                                    viewModel.UserPsnFormDa.addSimpleData(data.data);
                                    u.messageDialog({
                                        msg: "上传成功！",
                                        title: "提示",
                                        btnText: "OK"
                                    });
                                    $('#infouser_img').attr('src', imgsrc_tans(data.data[0].url));
                                } else { // error 或者加載js錯誤
                                    u.messageDialog({
                                        msg: "上传失败！" + data.message,
                                        title: "提示",
                                        btnText: "OK"
                                    });
                                }
                            }
                        });
                        onLoading();
                    } else {
                        u.messageDialog({
                            msg: "请先创建用户!",
                            title: "提示",
                            btnText: "OK"
                        });
                    }

                },

                infoFileQuery: function() {
                    var pk = viewModel.UserPsnFormDa.getValue("pk_user");
                    if (pk) {
                        var par = {
                            // 建议一定要有条件否则会返回所有值
                            filepath: pk, // 【选填】单据相关的唯一标示，一般包含单据ID，如果有多个附件的时候由业务自己制定规则
                            groupname: "INFOCOUNTRYSUBSIDY", // 【选填】[分組名称,未来会提供树节点]
                            cross_url: window.ctxfilemng // 【选填】跨iuap-saas-fileservice-base
                            // 时候必填
                        }
                        var f = new interface_file();
                        f.filesystem_query(par, function(data) {
                            if (1 == data.status) { // 上传成功状态
                                $('#infouser_img').attr('src', imgsrc_tans(data.data[0].url));
                            } else {
                                // 没有查询到数据，可以不用提醒
                                if ("没有查询到相关数据" != data.message) {
                                    u.messageDialog({
                                        msg: "查询失败" + data.message,
                                        title: "提示",
                                        btnText: "OK"
                                    });
                                } else {
                                    viewModel.UserFileFormDa.removeAllRows();
                                }
                            }
                        });
                    }

                },
                // 附件删除
                infoFileDelete: function() {
                    var row = viewModel.UserFileFormDa.getSelectedRows();
                    if (row == null || row.length == 0) {
                        u.messageDialog({
                            msg: "请选择要删除的附件",
                            title: "提示",
                            btnText: "OK"
                        });
                        return
                    } else if (row.length > 1) {
                        u.messageDialog({
                            msg: "每次只能删除一个附件",
                            title: "提示",
                            btnText: "OK"
                        });
                        return
                    }
                    for (var i = 0; i < row.length; i++) {
                        var pk = row[i].getValue("id");
                        var par = {
                            id: pk, // 【必填】表的id
                            cross_url: window.ctxfilemng // 【选填】跨iuap-saas-fileservice-base
                            // 时候必填
                        }
                        var f = new interface_file();
                        f.filesystem_delete(par, function(data) {
                            if (1 == data.status) { // 上传成功状态
                                viewModel.fileQuery();
                            } else {
                                u.messageDialog({
                                    msg: "删除失败" + data.message,
                                    title: "提示",
                                    btnText: "OK"
                                });
                            }
                        });
                    }
                },

                // 打开附件上传界面
                onOpenUploadWin: function(a, e) {
                    if (viewModel.UserPsnFormDa.getValue("pk_user")) {
                        var tar = e.target;
                        window.file_style = "add";
                        if ($(tar).closest('button').attr('name') == 'editfile') {
                        	var row = viewModel.fileindex;
                            if (row == null) {
                            	u.messageDialog({
                                    msg: "请先选择一张图片进行编辑!",
                                    title: "提示",
                                    btnText: "OK"
                                });
                            }
                            window.file_style = "edit";
                        }
                        window.countrysubsid_md = u.dialog({
                            id: 'countrysubsid_testDialg3',
                            content: "#countrysubsid_dialog_uploadfile",
                            hasCloseMenu: true
                        });
                        $('.sub-list1-new').css('display', 'inline-block');
                    } else {
                        u.messageDialog({
                            msg: "请先创建用户!",
                            title: "提示",
                            btnText: "OK"
                        });
                    }

                },

                // 上传附件
                onFileUpload: function() {
                    // 获取表单
                    var pk = viewModel.UserPsnFormDa.getValue("pk_user");
                    if (pk) {

                        var par = {
                            fileElementId: "countrysubsidybatch_id", // 【必填】文件上传空间的id属性
                            // <input
                            // type="file"
                            // id="id_file"
                            // name="file"
                            // />,可以修改，主要看你使用的
                            // id是什么
                            filepath: pk, // 【必填】单据相关的唯一标示，一般包含单据ID，如果有多个附件的时候由业务自己制定规则
                            groupname: "COUNTRYSUBSIDY", // 【必填】分組名称,未来会提供树节点
                            permission: "read", // 【选填】 read是可读=公有
                            // private=私有
                            // 当这个参数不传的时候会默认private
                            url: true, // 【选填】是否返回附件的连接地址，并且会存储到数据库
                            thumbnail: "100w", // 【选填】缩略图--可调节大小，和url参数配合使用，不会存储到数据库
                            cross_url: window.ctxfilemng // 【选填】跨iuap-saas-fileservice-base
                            // 时候必填
                        }
                        var f = new interface_file();
                        f.filesystem_upload(par, viewModel.event.fileUploadCallback);
                        onLoading();
                    } else {
                        u.messageDialog({
                            msg: "请先创建用户!",
                            title: "提示",
                            btnText: "OK"
                        });
                    }

                },
                // 上传文件回传信息
                fileUploadCallback: function(data) {
                    onCloseLoading();
                    if (null == data) {
                        u.messageDialog({
                            msg: "上传图片不能超过1M，请优化后再上传！",
                            title: "提示",
                            btnText: "OK"
                        });
                    } else {
                        if (1 == data.status) { // 上传成功状态
                            viewModel.UserPsnFormDa.addSimpleData(data.data);
                            u.messageDialog({
                                msg: "上传成功！",
                                title: "提示",
                                btnText: "OK"
                            });
                            viewModel.event.fileQuery();
                            if (window.file_style == "edit") {
                                var row = viewModel.fileindex;
                                if (row != null) {
                                    var pk = row;
                                    var par = {
                                        id: pk, // 【必填】表的id
                                        cross_url: window.ctxfilemng // 【选填】跨iuap-saas-fileservice-base
                                        // 时候必填
                                    }
                                    var f = new interface_file();
                                    f.filesystem_delete(par, viewModel.event.fileDeleteCallBack);
                                }

                            }
                        } else { // error 或者加載js錯誤
                            u.messageDialog({
                                msg: "上传失败！" + data.message,
                                title: "提示",
                                btnText: "OK"
                            });
                        }
                    }
                },
                fileQuery: function() {
                    var pk = viewModel.UserPsnFormDa.getValue("pk_user");
                    if (pk) {
                        var par = {
                            // 建议一定要有条件否则会返回所有值
                            filepath: pk, // 【选填】单据相关的唯一标示，一般包含单据ID，如果有多个附件的时候由业务自己制定规则
                            groupname: "COUNTRYSUBSIDY", // 【选填】[分組名称,未来会提供树节点]
                            cross_url: window.ctxfilemng // 【选填】跨iuap-saas-fileservice-base
                            // 时候必填
                        }
                        var f = new interface_file();
                        f.filesystem_query(par, viewModel.event.fileQueryCallBack);
                    }

                },
                fileQueryCallBack: function(data) {
                    if (1 == data.status) { // 上传成功状态
                        viewModel.UserFileFormDa.setSimpleData(data.data);
                    } else {
                        // 没有查询到数据，可以不用提醒
                        if ("没有查询到相关数据" != data.message) {
                            u.messageDialog({
                                msg: "查询失败" + data.message,
                                title: "提示",
                                btnText: "OK"
                            });
                        } else {
                            viewModel.UserFileFormDa.removeAllRows();
                        }
                    }
                },
                fileselect: function(a, e) {
                    var tar = e.target;
                    if (tar.type == 'radio') {
                        viewModel.fileindex = tar.value;
                        setTimeout(function() {
                            tar.checked = true;
                        })
                    }

                },
                // 附件删除
                fileDelete: function() {
                    var row = viewModel.fileindex;
                    if (row == null) {
                        u.messageDialog({
                            msg: "请选择要删除的图片",
                            title: "提示",
                            btnText: "OK"
                        });
                        return
                    }
                    u.confirmDialog({
                        msg: '<div class="pull-left col-padding" >' +
                            '<i class="fa fa-exclamation-circle margin-r-5 fa-3x orange" style="vertical-align:middle"></i>确认删除这些数据数据吗？</div>',
                        title: '警告',
                        onOk: function() {
                            var pk = row;
                            var par = {
                                id: pk, // 【必填】表的id
                                cross_url: window.ctxfilemng // 【选填】跨iuap-saas-fileservice-base
                                // 时候必填
                            }
                            var f = new interface_file();
                            f.filesystem_delete(par, viewModel.event.fileDeleteCallBack);
                        }
                    });

                },
                // 附件删除回调
                fileDeleteCallBack: function(data) {
                    if (1 == data.status) { // 上传成功状态
                        viewModel.event.fileQuery();
                    } else {
                        u.messageDialog({
                            msg: "删除失败" + data.message,
                            title: "提示",
                            btnText: "OK"
                        });
                    }
                },
                // 下载
                fileDownload: function() {
                    var row = viewModel.UserPsnFormDa.getSelectedRows();
                    if (row == null || row.length == 0) {
                        u.messageDialog({
                            msg: "请选择要下载的附件",
                            title: "提示",
                            btnText: "OK"
                        });
                        return
                    } else if (row.length > 1) {
                        u.messageDialog({
                            msg: "每次只能下载一个附件",
                            title: "提示",
                            btnText: "OK"
                        });
                        return
                    }
                    for (var i = 0; i < row.length; i++) {
                        var pk = row[i].getValue("id");
                        var form = $("<form>"); // 定义一个form表单
                        form.attr('style', 'display:none'); // 在form表单中添加查询参数
                        form.attr('target', '');
                        form.attr('enctype', 'multipart/form-data');
                        form.attr('method', 'post');
                        form.attr('action', window.ctxfilemng + "file/download?permission=read&id=" + pk);
                        $('#countrysubsidy-mdlayout').append(form); // 将表单放置在web中
                        form.submit();
                    }
                },
                // 查看
                fileView: function() {
                    var row = viewModel.UserPsnFormDa.getSelectedRows();
                    if (row == null || row.length == 0) {
                        u.messageDialog({
                            msg: "请选择要下载的附件",
                            title: "提示",
                            btnText: "OK"
                        });
                        return
                    } else if (row.length > 1) {
                        u.messageDialog({
                            msg: "每次只能查看一个附件",
                            title: "提示",
                            btnText: "OK"
                        });
                        return
                    }
                    for (var i = 0; i < row.length; i++) {
                        var url = row[i].getValue("url");
                        if (!url.startsWith("http://")) {
                            url = "http://" + url;
                        }
                        parent.open(url);
                    }
                },

                /**
                 * 主页查询方法（初始调用）
                 */
                initUerList: function() {
                    var jsonData = {
                        pageIndex: viewModel.draw - 1,
                        pageSize: viewModel.pageSize,
                        sortField: "ts",
                        sortDirection: "desc"
                    };

                    if (viewModel.searchData.getSimpleData()) {
                        if (viewModel.searchData.getSimpleData()[0].search_name)
                            jsonData["search_username"] = viewModel.searchData.getSimpleData()[0].search_name;
                        if (viewModel.searchData.getSimpleData()[0].search_sex)
                            jsonData["search_sex"] = viewModel.searchData.getSimpleData()[0].search_sex;
                        if (viewModel.searchData.getSimpleData()[0].search_profession)
                            jsonData["search_profession"] = viewModel.searchData.getSimpleData()[0].search_profession;
                        if (viewModel.searchData.getSimpleData()[0].search_entry_start)
                            jsonData["search_entry_start"] = viewModel.searchData.getSimpleData()[0].search_entry_start;

                    }



                    $.ajax({
                        type: 'get',
                        url: viewModel.searchURL,
                        datatype: 'json',
                        data: jsonData,
                        contentType: 'application/json;charset=utf-8',
                        success: function(res) {
                            if (res) {
                                if (res.success == 'success') {
                                    if (res.detailMsg.data) {
                                        var totleCount = res.detailMsg.data.totalElements;
                                        var totlePage = res.detailMsg.data.totalPages;
                                        viewModel.comps.update({
                                            totalPages: totlePage,
                                            pageSize: viewModel.pageSize,
                                            currentPage: viewModel.draw,
                                            totalCount: totleCount
                                        });
                                        viewModel.event.clearDa(viewModel.UserPsnDa);
                                        viewModel.UserPsnDa.setSimpleData(res.detailMsg.data.content, {
                                            unSelect: true
                                        });
                                    }
                                } else {
                                    var msg = "";
                                    for (var key in res.detailMsg) {
                                        msg += res.detailMsg[key] + "<br/>";
                                    }
                                    u.messageDialog({
                                        msg: msg,
                                        title: '请求错误',
                                        btnText: '确定'
                                    });
                                }
                            } else {
                                u.messageDialog({
                                    msg: '后台返回数据格式有误，请联系管理员',
                                    title: '数据错误',
                                    btnText: '确定'
                                });
                            }
                        }
                    });
                    // end ajax
                },

                /**
                 * 子表角色查询方法
                 */
                getUserJobList: function() {
                    var userId = viewModel.UserPsnFormDa.getValue("pk_user");
                    var jsonData = {
                        pageIndex: 0,
                        pageSize: viewModel.childPageSize,
                        sortField: "ts",
                        sortDirection: "asc"
                    };
                    jsonData['search_fk_id_userrole'] = userId;
                    $.ajax({
                        type: 'GET',
                        url: tepoc_ctx + '/UserRole/list',
                        datatype: 'json',
                        data: jsonData,
                        contentType: 'application/json;charset=utf-8',
                        success: function(res) {
                            if (res) {
                                if (res.success == 'success') {
                                    if (res.detailMsg.data) {
                                        viewModel.UserRoleFormDa.removeAllRows();
                                        viewModel.UserRoleFormDa.clear();
                                        viewModel.UserRoleFormDa.setSimpleData(res.detailMsg.data.content, {
                                            unSelect: true
                                        });
                                        var totleCount = res.detailMsg.data.totalElements;
                                        var totlePage = res.detailMsg.data.totalPages;
                                        viewModel.child_card_pcomp.update({ // 卡片页子表的分页信息
                                            totalPages: totlePage,
                                            pageSize: viewModel.childPageSize,
                                            currentPage: viewModel.childdraw,
                                            totalCount: totleCount
                                        });
                                        if (totleCount > viewModel.childPageSize) { // 根据总条数，来判断是否显示子表的分页层
                                            $('#child_card_pagination').show();
                                        } else {
                                            $('#child_card_pagination').hide();
                                        }

                                    }
                                } else {
                                    var msg = "";
                                    for (var key in res.message) {
                                        msg += res.message[key] + "<br/>";
                                    }
                                    u.messageDialog({
                                        msg: msg,
                                        title: '请求错误',
                                        btnText: '确定'
                                    });
                                }
                            } else {
                                u.messageDialog({
                                    msg: '后台返回数据格式有误，请联系管理员',
                                    title: '数据错误',
                                    btnText: '确定'
                                });
                            }
                        }
                    });
                },

                /**
                 * 子表部门查询方法
                 */
                getUserDeptList: function() {
                    var userId = viewModel.UserPsnFormDa.getValue("pk_user");
                    var jsonData = {
                        pageIndex: 0,
                        pageSize: viewModel.deptchildPageSize,
                        sortField: "ts",
                        sortDirection: "asc"
                    };
                    jsonData['search_fk_id_userrole'] = userId;

                    $.ajax({
                        type: 'GET',
                        url: tepoc_ctx + '/UserDept/list',
                        datatype: 'json',
                        data: jsonData,
                        contentType: 'application/json;charset=utf-8',
                        success: function(res) {
                            if (res) {
                                if (res.success == 'success') {
                                    if (res.detailMsg.data) {
                                        viewModel.UserDeptFormDa.removeAllRows();
                                        viewModel.UserDeptFormDa.clear();
                                        viewModel.UserDeptFormDa.setSimpleData(res.detailMsg.data.content, {
                                            unSelect: true
                                        });

                                        viewModel.UserDeptFormDa.setSimpleData(res.detailMsg.data.content, {
                                            unSelect: true
                                        });
                                        var totleCount = res.detailMsg.data.totalElements;
                                        var totlePage = res.detailMsg.data.totalPages;
                                        viewModel.child_dept_card_pcomp.update({ // 卡片页子表的分页信息
                                            totalPages: totlePage,
                                            pageSize: viewModel.deptchildPageSize,
                                            currentPage: viewModel.deptchilddraw,
                                            totalCount: totleCount
                                        });
                                        if (totleCount > viewModel.deptchildPageSize) { // 根据总条数，来判断是否显示子表的分页层
                                            $('#child_dept_card_pagination').show();
                                        } else {
                                            $('#child_dept_card_pagination').hide();
                                        }

                                    }
                                } else {
                                    var msg = "";
                                    for (var key in res.message) {
                                        msg += res.message[key] + "<br/>";
                                    }
                                    u.messageDialog({
                                        msg: msg,
                                        title: '请求错误',
                                        btnText: '确定'
                                    });
                                }
                            } else {
                                u.messageDialog({
                                    msg: '后台返回数据格式有误，请联系管理员',
                                    title: '数据错误',
                                    btnText: '确定'
                                });
                            }
                        }
                    });
                },
                /**
                 * 子表活动照片查询方法
                 */
                getUserFileList: function() {

                },
                /**
                 *
                 */
                initPagination: function() {
                    var paginationDiv = $(element).find('#pagination')[0];
                    viewModel.comps = new u.pagination({
                        el: paginationDiv,
                        jumppage: true
                    });

                    viewModel.child_card_pcomp = new u.pagination({
                        el: $(element).find('#child_card_pagination')[0],
                        jumppage: true
                    });

                    viewModel.child_dept_card_pcomp = new u.pagination({
                        el: $(element).find('#child_dept_card_pagination')[0],
                        jumppage: true
                    });
                    viewModel.event.pageChange();
                    viewModel.event.sizeChange();
                },
                /**
                 * 初始化分页标签的监听
                 */
                pageChange: function() {
                    viewModel.comps.on('pageChange', function(pageIndex) {
                        viewModel.draw = pageIndex + 1;
                        viewModel.event.initUerList();
                    });
                    viewModel.child_card_pcomp.on('pageChange', function(pageIndex) {
                        viewModel.childdraw = pageIndex + 1;
                        viewModel.event.getUserJobList();
                    });
                    viewModel.child_dept_card_pcomp.on('pageChange', function(pageIndex) {
                        viewModel.deptchilddraw = pageIndex + 1;
                        viewModel.event.getUserDeptList();
                    });
                },
                sizeChange: function() {
                    viewModel.comps.on('sizeChange', function(arg) {
                        // 数据库分页
                        viewModel.pageSize = parseInt(arg);
                        viewModel.draw = 1;
                        viewModel.event.initUerList();
                    });

                    viewModel.child_card_pcomp.on('sizeChange', function(arg) {
                        viewModel.childPageSize = parseInt(arg);
                        viewModel.childdraw = 1;
                        viewModel.event.getUserJobList();
                    });
                    viewModel.child_dept_card_pcomp.on('sizeChange', function(arg) {
                        viewModel.deptchildPageSize = parseInt(arg);
                        viewModel.deptchilddraw = 1;
                        viewModel.event.getUserDeptList();
                    });
                },




                /**
                 * 头部新建按钮操作
                 */
                addClick: function() {
                    viewModel.formStatus = _CONST.FORM_STATUS_ADD;
                    window.deptSearch = true;
                    window.fileSearch = true;
                    // 只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    viewModel.event.clearDa(viewModel.UserPsnFormDa);
                    viewModel.UserPsnFormDa.createEmptyRow();
                    viewModel.UserPsnFormDa.setRowSelect(0);
                    viewModel.event.clearDa(viewModel.UserRoleFormDa);
                    viewModel.event.clearDa(viewModel.UserDeptFormDa);
                    viewModel.event.clearDa(viewModel.UserFileFormDa);
                    
                    viewModel.child_card_pcomp.update({ // 卡片页子表的分页信息
                        totalPages: 1,
                        pageSize: viewModel.childPageSize,
                        currentPage: viewModel.childdraw,
                        totalCount: 0
                    });
                    viewModel.child_dept_card_pcomp.update({ // 卡片页子表的分页信息
                        totalPages: 1,
                        pageSize: viewModel.childPageSize,
                        currentPage: viewModel.childdraw,
                        totalCount: 0
                    });
                    
                    // 设置业务操作逻辑
                    $(".u-button-pa").removeClass('hide');
                    $('.border').addClass('hide');
                    // 显示操作卡片
                    viewModel.md.dGo('addPage');
                    $('#tab_role')[0].click();
                },
                /**
                 * 头部编辑按钮操作
                 */
                editClick: function() {
                    viewModel.formStatus = _CONST.FORM_STATUS_EDIT;
                    window.deptSearch = false;
                    window.fileSearch = false;
                    var selectArray = viewModel.UserPsnDa.selectedIndices();
                    if (selectArray.length < 1) {
                        u.messageDialog({
                            msg: "请选择要编辑的记录!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    if (selectArray.length > 1) {
                        u.messageDialog({
                            msg: "一次只能编辑一条记录，请选择要编辑的记录!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    // 只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    // 获取选取行数据
                    viewModel.UserPsnDa.setRowSelect(selectArray);
                    viewModel.event.clearDa(viewModel.UserPsnFormDa);
                    viewModel.event.clearDa(viewModel.UserRoleFormDa);
                    viewModel.event.clearDa(viewModel.UserDeptFormDa);
                    viewModel.event.clearDa(viewModel.UserFileFormDa);
                    viewModel.UserPsnFormDa.setSimpleData(viewModel.UserPsnDa.getSimpleData({
                        type: 'select'
                    }));

                    viewModel.event.getUserJobList();

                    viewModel.UserPsnFormDa.setEnable(true);
                    viewModel.UserRoleFormDa.setEnable(true);
                    $(".u-button-pa,.padding-bottom-5>button").removeClass('hide');
                    $('.border').addClass('hide');
                    viewModel.event.infoFileQuery();

                    // 显示操作卡片
                    viewModel.md.dGo('addPage');
                    $('#tab_role')[0].click();
                },
                /**
                 * 头部查阅按钮操作
                 */
                showClick: function() {
                    viewModel.formStatus = _CONST.FORM_STATUS_EDIT;
                    window.deptSearch = false;
                    window.fileSearch = false;
                    var selectArray = viewModel.UserPsnDa.selectedIndices();
                    if (selectArray.length < 1) {
                        u.messageDialog({
                            msg: "请选择要查阅的记录!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    if (selectArray.length > 1) {
                        u.messageDialog({
                            msg: "一次只能查阅一条记录，请选择要查阅的记录!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    // 只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    // 获取选取行数据
                    viewModel.UserPsnDa.setRowSelect(selectArray);
                    viewModel.event.clearDa(viewModel.UserPsnFormDa);
                    viewModel.event.clearDa(viewModel.UserRoleFormDa);
                    viewModel.event.clearDa(viewModel.UserDeptFormDa);
                    viewModel.event.clearDa(viewModel.UserFileFormDa);
                    viewModel.UserPsnFormDa.setSimpleData(viewModel.UserPsnDa.getSimpleData({
                        type: 'select'
                    }));

                    viewModel.event.getUserJobList();

                    viewModel.UserPsnFormDa.setEnable(false);
                    viewModel.UserRoleFormDa.setEnable(false);
                    $(".u-button-pa,.padding-bottom-5>button").addClass('hide');
                    $('.border').removeClass('hide');
                    viewModel.event.infoFileQuery();

                    // 显示操作卡片
                    viewModel.md.dGo('addPage');
                    $('#tab_role')[0].click();
                },


                /**
                 * 头部删除按钮操作
                 */
                delRow: function() {
                    var selectArray = viewModel.UserPsnDa.selectedIndices();
                    if (selectArray.length < 1) {
                        u.messageDialog({
                            msg: "请选择要删除的行!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    u.confirmDialog({
                        msg: '<div class="pull-left col-padding" >' +
                            '<i class="fa fa-exclamation-circle margin-r-5 fa-3x orange" style="vertical-align:middle"></i>确认删除这些数据数据吗？</div>',
                        title: '警告',
                        onOk: function() {
                            viewModel.event.delConfirm();
                        }
                    });
                },
                /**
                 * 删除核心方法
                 */
                delConfirm: function() {
                    var jsonDel = viewModel.UserPsnDa.getSimpleData({
                        type: 'select'
                    });
                    $.ajax({
                        type: "post",
                        url: viewModel.delURL,
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(jsonDel),
                        success: function(res) {
                            if (res) {
                                if (res.success == 'success') {
                                    viewModel.event.initUerList();
                                } else {
                                    u.messageDialog({
                                        msg: res.message,
                                        title: '操作提示',
                                        btnText: '确定'
                                    });
                                }
                            } else {
                                u.messageDialog({
                                    msg: '无返回数据',
                                    title: '操作提示',
                                    btnText: '确定'
                                });
                            }
                        }

                    });
                },

                /**
                 * 返回操作
                 */
                goBack: function() {
                    // 只显示新增编辑删除按钮
                    viewModel.event.userListBtn();
                    viewModel.md.dBack();
                    viewModel.event.initUerList();
                    // $('#child_list_pagination').hide(); //隐藏子表的分页层
                },
                /**
                 * 保存按钮操作
                 */
                saveClick: function() {
                    // compsValidate是验证输入格式。
                    if (!app.compsValidate($(element).find('#user-form')[0])) {
                        return;
                    }

                    var user = viewModel.UserPsnFormDa.getSimpleData();
                    var userJob = viewModel.UserRoleFormDa.getSimpleData();
                    if (userJob) {
                        for (var i = 0; i < userJob.length; i++) {
                            if (userJob[i].status != '3') {
                                if (userJob[i].pk_user_role) {
                                    userJob[i].status = '1'
                                } else {
                                    userJob[i].status = '2'
                                }
                            }

                        }
                    }

                    var userDept = viewModel.UserDeptFormDa.getSimpleData();
                    if (userDept) {
                        for (var i = 0; i < userDept.length; i++) {
                            if (userDept[i].status != '3') {
                                if (userDept[i].pk_user_dept) {
                                    userDept[i].status = '1'
                                } else {
                                    userDept[i].status = '2'
                                }
                            }
                        }
                    }

                    var userFile = viewModel.UserFileFormDa.getSimpleData();
                    var jsondata = user[0];
                    jsondata.id_userrole = userJob;
                    jsondata.status = '2';
                    jsondata.id_userdept = userDept;
//                    jsondata.id_userFile = userFile;
                    var sendurl = viewModel.addURL;
                    if (viewModel.formStatus === _CONST.FORM_STATUS_EDIT) {
                        sendurl = viewModel.updateURL;
                        jsondata.status = '1';
                    }
                    /*jsondata = {
//                        "pk_user": "29b3ae05-4d66-4681-8279-7a61fa3abe6e",
                        username: "黄油",
                        sex: "0",
                        status: '2', //默认是0不操作，1表示修改，2表示新增，3表示删除
                        idcard: "3333",
                        edution: "大学",
                        email: "100005656@qq.com",
                        id_userrole: [{
                                pk_user_role: "944b6460-15df-4e08-befa-c539d84e8c2c",
                                rolecode: "test00000",
                                rolename: "dept00000",
                                status: "1"
                            },
                            {
                                pk_user_role: "24da8d1f-a5cb-45ba-a14a-ab0a093b4d5e",
                                rolecode: "test2",
                                rolename: "dept2",
                                status: "3"
                            },
                            {
                                rolecode: "test33333",
                                rolename: "dept3333",
                                status: "2"
                            }
                        ],
                        id_userdept: [{
                                pk_user_dept: "9cbec5e7-30fa-48de-a63d-e6d8715569f4",
                                pk_dept: "dept00000",
                                deptcode: "test00000",
                                deptname: "dept00000",
                                status: "1"
                            }, {
                                pk_user_dept: "e7593675-1b9d-44bd-bb01-8ab98c52f46e",
                                pk_dept: "dept2",
                                deptcode: "test2",
                                deptname: "dept2",
                                status: "3"
                            },
                            {
                                pk_dept: "dept3333",
                                deptcode: "test3333",
                                deptname: "dept3333",
                                status: "2"
                            }
                        ]

                    }*/
                    $.ajax({
                        type: "post",
                        url: sendurl,
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(jsondata), // 将对象序列化成JSON字符串
                        success: function(res) {
                            if (res) {
                                if (res.success == 'success') {
                                    u.showMessage({
                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>操作成功",
                                        position: "bottom"
                                    });
                                    viewModel.event.goBack();
                                } else {
                                    var msg = "";
                                    if (res.success == 'fail_global') {
                                        msg = res.message;
                                    } else {
                                        for (var key in res.detailMsg) {
                                            msg += res.detailMsg[key] + "<br/>";
                                        }
                                    }
                                    u.messageDialog({
                                        msg: msg,
                                        title: '请求错误',
                                        btnText: '确定'
                                    });
                                }
                            } else {
                                u.messageDialog({
                                    msg: '没有返回数据',
                                    title: '操作提示',
                                    btnText: '确定'
                                });
                            }
                        }
                    });
                },

                /**
                 * 子表角色删除操作
                 */
                delUserJob: function() {
                    var userJobs = viewModel.UserRoleFormDa.getSimpleData({
                        type: 'select'
                    })
                    if (!userJobs || userJobs.length < 1) {
                        u.messageDialog({
                            msg: "请选择要删除的行!",
                            title: "提示",
                            btnText: "OK"
                        });
                    } else {
                        if (confirm("确定要删除吗?")) {
                            var jsonDel = viewModel.UserRoleFormDa.getSimpleData({
                                type: 'focus'
                            });
                            var index = viewModel.UserRoleFormDa.getFocusIndex();
                            if (jsonDel[0].pk_user_role == null) {
                                viewModel.UserRoleFormDa.setRowsDelete(index);
                                return;
                            } else {
                                viewModel.UserRoleFormDa.setRowsDelete(index);
                                viewModel.UserRoleFormDa.getRow(index).setValue('status', '3')
                                return;
                            }

                        }
                    }

                },
                /**
                 * 子表部门删除操作
                 */
                delUserDept: function() {
                    var userJobs = viewModel.UserDeptFormDa.getSimpleData({
                        type: 'select'
                    })
                    if (!userJobs || userJobs.length < 1) {
                        u.messageDialog({
                            msg: "请选择要删除的行!",
                            title: "提示",
                            btnText: "OK"
                        });
                    } else {
                        if (confirm("确定要删除吗?")) {
                            var jsonDel = viewModel.UserDeptFormDa.getSimpleData({
                                type: 'focus'
                            });
                            var index = viewModel.UserDeptFormDa.getFocusIndex();
                            if (jsonDel[0].pk_user_dept == null) {
                                viewModel.UserDeptFormDa.setRowsDelete(index);
                                return;
                            } else {

                                viewModel.UserDeptFormDa.setRowsDelete(index);
                                viewModel.UserDeptFormDa.getRow(index).setValue('status', '3')
                                return;
                            }

                        }
                    }

                },

                /**
                 * 主页数据行选中处理
                 */
                rowClick: function(row, e) {
                    var ri = e.target.parentNode.getAttribute('rowindex')
                    if (ri != null) {
                        viewModel.UserPsnDa.setRowFocus(parseInt(ri));
                        viewModel.UserPsnDa.setRowSelect(parseInt(ri));
                    }
                    viewModel.UserPsnFormDa.setSimpleData(viewModel.UserPsnDa.getSimpleData({
                        type: 'select'
                    }));
                },
                /**
                 * 主页查询之后处理显示，基于KO
                 */
                afterAdd: function(element, index, data) {
                    if (element.nodeType === 1) {
                        u.compMgr.updateComp(element);
                    }
                },
                /** 20161205修改最外层框架按钮组的显示与隐藏 */
                userListBtn: function() { // 显示user_list_button_2
                    $('#user_list_button_2').parent('.u-mdlayout-btn').removeClass('hide');
                    $('.form-search').removeClass('hide');
                    $('#user_card_button').parent('.u-mdlayout-btn').addClass('hide');

                },
                userCardBtn: function() { // 显示user_card_button
                    $('#user_list_button_2').parent('.u-mdlayout-btn').addClass('hide');
                    $('.form-search').addClass('hide');
                    $('#user_card_button').parent('.u-mdlayout-btn').removeClass('hide');
                },
                /** 判断对象的值是否为空 */
                isEmpty: function(obj) {
                    if (obj.value == undefined || obj.value == '' || obj.value.length == 0) {
                        return true;
                    } else {
                        return false;
                    }
                },
                /** 清除 datatable的数据 */
                clearDa: function(da) {
                    da.removeAllRows();
                    da.clear();
                },

            } // end event

        };
        // end viewModel


        $(element).html(template);
        window.vm = viewModel;
        var app = u.createApp({
            el: '#content',
            model: viewModel
        });
        viewModel.md = $(element).find('#user-mdlayout')[0]['u.MDLayout'];


        viewModel.event.initUerList();
        viewModel.event.initPagination();

        /** 处理角色和部门的新增 begin * */
        viewModel.searchData.createEmptyRow();
        viewModel.searchData.setRowSelect(0);
        viewModel.addRefDa.createEmptyRow();
        viewModel.addRefDa.setRowSelect(0);
        /** 处理角色和部门的新增 end * */

        /**
         * 添加切换页签的处理，保证后2个页签只有切换的时候才会执行查询
         *
         * @type {[type]}
         */

        $('.u-tabs__tab-bar>a').on('click', function(obj) {
            var $this = $(this);
            if ($this.attr('id') == 'tab_dept') {
                // 切换到管理部门页签
                if (!window.deptSearch) {
                    viewModel.event.getUserDeptList();
                    window.deptSearch = true;
                }

            } else if ($this.attr('id') == 'tab_file') {
                if (!window.fileSearch) {
                    viewModel.event.fileQuery(); // 修改为查询file
                    window.fileSearch = true;
                }
            }
        })
        //初始化参照
        var ref = function() {
            var refid;
            var dom;
            var pk = '';

            $('#rolerefadd').each(function(i, val) {
                var $that = $(this);
                dom = $that;
                var options = {
                    refCode: "roleref",
                    isMultiSelectedEnabled: false
                };
                refComp.initRefComp($that, options);
            });
            $('#deptAddRef').each(function(i, val) {
                var $that = $(this);
                dom = $that;
                var options = {
                    refCode: "deptref",
                    isMultiSelectedEnabled: false
                };
                refComp.initRefComp($that, options);
            });
            $('#deptAddRef1').each(function(i, val) {
                var $that = $(this);
                dom = $that;
                var options = {
                    refCode: "deptref",
                    isMultiSelectedEnabled: false
                };
                refComp.initRefComp($that, options);
            });
            viewModel.addRefDa.on('valuechange', function(v, b) {
                var field = v.field;
                if (field == 'role') {
                    var ref = $('#refContainerrolerefadd').data('uui.refer');

                    if (ref.values.length > 0) {
                        for (var i = 0; i < ref.values.length; i++) {
                            var arr = [];
                            var rolecode = ref.values[i].refcode;
                            var rolename = ref.values[i].refname;
                            var roletype = ref.values[i].roletype;
                            arr.push({
                                "rolecode": rolecode,
                                "rolename": rolename,
                                "roletype": roletype
                            })
                            var row = viewModel.UserRoleFormDa.getRowByField('rolecode', rolecode);
                            if (!row) {
                                viewModel.UserRoleFormDa.addSimpleData(arr);
                            }
                        }
                    }

                } else if (field == 'dept') {
                    var ref = $('#refContainerdeptAddRef').data('uui.refer');

                    if (ref.values.length > 0) {
                        for (var i = 0; i < ref.values.length; i++) {
                            var arr = [];
                            var deptcode = ref.values[i].refcode;
                            var deptname = ref.values[i].refname;
                            arr.push({
                                "deptcode": deptcode,
                                "deptname": deptname,
                            })
                            var row = viewModel.UserDeptFormDa.getRowByField('deptcode', deptcode);
                            if (!row) {
                                viewModel.UserDeptFormDa.addSimpleData(arr);
                            }
                        }

                    }

                } else if (field == 'deptedit') {
                    var ref = $('#refContainerdeptAddRef').data('uui.refer');

                    if (ref.values.length > 0) {
                        var selRowIndex = viewModel.UserDeptFormDa.getSelectedIndex();
                        viewModel.UserDeptFormDa.removeRow(selRowIndex);
                        for (var i = 0; i < ref.values.length; i++) {
                            var arr = [];
                            var deptcode = ref.values[i].refcode;
                            var deptname = ref.values[i].refname;
                            arr.push({
                                "deptcode": deptcode,
                                "deptname": deptname,
                            })
                            var row = viewModel.UserDeptFormDa.getRowByField('deptcode', deptcode);
                            if (!row) {
                                viewModel.UserDeptFormDa.addSimpleData(arr);
                            }
                        }

                    }
                }

            })


            $('#corpref').each(function(i, val) {
                var $that = $(this);
                dom = $that;
                var options = {
                    refCode: "corpref",
                    selectedVals: pk,
                    isMultiSelectedEnabled: false
                };
                refComp.initRefComp($that, options);
            });
            $('#deptref').each(function(i, val) {
                var $that = $(this);
                dom = $that;
                var options = {
                    refCode: "deptref",
                    selectedVals: pk,
                    isMultiSelectedEnabled: false
                };
                refComp.initRefComp($that, options);
            });

            var $input = dom.find('input');
            $input.val(name);
        }
        ref();

    } // end init



    return {
        'model': init.viewModel,
        'template': template,
        init: function(params, arg) {
            init(params, arg);
            /* 回车搜索 */
            $('.search-enter').keydown(function(e) {
                if (e.keyCode == 13) {
                    $('#user-action-search').trigger('click');

                }
            });
        }
    }
});
// end define
