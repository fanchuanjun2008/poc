define(['refComp','text!pages/userpsn/userpsn.html', 'pages/userpsn/meta', 'css!pages/userpsn/userpsn.css', 'uuitree', 'uuigrid', 'config/sys_const'], function( refComp,template) {

    //开始初始页面基础数据
    var init = function(element, params) {
        var viewModel = {
            draw: 1, //页数(第几页)
            childdraw: 1, //子表角色页号
            deptchilddraw: 1, //子表部门页号
            filechilddraw: 1, //子表图片页号
            pageSize: 5, // 主表分页
            childPageSize: 5, //子表角色分页
            deptchildPageSize: 5, //子表部门分页
            filechildPageSize: 5, //子表图片分页
            searchURL: tepoc_ctx + '/UserPsn/list',
            addURL: tepoc_ctx + "/UserPsn/add",
            updateURL: tepoc_ctx + "/UserPsn/update",
            delURL: tepoc_ctx + "/UserPsn/delBatch",
            formStatus: _CONST.FORM_STATUS_ADD,
            UserPsnDa: new u.DataTable(metaDt), // 主表显示
            UserPsnFormDa: new u.DataTable(metaDt), // 主表编辑
            UserRoleFormDa: new u.DataTable(metaUserRole), //子表角色
            UserDeptFormDa: new u.DataTable(metaUserDept), // 子表部门
            UserFileFormDa: new u.DataTable(metaUserDept), // 子表图片 // lyk备注：创建对应datatable
            searchData: new u.DataTable(metaSearch), //查询用
            addRefDa: new u.DataTable({ //子表新增用
                meta: {
                    'role': {},
                    'dept': {}
                }
            }),

            comboData: [{
                name: '男',
                value: '01'
            }, {
                name: '女',
                value: '02'
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
                    $(element).find('.form-search').find('input').val('');
                },
                /**
                 * 参照增加点击确定的监听公共方法
                 * @param  {[type]} name 输入框的ID
                 * @param  {[type]} url  参照对应的后台url
                 * @param  {[type]} fun  参照点击之后的function调用
                 */
                initRefer: function(name, url, fun) {
                    var $that = $('#' + name);
                    var refcont = $('#refContainer' + name);
                    if (refcont && refcont.length > 0) {
                        refcont.each(function() {
                            refcont.data('uui.refer', '');
                        });
                    }
                    var options = {
                        refInput: $that,
                        refModelUrl: url,
                        isPOPMode: true,
                        contentId: 'refContainer' + name,
                        dom: $that,
//                        pageUrl: '/iform_web/static/js/ref/refDList.js', // lyk备注：对应js路径修改 联系范传军确定对应的url
                        pageUrl: '/uitemplate_web/static/js/ref/refDList.js', // lyk备注：对应js路径修改 联系范传军确定对应的url
                        setVal: function(data) {
                            fun.call(this, data);

                        }
                    }
                    var pageURL = options.pageUrl;
                    var refInitFunc = pageURL.substr(pageURL.lastIndexOf('/') + 1).replace('.js', '');
                    if (!window[refInitFunc]) {
                        var scriptStr = '';
                        $.ajax({
                            url: pageURL,
                            dataType: 'script',
                            async: false,
                            success: function(data) {
                                scriptStr = data
                            }
                        })
                        eval(scriptStr);
                    }
                    try {
                        window[refInitFunc](options);
                    } catch (e) {

                    }
                    $that.off('blur.refer');
                },

                /**
                 * 子表角色新建参照增加点击确定的监听（初始调用）
                 */
                initRoleAdd: function() {
                    viewModel.event.initRefer('roleAddRef', 'http://127.0.0.1:8090/tepoc/ref/roleref/', function(data) { // lyk备注：参照请求url 联系范传军确定
                        if (data && data.length > 0) {
                            var dataArr = [];
                            $.each(data, function(index, _data) {
                                var code = _data.code;
                                var name = _data.name;
                                var type = _data.type;
                                var dataObj = {};
                                dataObj.roleCode = _data.code;
                                dataObj.roleName = _data.name;
                                dataObj.roleType = _data.type;
                                dataArr.push(dataArr);
                            });
                        }
                        viewModel.UserRoleFormDa.addSimpleData(dataArr);
                    })
                },
                /**
                 * 子表角色新建点击触发参照
                 */
                addUserRole: function() {
                    $('#roleAddRef').trigger("click.refer");
                },
                /**
                 * 子表部门新建参照增加点击确定的监听（初始调用）
                 */
                initDeptAdd: function() {
                    viewModel.event.initRefer('deptAddRef', 'url------', function(data) { // lyk备注：参照请求url 联系范传军确定
                        if (data && data.length > 0) {
                            var dataArr = [];
                            $.each(data, function(index, _data) {
                                var code = _data.code;
                                var name = _data.name;
                                var dataObj = {};
                                dataObj.deptCode = _data.code;
                                dataObj.deptName = _data.name;
                                dataArr.push(dataArr);
                            });
                        }
                        viewModel.UserDeptFormDa.addSimpleData(dataArr);
                    })
                },
                /**
                 * 子表部门新建点击触发参照
                 */
                addUserDept: function() {
                    $('#deptAddRef').trigger("click.refer");
                },
                /**
                 * 子表部门编辑参照增加点击确定的监听（初始调用）
                 */
                initDeptEdit: function() {
                    viewModel.event.initRefer('deptAddRef1', 'url-----', function(data) { // lyk备注：参照请求url 联系范传军确定
                        if (data && data.length > 0) {
                            var dataArr = [];
                            $.each(data, function(index, _data) {
                                var code = _data.code;
                                var name = _data.name;
                                var dataObj = {};
                                dataObj.deptCode = _data.code;
                                dataObj.deptName = _data.name;
                                dataArr.push(dataArr);
                            });
                        }
                        var selRowIndex = viewModel.UserDeptFormDa.getSelectedIndex();
                        viewModel.UserDeptFormDa.removeRow(selRowIndex);
                        viewModel.UserDeptFormDa.addSimpleData(dataArr);
                    })
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
                        $('#deptAddRef1').trigger("click.refer");
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
                        jsonData["search_name"] = viewModel.searchData.getSimpleData()[0].search_name;
                        jsonData["search_sex"] = viewModel.searchData.getSimpleData()[0].search_sex;
                        jsonData["search_profession"] = viewModel.searchData.getSimpleData()[0].search_profession;
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
                    //end ajax
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
                                        viewModel.child_card_pcomp.update({ //卡片页子表的分页信息
                                            totalPages: totlePage,
                                            pageSize: viewModel.childPageSize,
                                            currentPage: viewModel.childdraw,
                                            totalCount: totleCount
                                        });
                                        if (totleCount > viewModel.childPageSize) { //根据总条数，来判断是否显示子表的分页层
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
                        pageSize: viewModel.deptpageSize,
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
                                        viewModel.child_dept_card_pcomp.update({ //卡片页子表的分页信息
                                            totalPages: totlePage,
                                            pageSize: viewModel.deptpageSize,
                                            currentPage: viewModel.deptchilddraw,
                                            totalCount: totleCount
                                        });
                                        if (totleCount > viewModel.deptpageSize) { //根据总条数，来判断是否显示子表的分页层
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
                        //数据库分页
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
                        viewModel.deptpageSize = parseInt(arg);
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
                    //只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    viewModel.event.clearDa(viewModel.UserPsnFormDa);
                    viewModel.UserPsnFormDa.createEmptyRow();
                    viewModel.UserPsnFormDa.setRowSelect(0);
                    viewModel.event.clearDa(viewModel.UserRoleFormDa);
                    viewModel.event.clearDa(viewModel.UserDeptFormDa);
                    viewModel.event.clearDa(viewModel.UserFileFormDa);
                    //设置业务操作逻辑
                    $(".u-button-pa").removeClass('hide');
                    //显示操作卡片
                    viewModel.md.dGo('addPage');
                },
                /**
                 * 头部编辑按钮操作
                 */
                editClick: function() {
                    viewModel.formStatus = _CONST.FORM_STATUS_EDIT;
                    window.deptSearch = false;
                    window.fileSearch = false;
                    var selectArray = viewModel.UserPsnDa.selectedIndices();
                    if (selectArray.length < 1 && false) {
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
                    //只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    //获取选取行数据
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

                    //显示操作卡片
                    viewModel.md.dGo('addPage');
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
                    //只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    //获取选取行数据
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

                    //显示操作卡片
                    viewModel.md.dGo('addPage');
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
                    //只显示新增编辑删除按钮
                    viewModel.event.userListBtn();
                    viewModel.md.dBack();
                    viewModel.event.initUerList();
                    //                    $('#child_list_pagination').hide(); //隐藏子表的分页层
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
                    var userDept = viewModel.UserDeptFormDa.getSimpleData();
                    var userFile = viewModel.UserFileFormDa.getSimpleData();
                    var jsondata = user[0];
                    jsondata.id_userrole = userJob;
                    jsondata.id_userdept = userDept;
                    jsondata.id_userFile = userFile;
                    var sendurl = viewModel.addURL;
                    if (viewModel.formStatus === _CONST.FORM_STATUS_EDIT) {
                        sendurl = viewModel.updateURL;
                    }
                    $.ajax({
                        type: "post",
                        url: sendurl,
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(jsondata), //将对象序列化成JSON字符串
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
                                viewModel.UserRoleFormDa.removeRows(index);
                                return;
                            }
                            $.ajax({
                                type: "post",
                                url: tepoc_ctx + "/UserRole/del",
                                contentType: 'application/json;charset=utf-8',
                                data: JSON.stringify(jsonDel[0]),
                                success: function(res) {
                                    if (res) {
                                        if (res.success == 'success') {
                                            viewModel.UserRoleFormDa.removeRows(index);
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
                                viewModel.UserDeptFormDa.removeRows(index);
                                return;
                            }
                            $.ajax({
                                type: "post",
                                url: tepoc_ctx + "/UserDept/del",
                                contentType: 'application/json;charset=utf-8',
                                data: JSON.stringify(jsonDel[0]),
                                success: function(res) {
                                    if (res) {
                                        if (res.success == 'success') {
                                            /* u.showMessage({
                                                 msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>删除成功",
                                                 position: "center"
                                             })*/
                                            viewModel.UserRoleFormDa.removeRows(index);
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
                 *  主页查询之后处理显示，基于KO
                 */
                afterAdd: function(element, index, data) {
                    if (element.nodeType === 1) {
                        u.compMgr.updateComp(element);
                    }
                },
                /**20161205修改最外层框架按钮组的显示与隐藏 */
                userListBtn: function() { //显示user_list_button_2
                    $('#user_list_button_2').parent('.u-mdlayout-btn').removeClass('hide');
                    $('.form-search').removeClass('hide');
                    $('#user_card_button').parent('.u-mdlayout-btn').addClass('hide');

                },
                userCardBtn: function() { //显示user_card_button
                    $('#user_list_button_2').parent('.u-mdlayout-btn').addClass('hide');
                    $('.form-search').addClass('hide');
                    $('#user_card_button').parent('.u-mdlayout-btn').removeClass('hide');
                },
                /**判断对象的值是否为空 */
                isEmpty: function(obj) {
                    if (obj.value == undefined || obj.value == '' || obj.value.length == 0) {
                        return true;
                    } else {
                        return false;
                    }
                },
                /**清除 datatable的数据  */
                clearDa: function(da) {
                    da.removeAllRows();
                    da.clear();
                },

            } // end  event

        };
        //end viewModel


        $(element).html(template);
        var app = u.createApp({
            el: '#content',
            model: viewModel
        });
        viewModel.md = $(element).find('#user-mdlayout')[0]['u.MDLayout'];


        viewModel.event.initUerList();
        viewModel.event.initPagination();

        /** 处理角色和部门的新增 begin **/
        viewModel.addRefDa.createEmptyRow();
        viewModel.addRefDa.setRowSelect(0);
        viewModel.event.initRoleAdd();
        viewModel.event.initDeptEdit();
        viewModel.event.initDeptAdd();
        /** 处理角色和部门的新增 end **/
        /**
         * 添加切换页签的处理，保证后2个页签只有切换的时候才会执行查询
         * @type {[type]}
         */
        $('.u-tabs')[0]['u.Tabs'].on('tabchange', function(obj) {
            if (obj.tabDom == $('#tab_dept')[0]) {
                // 切换到管理部门页签
                if (!window.deptSearch) {
                    alert('1')
                    viewModel.event.getUserDeptList();
                    window.deptSearch = true;
                }

            } else if (obj.tabDom == $('#tab_file')[0]) {
                if (!window.fileSearch) {
                    alert('2')
                    viewModel.event.getUserFileList(); //修改为查询file
                    window.fileSearch = true;
                }
            }
        })
        //初始化参照
//        var ref = function () {
//        	var refid;
//        	var dom;
//    		 var pk='';
//
//    		 $('.deptref').each(function(i,val){
//    		     	var $that=$(this);
//    		     	dom = $that;
//    				var options = {
//    						refCode:"dept",
//    						selectedVals:pk,
//    						isMultiSelectedEnabled:false
//    				};
//    				refComp.initRefComp($that,options);
//    				refid ='#refContainer' + $that.attr('id');
//    		 	});
//    		 $('.educateref').each(function(i,val){
//    		     	var $that=$(this);
//    		     	dom = $that;
//    				var options = {
//    						refCode:"user",
//    						selectedVals:pk,
//    						isMultiSelectedEnabled:false
//    				};
//    				refComp.initRefComp($that,options);
//    				refid ='#refContainer' + $that.attr('id');
//    		 	});
//    		 $('#countrysubsidy_city_edit').each(function(i,val){
//    		     	var $that=$(this);
//    		     	dom = $that;
//    				var options = {
//    						refCode:"city",
//    						selectedVals:pk,
//    						isMultiSelectedEnabled:false
//    				};
//    				refComp.initRefComp($that,options);
//    				refid ='#refContainer' + $that.attr('id');
//    		 	});
//    		 $('#countrysubsidy_city_add').each(function(i,val){
//    		     	var $that=$(this);
//    		     	dom = $that;
//    				var options = {
//    						refCode:"city",
//    						selectedVals:pk,
//    						isMultiSelectedEnabled:false
//    				};
//    				refComp.initRefComp($that,options);
//    				refid ='#refContainer' + $that.attr('id');
//    		 	});
//    		 var $input=dom.find('input');
//    		 $input.val(name);
//        }
//        ref();

    } //end init
    
   

    return {
        'model': init.viewModel,
        'template': template,
        init: function(params, arg) {
            init(params, arg);
            /*回车搜索*/
            $('.search-enter').keydown(function(e) {
                if (e.keyCode == 13) {
                    $('#user-action-search').trigger('click');

                }
            });
        }
    }
});
//end define
