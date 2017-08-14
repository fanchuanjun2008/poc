package com.yonyou.iuap.base.view;

import java.util.List;

/**
 * 带分页的数据
 * @author liuhanc
 *
 * @param <T>
 */
public class ViewListData<T> {

    private int total;//数据总量
    private int start;//当前list的数据起始index
    private int size;//当前list数据量
    private String sort;
    private String order;

    private List<T> list;//具体数据

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

}
