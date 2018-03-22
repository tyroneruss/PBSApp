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
     
            String UN = request.getParameter( "username" );     
            String PWD = request.getParameter( "password" );
 
        try {
            
            String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
            Class.forName("com.mysql.jdbc.Driver").newInstance();            

            Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

            Statement statement = connection.createStatement();

            String  Query = "SELECT UserID, RoleID, FullName FROM user "
                            + " WHERE UserName ='" + UN + "' AND Password='"
                            + PWD + "'";

            ResultSet resultset = statement.executeQuery(Query);
            
            // out.println(resultset);
            if (resultset.next()) { 
                // out.println("Pass");
                
               int roleid = resultset.getInt("RoleID");
               int userid = resultset.getInt("UserID");
               String fullname = resultset.getString("FullName");
                
               session.setAttribute("userid", userid);
               session.setAttribute("roleid", roleid);
               session.setAttribute("fullname", fullname);
               
               String filepath = "../main/dashboard.jsp";
               response.sendRedirect(filepath); 
            }
            else {
                // out.println("Fail");
                session.setAttribute( "Message", "Password or User Email is invalid, please try again...");
                response.sendRedirect("login_error.jsp");
            }
        }catch(Exception ex){
               out.println("Unable to access database");
             request.setAttribute("Message", "Database down, please try again later...");
             // response.sendRedirect("login.jsp");
        }

    %>                                                     
    </head>
    <body>

    </body>
</html>
