package com.meimos.project.system.service;

import com.meimos.project.system.domain.SysSno;

import java.util.List;

public interface ISysSnoService {
	
	/**
	 * 判读流水号别名是否已经存在
	 * @param id  id为null 表明是新增的流水号，否则为更新流水号
	 * @param alias
	 * @return
	 */
	boolean isAliasExisted(Long id, String alias);

	/**
	 * 根据别名获取当前流水号
	 * @param alias
	 * @return
	 */
	public String getCurIdByAlias(String alias);
	
	/**
	 * 根据别名获取下一个流水号
	 * @param alias
	 * @return
	 */
	public String nextId(String alias);
	
	/**
	 * 根据别名预览前十条流水号
	 * @param alias
	 * @return
	 */
	public List<SysSno> getPreviewIden(String alias);

	/**
	 * 根据条件分页查询用户列表
	 *
	 * @param sysSno 流水号信息
	 * @return 用户信息集合信息
	 */
	public List<SysSno> selectSnoList(SysSno sysSno);

	/**
	 * 根据id查询流水号。
	 * @param id
	 * @return 流水号信息
	 */
	public SysSno getById(Long id);

	/**
	 * 删除流水号配置 。
	 * @param id
	 * @param userId
     * @return
	 */
	public int remove(Long[] userId);

	/**
	 * 修改流水号信息
	 *
	 * @param sysSno 流水号信息
	 * @return 结果
	 */
	public int update(SysSno sysSno);

	/**
	 * 创建流水号配置 。
	 * @param sysSno
	 */
	public int create(SysSno sysSno);

	/**
	 * 根据别名获取流水号数据（数据库锁定了对应的行数据）
	 * @param alias
	 * @return
	 */
	SysSno getByAlias(String alias);
}
