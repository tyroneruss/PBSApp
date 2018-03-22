<%-- 
    Document   : newjsp
    Created on : Jan 19, 2017, 12:36:10 AM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Tag Example</title>
</head>
    <body>
        <c:set var="salary" scope="session" value="${2000*2}"/>
        <c:if test="${salary > 2000}">
           <p>My salary is: <c:out value="${salary}"/><p>
        </c:if>
    </body>
</html>