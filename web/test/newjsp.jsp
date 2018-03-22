<%-- 
    Document   : newjsp
    Created on : Dec 22, 2016, 10:29:18 PM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
            <sql:update dataSource="${dbsource}" var="result">
                INSERT INTO product(UserName,FullName,Password,EmailAddress,Question1,
                                    Answer1,Question2,Answer2,Question3,Answer3) 
                            VALUES(?,?,?,?,?,?,?,?,?,?);
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
                <font size="5" color='green'> Congratulations ! Data inserted
                successfully.</font>

                <c:redirect url="../login.jsp" >
                    <c:param name="susMsg" value="Congratulations ! Data inserted
                successfully." />
                </c:redirect>
            </c:if> 
    </body>
</html>
