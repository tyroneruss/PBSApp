<%-- 
    Document   : InsertDebtorDb
    Created on : Nov 5, 2016, 6:31:25 AM
    Author     : tyron
--%>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%
     
            String UN  = request.getParameter( "username" );     
            String PWD = request.getParameter( "password" );
                      
            
        try {
            
            String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
            Class.forName("com.mysql.jdbc.Driver").newInstance();            

            Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

            Statement statement = connection.createStatement();

            String  Query = "SELECT UserID, RoleID, FullName FROM user "
                            + " WHERE UserName='" + UN + "' and Password='" + PWD + "'" ;

            ResultSet resultset = statement.executeQuery(Query);
              
            boolean test = resultset.next();
            
            //  out.println(Query);
            //  out.println(test);
            
            if (test) { 
               //out.println("Pass password lookup ");

               int role_id = resultset.getInt("RoleID");
               int user_id = resultset.getInt("UserID");
               String full_name = resultset.getString("FullName");
                
               session.setAttribute("userid", user_id);
               session.setAttribute("fullname", full_name);
               
               String  Query2 = "SELECT Type, AccessLevel FROM role "
                            + " WHERE RoleID =" + role_id;
               
               ResultSet resultset2 = statement.executeQuery(Query2);
               resultset2.next();
               out.println(Query2);
           
               
               
               int accesslevel =  resultset2.getInt("AccessLevel");
               String roleType =  resultset2.getString("Type");
               
               session.setAttribute("userid", user_id);
               session.setAttribute("fullname", full_name);
               session.setAttribute("Type", roleType);
               session.setAttribute("Accesslevel", accesslevel);
               
               out.println(roleType);               
               out.println(accesslevel);               
               response.sendRedirect("../main/dashboard.jsp"); 
            }
            else 
            {
                out.println(UN + " - " + PWD);
                out.println("Fail");
                session.setAttribute( "loginMessage", "Password or Username is invalid, please try again...");
                response.sendRedirect("login_error.jsp");
            }
        }catch(Exception ex){
               out.println("Unable to access database");
               request.setAttribute("loginMessage", "Database down, please try again later...");
               response.sendRedirect("login_error.jsp");
        }
    %>                                                     
    </head>
    <body>

    </body>
</html>
