package com.meimos.framework.web.domain;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.meimos.project.system.domain.SysMenu;

/**
 * Treeselect树结构实体类
 * 
 * @author ruoyi
 */
public class TreeSelect implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 节点ID */
    private Long key;

    /** 节点名称 */
    private String title;

    /** 子节点 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<TreeSelect> children;

    public TreeSelect()
    {

    }

    public TreeSelect(SysMenu menu)
    {
        this.key = menu.getMenuId();
        this.title = menu.getMenuName();
        this.children = menu.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    public Long getKey()
    {
        return key;
    }

    public void setKey(Long key)
    {
        this.key = key;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String label)
    {
        this.title = label;
    }

    public List<TreeSelect> getChildren()
    {
        return children;
    }

    public void setChildren(List<TreeSelect> children)
    {
        this.children = children;
    }
}
