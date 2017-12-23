package com.listener;

import com.util.JDBCUtil;

import java.util.TimerTask;
import java.util.logging.Logger;

public class NFDFlightDataTimerTask extends TimerTask {

    private static Logger log = Logger.getLogger(String.valueOf(NFDFlightDataTimerTask.class));

    @Override
    public void run() {
        try {
            String running_time_change = "update configs set value = value+1 where name = \"running_time\"";
            String sqlchange = "update users set issignintoday = 0";
            int updateRunning_time_change = JDBCUtil.executeUpdate(running_time_change);
            int updateResultChange = JDBCUtil.executeUpdate(sqlchange);
            System.out.println(updateResultChange);

        } catch (Exception e) {
            log.info("-------------解析信息发生异常--------------");
        }
    }
}