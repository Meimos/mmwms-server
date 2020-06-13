package com.meimos.project.system.mapper;

import com.meimos.project.system.domain.SysSno;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysSnoMapper {

    /**
     * 判读流水号别名是否已经存在
     * @param id  id为null 表明是新增的流水号，否则为更新流水号
     * @param alias
     * @return
     */
    int isAliasExisted(Long id, String alias);

    /**
     * 根据别名获取流水号数据（数据库锁定了对应的行数据）
     * @param alias
     * @return
     */
    SysSno getByAlias(String alias);


    /**
     * 根据流水别名更新 。
     * @param sysSno
     * void
     */
    int updByAlias(SysSno sysSno);

    /**
     * 根据ID更新 。
     * @param sysSno
     * void
     */
    int update(SysSno sysSno);

    /**
     * 创建流水号配置 。
     * @param sysSno
     */
    int create(SysSno sysSno);

    /**
     * 查询流水号列表 。
     * @param sysSno
     * @return
     */
    List<SysSno> selectSnoList(SysSno sysSno);

    /**
     * 删除流水号配置 。
     * @param sysSno
     * @return
     */
    int remove(Long[] id);

    /**
     * 根据id查询。
     * @param id
     * @return 流水号信息
     */
    SysSno getById(Long id);
}
