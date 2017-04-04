import static com.yonyou.uap.ieop.busilog.context.ContextKeyConstant.BUSINESS_SYS_ID;
class BusinessLogConfig {
    def context;    
     def UserPsnService_delete() {
        [category:"删除类",log:"用户管理：执行删除方法:${context._param0}的日志记录"]
    }
    
    def UserPsnService_save() {
        [category:"保存类",log:"用户管理：执行保存方法:${context._param0}的日志记录"]
    }
    
    def UserPsnService_query() {
        [category:"查询类",log:"用户管理：执行查询方法:${context._param0}的日志记录"]
    }
    
    def UserRoleService_query() {
        [category:"查询类",log:"所属角色：执行查询方法:${context._param0}的日志记录"]
    }

}
