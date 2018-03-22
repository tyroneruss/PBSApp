<%-- 
    Document   : InsertUser
    Created on : Nov 11, 2016, 11:58:57 AM
    Author     : tyron
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%   
    String Roleid  = (String)session.getAttribute( "theRoleID" ); 
    String UN  = (String)session.getAttribute( "theUsername" ); 
    String PWD = (String)session.getAttribute( "thePassword" ); 
    String FN  = (String)session.getAttribute( "theFullname" );   
    String EML = (String)session.getAttribute( "theEmail" );

    String Quest1 = request.getParameter( "question1" );
    String Quest2 = request.getParameter( "question2" );
    String Quest3 = request.getParameter( "question3" );

    String Ans1 = request.getParameter( "answer1" );
    String Ans2 = request.getParameter( "answer2" );
    String Ans3 = request.getParameter( "answer3" );
   
    
   
    try {
        
        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();

        String  strInsert = "INSERT INTO user (UserName,RoleID,Password,FullName,"
                        + "Email,Question1,Answer1,Question2,Answer2,"
                        + "Question3,Answer3,LastUpdate)"
                        + " VALUES ('" + UN + "'," + Roleid + ",'" +PWD + "','" +  FN + "','" 
                        + EML + "','" + Quest1 + "','" +  Ans1 + "','" + Quest2 + "','" 
                        + Ans2 + "','" + Quest3 + "','" 
                        + Ans3 + "',now())";

       // int resultset = statement.executeUpdate(strInsert);
       out.println(strInsert);
    // out.println(Query);
    // int SixMthMean = resultset.getInt(4);

       }catch(Exception ex){
           out.println("Issue found accessing database");
           response.sendRedirect("../erroorpages/DbErrorpage.jsp");
        }

    %>                                                     
    </head>
    <body>
        <% // response.sendRedirect("../login.jsp"); %>
    </body>
</html>
