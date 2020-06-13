package com.meimos.project.system.service.impl;

import com.meimos.project.system.domain.SysSno;
import com.meimos.project.system.mapper.SysSnoMapper;
import com.meimos.project.system.service.ISysSnoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class SysSnoServiceImpl implements ISysSnoService {

    private static SimpleDateFormat YMD_SDF = new SimpleDateFormat("yyyyMMdd");

    @Autowired
    private SysSnoMapper snoMapper;

    /**
     * 判读流水号别名是否已经存在
     *
     * @param id    id为null 表明是新增的流水号，否则为更新流水号
     * @param alias
     * @return
     */
    public boolean isAliasExisted(Long id, String alias) {
        int count = snoMapper.isAliasExisted(id, alias);
        if (count > 0) {
            return true;
        }
        return false;
    }


    /**
     * 根据流程规则别名获取得当前流水号。
     *
     * @param alias 流水号规则别名。
     * @return
     */
    public String getCurIdByAlias(String alias) {
        SysSno sysSno = snoMapper.getByAlias(alias);
        Integer curValue = sysSno.getCurValue();
        if (curValue == null) curValue = sysSno.getInitValue();
        String rtn = getByRule(sysSno.getRegulation(), sysSno.getNoLength(), curValue);
        return rtn;
    }

    /**
     * 根据规则返回需要显示的流水号。
     *
     * @param rule     流水号规则。
     * @param length   流水号的长度。
     * @param curValue 流水号的当前值。
     * @return
     */
    private String getByRule(String rule, int length, int curValue) {
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH) + 1;
        int day = c.get(Calendar.DAY_OF_MONTH);
        String yearStr = "" + year;
        String shortYearStr = "" + year % 100;
        String shortMonth = "" + month;
        String longMonth = (month < 10) ? "0" + month : "" + month;

        String seqNo = getSeqNo(rule, curValue, length);

        String shortDay = "" + day;
        String longDay = (day < 10) ? "0" + day : "" + day;

        String rtn = rule.replace("{yyyy}", yearStr)
                .replace("{yy}", shortYearStr)
                .replace("{MM}", longMonth)
                .replace("{mm}", shortMonth)
                .replace("{DD}", longDay)
                .replace("{dd}", shortDay)
                .replace("{NO}", seqNo)
                .replace("{no}", seqNo);


        return rtn;
    }

    /**
     * 根据当前流水号的值和流水号显示的长度。
     * <pre>
     * 比如：当前流水号为55 ，显示长度为5那么这个方法返回：00055。
     * </pre>
     *
     * @param curValue 当前流水号的值。
     * @param length   显示的长度。
     * @return
     */
    private static String getSeqNo(String rule, int curValue, int length) {
        String tmp = curValue + "";
        int len = 0;
        if (rule.indexOf("no") > -1) {
            len = length;
        } else {
            len = length - tmp.length();
        }
        String rtn = "";
        switch (len) {
            case 1:
                rtn = "0";
                break;
            case 2:
                rtn = "00";
                break;
            case 3:
                rtn = "000";
                break;
            case 4:
                rtn = "0000";
                break;
            case 5:
                rtn = "00000";
                break;
            case 6:
                rtn = "000000";
                break;
            case 7:
                rtn = "0000000";
                break;
            case 8:
                rtn = "00000000";
                break;
            case 9:
                rtn = "000000000";
                break;
            case 10:
                rtn = "0000000000";
                break;
            case 11:
                rtn = "00000000000";
                break;
            case 12:
                rtn = "000000000000";
                break;
        }
        if (rule.indexOf("no") > -1) {
            return tmp + rtn;
        } else {
            return rtn + tmp;
        }

    }

    /**
     * 根据流程规则别名获取得下一个流水号。
     *
     * @param alias 流水号规则别名。
     * @return
     */
    public synchronized String nextId(String alias) {

        SysSno sysSno = snoMapper.getByAlias(alias);

        Result result = genResult(sysSno);

        int tryTimes = 0;
        while (result.getRtn() == 0) {
            tryTimes++; // 防止在使用中修改步长，导致死循环
            if (tryTimes > 100) throw new RuntimeException("获取流水号失败！ " + sysSno.getAlias());

            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            sysSno.setCurValue(result.getCurValue());
            result = genResult(sysSno);
        }
        return result.getIdNo();
    }

    public Result genResult(SysSno sysSno) {

        String rule = sysSno.getRegulation();
        int step = sysSno.getStep();
        int genEveryDay = sysSno.getGenType();

        //如果失败过一次、使用失败的当前值。没有失败
        Integer curValue = sysSno.getCurValue();
        /*if(failCurValue != 0) curValue = failCurValue;*/

        if (curValue == 0) curValue = sysSno.getInitValue();


        // 每天都生成
        if (genEveryDay == 1) {
            String curDate = getCurDate();
            String oldDate = sysSno.getCurDate();
            if (!curDate.equals(oldDate)) {
                sysSno.setCurDate(curDate);
                curValue = sysSno.getInitValue();
            } else {
                curValue = curValue + step;
            }
        } else if (genEveryDay == 2) { //按月生成
            String curMonth = getCurDate().substring(0, 6);
            String oldDate = sysSno.getCurDate().substring(0, 6);
            if (!curMonth.equals(oldDate)) {
                sysSno.setCurDate(getCurDate());
                curValue = sysSno.getInitValue();
            } else {
                curValue = curValue + step;
            }
        } else if (genEveryDay == 3) { //按年生成
            String curYear = getCurDate().substring(0, 4);
            String oldDate = sysSno.getCurDate().substring(0, 4);
            if (!curYear.equals(oldDate)) {
                sysSno.setCurDate(getCurDate());
                curValue = sysSno.getInitValue();
            } else {
                curValue = curValue + step;
            }
        } else {
            curValue = curValue + step;
        }
        sysSno.setNewCurValue(curValue);
        sysSno.setCurValue(curValue);

        int i = 0;
        i = snoMapper.updByAlias(sysSno);
        Result result = new Result(0, "", curValue);
        if (i > 0) {
            String rtn = getByRule(rule, sysSno.getNoLength(), curValue);
            result.setIdNo(rtn);
            result.setRtn(1);
        }
        return result;
    }

    /**
     * 返回当前日期。格式为 年月日。
     *
     * @return
     */
    public String getCurDate() {
        return YMD_SDF.format(new Date());

    }

    /**
     * 预览时，获取前十个流水号
     *
     * @param alias
     * @return
     */
    public List<SysSno> getPreviewIden(String alias) {
        int genNum = 10;
        SysSno sysSno = snoMapper.getByAlias(alias);
        String rule = sysSno.getRegulation();
        int step = sysSno.getStep();
        Integer curValue = sysSno.getCurValue();
        if (curValue == null) curValue = sysSno.getInitValue();
        List<SysSno> tempList = new ArrayList<>();
        for (int i = 0; i < genNum; i++) {
            SysSno sysSnotemp = new SysSno();
            if (i > 0) {
                curValue += step;
            }
            String rtn = getByRule(rule, sysSno.getNoLength(), curValue);
            sysSnotemp.setId(curValue.longValue());
            sysSnotemp.setCurIdenValue(rtn);
            tempList.add(sysSnotemp);
        }
        return tempList;
    }

    @Override
    public List<SysSno> selectSnoList(SysSno sysSno) {
        return snoMapper.selectSnoList(sysSno);
    }

    @Override
    public SysSno getById(Long id) {
        return snoMapper.getById(id);
    }

    @Override
    public int remove(Long[] ids) {
        return snoMapper.remove(ids);
    }

    @Override
    public int update(SysSno sysSno) {
        return snoMapper.update(sysSno);
    }

    @Override
    public int create(SysSno sysSno) {
        return snoMapper.create(sysSno);
    }

    @Override
    public SysSno getByAlias(String alias) {
        return snoMapper.getByAlias(alias);
    }


    public class Result {

        private int rtn = 0;
        private String idNo = "";
        private int curValue = 0;

        public Result(int rtn, String idNo, int curValue) {
            this.rtn = rtn;
            this.idNo = idNo;
            this.setCurValue(curValue);
        }


        public int getRtn() {
            return rtn;
        }

        public void setRtn(int rtn) {
            this.rtn = rtn;
        }

        public String getIdNo() {
            return idNo;
        }

        public void setIdNo(String idNo) {
            this.idNo = idNo;
        }

        public int getCurValue() {
            return curValue;
        }

        public void setCurValue(int curValue) {
            this.curValue = curValue;
        }
    }
}
