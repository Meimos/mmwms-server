package com.meimos.project.system.controller;


import com.meimos.common.constant.UserConstants;
import com.meimos.common.utils.SecurityUtils;
import com.meimos.common.utils.StringUtils;
import com.meimos.framework.web.controller.BaseController;
import com.meimos.framework.web.domain.AjaxResult;
import com.meimos.framework.web.page.TableDataInfo;
import com.meimos.project.system.domain.SysSno;
import com.meimos.project.system.domain.SysUser;
import com.meimos.project.system.service.ISysSnoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>Title: SysSnoController</p>
 * <p>Description: 系统流水号控制器</p>
 * @author whh
 * @date 2020年6月12日
 * @version 1.0
 */
@RestController
@RequestMapping("/system/sno")
public class SysSnoController extends BaseController {

    @Autowired
    private ISysSnoService sysSnoService;

    /**
     * 列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysSno sysSno)
    {
        startPage();
        List<SysSno> list = sysSnoService.selectSnoList(sysSno);
        return getDataTable(list);
    }

    /**
     * 获取流水号信息
     */
    @GetMapping(value = { "/", "/{id}" })
    public AjaxResult getInfo(@PathVariable(value = "id", required = false) Long id)
    {
        AjaxResult ajax = AjaxResult.success();
        if (StringUtils.isNotNull(id))
        {
            ajax.put("sn", sysSnoService.getById(id));
            ajax.put("sno", sysSnoService.nextId("inbound_bill_no"));
        }
        return ajax;
    }


    /**
     * 保存
     */
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysSno sysSno) {
        if(sysSnoService.isAliasExisted(null, sysSno.getAlias())) {
            return AjaxResult.error("新增流水号配置'" + sysSno.getAlias() + "'失败，别名已存在，请重新输入");
        }
        return toAjax(sysSnoService.create(sysSno));
    }

    /**
     * 更新
     */
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysSno sysSno) {
        return toAjax(sysSnoService.update(sysSno));
    }

    /**
     * 删除
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {

        return toAjax(sysSnoService.remove(ids));
    }
}
