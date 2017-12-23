package com.action;

import com.model.Config;
import com.model.Group;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.service.ConfigService;
import com.service.SigninService;
import com.service.UserService;
import com.util.GetIPUtils;
import com.util.JudgeIPUtils;
import com.util.WeatherUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.SignatureException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class UserAction {
    private UserService userService = new UserService();
    private ConfigService configService = new ConfigService();
    private SigninService signinService = new SigninService();
    private int userID;
    private int studentNumber;
    private String name;
    private String password;
    private int issignintoday;
    private Group group;

    public ConfigService getConfigService() {
        return configService;
    }

    public void setConfigService(ConfigService configService) {
        this.configService = configService;
    }

    public SigninService getSigninService() {
        return signinService;
    }

    public void setSigninService(SigninService signinService) {
        this.signinService = signinService;
    }

    public int getIssignintoday() {
        return issignintoday;
    }

    public void setIssignintoday(int issignintoday) {
        this.issignintoday = issignintoday;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(int studentNumber) {
        this.studentNumber = studentNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
    //登录
    public String login() throws UnsupportedEncodingException, SignatureException, SQLException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = userService.login(studentNumber,password);
        if (user == null) {
            System.out.println("error");
            return "error";
        } else {
            int incsti = JudgeIPUtils.isincsti(request);
            session.setAttribute("user", user);
            System.out.println(user.getGroup().getGroup()+user.getName());
            return "success";
        }
    }
    //退出
    public String logout() throws Exception{
//        HttpServletRequest request = ServletActionContext.getRequest();
//        HttpSession session = request.getSession();
        ActionContext ac = ActionContext.getContext();
        Map session = ac.getSession();
        session.clear();
        return "loginout";
    }
    //判断IP以及是否在实验室(负责首页内容）
    public String judgeIP() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        if (session != null){
            ArrayList<User> users = signinService.selectDoYouSignin();
            ArrayList<User> studentOnDuty = new ArrayList<User>();
            ArrayList<Config> configs = configService.selectAllConfig();
            int systemRunningDay =  Integer.parseInt(configs.get(2).getValue());
            int studentOnDutyGroup = systemRunningDay%3;
            System.out.println(studentOnDutyGroup);
            for(int i = 0;i < users.size();i++)
            {
                if (studentOnDutyGroup == users.get(i).getSmallgroup()&&users.get(i).getStudentNumber()>=20170000){
                    studentOnDuty.add(users.get(i));
                }
            }
            request.setAttribute("studentOnDuty", studentOnDuty);
            request.setAttribute("systemRunningDay",configs.get(2).getValue());
            GetIPUtils ip = new GetIPUtils();
            String ipAddress = ip.getIpAddr(request);
            WeatherUtils weather = new WeatherUtils();
            String weatherinfo = weather.generateGetDiaryWeather(
                    ipAddress,
                    "zh-Hans",
                    "c",
                    "0",
                    "1"
            );
            System.out.println(ipAddress);
            int incsti = JudgeIPUtils.isincsti(request);

            request.setAttribute("incsti",incsti);
            request.setAttribute("ip",ipAddress);
            request.setAttribute("weatherinfo",weatherinfo);
            return "judgeipsuccess";
        }
        else {
            return "judgeiperror";
        }

    }
}
