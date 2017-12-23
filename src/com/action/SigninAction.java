package com.action;

import com.model.Signin;
import com.model.User;
import com.service.SigninService;
import com.util.GetIPUtils;
import com.util.JDBCUtil;
import com.util.JudgeIPUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class SigninAction {
    private SigninService signinService = new SigninService();
    private int id;
    private int userid;
    private Timestamp time;
    private String ip;
    private String ua;
    private String page;

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    private User user;

    public SigninService getSigninService() {
        return signinService;
    }

    public void setSigninService(SigninService signinService) {
        this.signinService = signinService;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUa() {
        return ua;
    }

    public void setUa(String ua) {
        this.ua = ua;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    //签到
    public String insertSignin() throws ServletException,IOException {
        Signin signin=new Signin();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        GetIPUtils ip = new GetIPUtils();
        String ipAddress = ip.getIpAddr(request);
        String userAgent = request.getHeader("user-agent");
        signin.setTime(new Timestamp(System.currentTimeMillis()));
        signin.setIp(ipAddress);
        signin.setUa(userAgent);
        User user = (User) request.getSession().getAttribute("user");
        int incsti = JudgeIPUtils.isincsti(request);
        signin.setUser(user);
        if(user.getIssignintoday()==0&&incsti==1){
            boolean signinresult = signinService.insertSignin(signin);
            if (signinresult == true){
                user.setIssignintoday(1);
                session.setAttribute("user", user);
                return "success_signin";
            }
            else return "error_signin";

        }else {
            return "error_signin";
        }

    }
    //显示所有签到
    public String selectAllSignin() throws ServletException, IOException, SQLException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        int pages=0;            //待显示页面
        int count=0;            //总条数
        int totalpages=0;        //总页数
        int limit=10;            //每页显示记录条数
        //计算记录总数的第二种办法：使用mysql的聚集函数count(*)
        ResultSet sqlRst = JDBCUtil.executeQuery("select count(*) from signin");
        if(sqlRst.next()){
            count = sqlRst.getInt(1);//结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值
        }
        //由记录总数除以每页记录数得出总页数
        totalpages = (int)Math.ceil(count/(limit*1.0));
        //获取跳页时传进来的当前页面参数

        //判断当前页面参数的合法性并处理非法页号（为空则显示第一页，小于0则显示第一页，大于总页数则显示最后一页）
        if (page == null) {
            pages = 1;
        } else {
            try{
                pages = java.lang.Integer.parseInt(page);
            }catch(Exception e){
                pages = 1;
            }

            if (pages < 1){
                pages = 1;
            }

            if (pages > totalpages){
                pages = totalpages;
            }
        }
        ArrayList<Signin> signins = signinService.selectAllSignin(pages,limit);
        request.setAttribute("pages",pages);
        request.setAttribute("totalpages",totalpages);
        request.setAttribute("signins", signins);
        return "selectsigninsuccess";
    }
    //显示签到情况汇总页面
    public String selectDoYouSignin() throws ServletException, IOException, SQLException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        ArrayList<User> users = signinService.selectDoYouSignin();
        request.setAttribute("usersSignin", users);
        return "selectDoYouSigninsuccess";
    }
}
