<%-- 
    Document   : insertDb
    Created on : Dec 22, 2016, 8:13:27 PM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html> 
    
    <head>
        <title>Insert User data</title>
    </head>
    <body>       
        <c:out value="${param.roleID}"/><br>
        <c:out value="${param.Username}" /><br>                
        <c:out value="${param.Fullname}" /><br>
        <c:out value="${param.Password1}" /><br>
        <c:out value="${param.Email}" /><br>
        <c:out value="${param.question1}" /><br>
        <c:out value="${param.answer1}" /><br>
        <c:out value="${param.question2}" /><br>
        <c:out value="${param.answer2}" /><br>
        <c:out value="${param.question3}" /><br>
        <c:out value="${param.answer3}" /><br>         
    </body>
</html>