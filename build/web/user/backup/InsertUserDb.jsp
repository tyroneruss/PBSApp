<%-- 
    Document   : InsertUser
    Created on : Nov 11, 2016, 11:58:57 AM
    Author     : tyron
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%   
    String UN  = (String)session.getAttribute( "theUserName" ); 
    String PWD = (String)session.getAttribute( "thePassWord" ); 
    String FN  = (String)session.getAttribute( "theFullName" );   
    String EML = (String)session.getAttribute( "theEmailAddress" );

    String Quest1 = request.getParameter( "Question1" );
    String Quest2 = request.getParameter( "Question2" );
    String Quest3 = request.getParameter( "Question3" );

    String Ans1 = request.getParameter( "Answer1" );
    String Ans2 = request.getParameter( "Answer2" );
    String Ans3 = request.getParameter( "Answer3" );
   
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();

        String  Query = "INSERT INTO user (UserName,Password,FullName,"
                        + "EmailAddress,Question1,Answer1,Question2,Answer2,"
                        + "Question3,Answer3,LastUpdate)"
                        + " VALUES ('" + UN + "','" +  PWD + "','" +  FN + "','" 
                        + Quest1 + "','" +  Ans1 + "','" + Quest2 + "','" 
                        + Ans2 + "','" + Quest3 + "','" 
                        + Ans3 + "',now())";

        int resultset = statement.executeUpdate(Query);
        out.println("Test");
    // int SixMthMean = resultset.getInt(4);

       }catch(Exception ex){
           out.println("Issue found accessing database");
           // response.sendRedirect("../erroorpages/DbErrorpage.jsp");
        }

    %>                                                     
    </head>
    <body>
        <% response.sendRedirect("./home/index.html"); %>
    </body>
</html>
