package com.meimos.project.system.domain;

import com.meimos.framework.aspectj.lang.annotation.Excel;
import com.meimos.framework.aspectj.lang.annotation.Excel.ColumnType;
import com.meimos.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 流水号配置表 sys_sno
 * 
 * @author meimosor
 */
public class SysSno extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键", cellType = ColumnType.NUMERIC)
    private Long id;
    /** 名称 */
    @NotBlank(message = "名称不能为空")
    protected String name;
    /** 别名 */
    @NotBlank(message = "别名不能为空")
    protected String alias;
    /** 规则 */
    @NotBlank(message = "规则不能为空")
    protected String regulation;
    /** 生成类型 */
    protected Short genType;
    /** 流水号长度 */
    protected Integer noLength;
    /** 当前日期*/
    protected String curDate;
    /** 初始值 */
    protected Integer initValue;
    /** 当前值 */
    protected Integer curValue=0;
    /** 步长 */
    protected Short step;
    /** 新的流水号 */
    protected Integer newCurValue=0;
    /** 预览流水号 */
    protected String curIdenValue="";

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getRegulation() {
        return regulation;
    }

    public void setRegulation(String regulation) {
        this.regulation = regulation;
    }

    public Short getGenType() {
        return genType;
    }

    public void setGenType(Short genType) {
        this.genType = genType;
    }

    public Integer getNoLength() {
        return noLength;
    }

    public void setNoLength(Integer noLength) {
        this.noLength = noLength;
    }

    public String getCurDate() {
        return curDate;
    }

    public void setCurDate(String curDate) {
        this.curDate = curDate;
    }

    public Integer getInitValue() {
        return initValue;
    }

    public void setInitValue(Integer initValue) {
        this.initValue = initValue;
    }

    public Integer getCurValue() {
        return curValue;
    }

    public void setCurValue(Integer curValue) {
        this.curValue = curValue;
    }

    public Short getStep() {
        return step;
    }

    public void setStep(Short step) {
        this.step = step;
    }

    public Integer getNewCurValue() {
        return newCurValue;
    }

    public void setNewCurValue(Integer newCurValue) {
        this.newCurValue = newCurValue;
    }

    public String getCurIdenValue() {
        return curIdenValue;
    }

    public void setCurIdenValue(String curIdenValue) {
        this.curIdenValue = curIdenValue;
    }

    @Override
    public String toString() {
        return "SysSno{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", alias='" + alias + '\'' +
                ", regulation='" + regulation + '\'' +
                ", genType=" + genType +
                ", noLength=" + noLength +
                ", curDate='" + curDate + '\'' +
                ", initValue=" + initValue +
                ", curValue=" + curValue +
                ", step=" + step +
                ", newCurValue=" + newCurValue +
                ", curIdenValue='" + curIdenValue + '\'' +
                '}';
    }
}
