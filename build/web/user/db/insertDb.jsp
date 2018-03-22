<%-- 
    Document   : insertDb
    Created on : Dec 22, 2016, 8:13:27 PM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/pbsdb" 
                user="root"  password="rhouse11"/>
    <head>
        <title>Insert User data</title>
    </head>
    <body>       
            <sql:update dataSource="${snapshot}" var="result">
                INSERT INTO user(RoleID,UserName,FullName,Password,EmailAddress,Question1,
                                    Answer1,Question2,Answer2,Question3,Answer3) 
                            VALUES(?,?,?,?,?,?,?,?,?,?,?);
                <sql:param value="${param.roleID}"/>
                <sql:param value="${param.Username}" />                
                <sql:param value="${param.Fullname}" />
                <sql:param value="${param.Password1}" />
                <sql:param value="${param.Email}" />
                <sql:param value="${param.question1}" />
                <sql:param value="${param.answer1}" />
                <sql:param value="${param.question2}" />
                <sql:param value="${param.answer2}" />
                <sql:param value="${param.question3}" />
                <sql:param value="${param.answer3}" />
            </sql:update>
                        
            <c:if test="${result>=1}">
              <c:redirect url="../../main/dashboard.jsp" >
                    <c:param name="susMsg" value="Congratulations ! Data inserted successfully." />                  
                </c:redirect>
            </c:if> 
         
    </body>
</html>