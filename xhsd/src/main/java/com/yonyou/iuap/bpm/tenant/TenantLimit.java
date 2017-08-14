package com.yonyou.iuap.bpm.tenant;

/**
 * 租户隔离设置
 * @author zhaohb
 *
 */
public abstract class TenantLimit{
    private static final ThreadLocal<String> TENANTLIMIT=new ThreadLocal<String>();

    public static void set(String tenantLimit){
        TENANTLIMIT.set(tenantLimit);
    }

    public static String getTenantLimit(){
        return TENANTLIMIT.get();
    }

    public static void remove(){
        TENANTLIMIT.remove();
    }


}
