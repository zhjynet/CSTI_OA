package com.util;

import javax.servlet.http.HttpServletRequest;

public class JudgeIPUtils {
    public static int isincsti(HttpServletRequest request){
        String testip = "^192.168.[0-9]{1,3}.[0-9]{1,3}";
        String cstiIPbyEducation = "^10.10.28.[0-9]{1,3}";
        String cstiIPbyEducationNet= "^210.46.102.[0-9]{1,3}";
        String cstiIPbyChinaTelecom= "^219.147.166.[0-9]{1,3}";
        String cstiIPbyCMCC = "^111.40.7.[0-9]{1,3}";
        String cstiIPbyChinaUnicom = "^221.207.153.[0-9]{1,3}";
        int incsti = 0;
        GetIPUtils ip = new GetIPUtils();
        String ipAddress = ip.getIpAddr(request);
        if (ipAddress.matches(testip)
                || ipAddress.matches(cstiIPbyEducationNet)
                || ipAddress.matches(cstiIPbyEducation)
                || ipAddress.matches(cstiIPbyChinaTelecom)
                || ipAddress.matches(cstiIPbyCMCC)
                || ipAddress.matches(cstiIPbyChinaUnicom)){
            incsti = 1;
        }
         return incsti;
    }


}
