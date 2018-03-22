<%-- 
    Document   : TabTemplate
    Created on : Nov 6, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
  
  <title>PBS Dashboard</title>
  
    <script>
   
  </script>    
  <style>
      
  
  </style>

    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost:3306/pbsdb" 
         user="root"  password="rhouse11"/>

    <sql:query dataSource="${snapshot}" var="result">
        select DebtorID, FirstName,MiddleName,LastName
        from debtor, profile
        where debtor.ProfileID = profile.ProfileID
        Order by FirstName;    
    </sql:query>

</head>
<body style="background-color:  white">
<center>  
<table width="1040" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="840" style="background-color: white">
    <table border="0" width='875' style="background-color: lightgrey">
         <tr >
             <td valign='center' width='110' height="100" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="90" height="70" alt="logo-01"/>                 
             </td>   
             <td align='center' width="520" style="font-family: Times New Roman;">
                 <font color="#2F4F4F" size="5">
                 <b>People's Bankruptcy Software</b>
                 </font>
             </td>           
             <td valign="top" align="left" width="180" >
                <font  color="#2F4F4F" size="3" >
                <br><b>Logged in as:</b> <%= session.getAttribute("fullname") %>
                    <br><b>Role:</b> Manager&nbsp;&nbsp;
                    </font>
                <input type="button" value="Logout" style="color: white; 
                                        border-radius: 15px;
                                        border-color: lightgrey;
                                        height: 22px; width: 65px; 
                                        background-color: #1A2042;" 
                       onclick="window.location.href='../user/login.jsp'" />                    
              </td>        
         </tr>    
    </table>
    <br>
    <table width='870'>
    <tr><td>        
        <table border="0" width="870" style="background-color: lightgrey">  
            <tr>
            <table border="0" width="870" style="background-color: #a6a6a6">
                <tr>
                    <td width="150" height="35" align="center"  style="background-color: #737379">
                        <font  color="white" size="4" >
                            <b>Evaluation</a></b>
                        </font>
                    </td>
                    <td width="150" height="35" align="center" >
                        <font  color="white" size="4" >
                        <a href="../main/dashboard.jsp" style="color: white;" ><b>Dashboard</b></a>
                        </font>
                    </td>
                    <td width="150" align="center" valign="center" >

                    </td>
                    <td colspan="2" width="550" align="right" valign="center" >
                        <input type="text" name="search" value="" size="15"/>
                        <font  color="white" size="3" >
                            <a href="" style="text-decoration: none; color: white;" >Search Clients&nbsp; </a>
                        </font>                    
                    </td>
                </tr>                   
            </table>
            </tr> 
            <tr>
                <td colspan="2" height="30" align="center" valign="center" style="background-color: aliceblue;" >                     
                </td>
            </tr> 
            <tr >
                <td >      
          <form name="EvalForm1-0" METHOD=POST ACTION="eval1-1.jsp">          
          <table border="0" width="860" style="background-color: white">
                <tr>
                    <td colspan="4" height="30" align="center"  >
                        <font color="red" size="3" style="font-family: Times New Roman; font-size: 18px;" >
                          <%
                            String message=(String)session.getAttribute("eval1-0Message");
                            out.println(message);                                  
                           %>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" height="30" style="font-family: Times New Roman; font-size: 20px; ">                                                      
                        &nbsp;&nbsp;&nbsp;Please select the client to conduct evaluation:
                    </td
                </tr>
                <tr>
                    <td colspan="4" height="30" valign="top" style="font-family: Times New Roman; font-size: 20px; ">                                                      
                        &nbsp;&nbsp;&nbsp;<select name="Client"  style="line-height: 18px; font-size:16px"  >
                            <option>Select a Client</option>
                            <c:forEach var="row" items="${result.rows}">
                                <option>
                                    <c:out value="${row.FirstName}"/> <c:out value="${row.MiddleName}"/> <c:out value="${row.LastName}"/>
                                    <c:set var="DbID" value="${row.DebtorID}" scope="session" />
                                </option>
                            </c:forEach>
                        </select>
                    </td
                </tr>
                <tr>
                    <td colspan="4" height="30" style="font-family: Times New Roman; font-size: 20px; ">                                                      
                        &nbsp;&nbsp;&nbsp;If client is not found, Choose "Yes" to add new client:&nbsp;
                        <select name="AddClient" style="line-height: 18px; font-size:16px"  >
                            <option>No</option>
                            <option>Yes</option>
                        </select>

                        </b>
                    </td
                </tr>
                <tr>
                    <td colspan="4" height="40" style="font-family: Times New Roman; font-size: 15px; ">                                                      

                    </td
                </tr>
                 </table>                  
                    </td>                         
                </tr>           
                <tr>
                    <td height="50" align="left" valign="center" style="background-color: lightgrey;" >                     
                        &nbsp;&nbsp; <input type="submit" value="CONTINUE" 
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />

                       &nbsp;&nbsp; <input type="button" value="CANCEL" 
                            onclick="window.location.href='javascript:history.back()'" 
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />
                     </td>
                </tr>        
            </table>  
            </form>
    </td>                  
    </tr>           
    </table>        
    <div align="center">
        <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
    </div>
</td>
</tr>
<table>
</center>
</body>
</html>

                         