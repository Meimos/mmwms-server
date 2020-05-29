package com.meimos.project.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.List;

/**
 * 路由配置信息
 * 
 * @author ruoyi
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class RouterVo
{
    /**
     * 路由名字
     */
    private String text;

    /**
     * 路由地址
     */
    private String link;

    /**
     * 是否分组
     */
    private boolean group;

    /**
     * 图标
     */
    private String icon;

    /**
     * i18n key
     */
    private String i18n;

    /**
     * 隐藏面包屑
     */
    private Boolean hideInBreadcrumb;

    /**
     * 权限字符
     */
    private String acl;

    /**
     * 权限字符
     */
    private Boolean shortcut;

    /**
     * 子路由
     */
    private List<RouterVo> children;


    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public boolean isGroup() {
        return group;
    }

    public void setGroup(boolean group) {
        this.group = group;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getI18n() {
        return i18n;
    }

    public void setI18n(String i18n) {
        this.i18n = i18n;
    }

    public Boolean getHideInBreadcrumb() {
        return hideInBreadcrumb;
    }

    public void setHideInBreadcrumb(Boolean hideInBreadcrumb) {
        this.hideInBreadcrumb = hideInBreadcrumb;
    }

    public String getAcl() {
        return acl;
    }

    public void setAcl(String acl) {
        this.acl = acl;
    }

    public Boolean getShortcut() {
        return shortcut;
    }

    public void setShortcut(Boolean shortcut) {
        this.shortcut = shortcut;
    }

    public List<RouterVo> getChildren() {
        return children;
    }

    public void setChildren(List<RouterVo> children) {
        this.children = children;
    }
}
