<%-- 
    Document   : TabTemplate
    Created on : Nov 6, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <title>PBS Create User</title>
  
    <script>
  
  </script>    
  <style>
      
  </style>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

</head>

<body style="background-color:  white">
    
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost:3306/pbsdb" 
         user="root"  password="rhouse11"/>

    <sql:query dataSource="${snapshot}" var="result">
        select RoleID, Type
        from role
        Order by RoleID;    
    </sql:query>

<center>  
<table width="1000" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="820" style="background-color: aliceblue">
    <table border="0" width='820' style="background-color: lightgrey">
         <tr>
             <td valign='center' width='125' height="120" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="107" height="90" alt="logo-01"/>                 
             </td>        
             <td align='center' width="675" style="font-family: Times New Roman; font-size: 28px">
                 <font color="#2F4F4F">
                    <b>People's Bankruptcy Software</b>
                 </font>
             </td>              
         </tr>    
    </table>
    <br>
    <table width='820'>
    <tr><td>        
        <table border="0" width="820" style="background-color: lightgrey">  
            <tr>
            <table border="0" width="820" style="background-color: #a6a6a6">
                <tr>
                    <td width="150" height="35" align="center"  style="background-color: #737379">
                        <font  color="white" size="5" >
                                Create User Account</b>
                        </font>
                    </td>
                </tr>                   
            </table>
            </tr> 
            <tr >
                <Form Name="loginform" Method="POST"  Action="userquestions.jsp" >
                <td style="background-color: lightgrey;" align="center" vlign="center" height="300">      
                               <table border="0" width="560" height="300" style="background-color: white">  
                                    <tr>
                                        <td colspan="2" align="center" height="40" valign="center" style="font-family: Times New Roman; font-size: 20px;"  >
                                            <font color="black">
                                            Fields marked with a red asterisk (<font color="red">*</font>) are required
                                            </font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" align="right" height="40" valign="center" style="font-family: Times New Roman; font-size: 18px">
                                            <font color="red">*</font>
                                            <font color="black">Full name:&nbsp;</font>
                                        </td>
                                        <td width="60"  align="left" valign="center" >
                                            <input type="text" name="fullname" value="" size="30" Required style="line-height: 20px; font-size:18px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" align="right" height="40" valign="center" style="font-family: Times New Roman; font-size: 18px">
                                            <font color="red">*</font>
                                            <font color="black">User name:&nbsp;</font>
                                        </td>
                                        <td width="65%"  align="left" valign="center" >
                                            <input type="text" name="username" value="" size="30" Required style="line-height: 20px; font-size:18px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%" align="right" height="40" valign="center" style="font-family: Times New Roman; font-size: 18px">
                                            <font color="red">*</font>
                                            <font color="black">Email:&nbsp;&nbsp;</font>
                                        </td>
                                        <td width="65%"  align="left" valign="center" >
                                            <input type="text" name="email" value="" size="30" Required style="line-height: 20px; font-size:18px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%"  align="right" height="40" valign="center" style="font-family: Times New Roman; font-size: 18px" >
                                            <font color="red">*</font>
                                            <font color="black">Password:&nbsp;&nbsp;</font>
                                        </td>
                                        <td width="65%"  align="left" valign="center" style="font-family: helvetica; font-size: 18px"  >
                                            <input type="password" name="password1" value="" size="30" Required  style="line-height: 20px; font-size:18px" /><br>                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%"  align="right" height="40" valign="center" style="font-family: Times New Roman; font-size: 18px" >
                          
                                         <font color="red">*</font><font color="black">Confirm Password:&nbsp;&nbsp;</font>
                                        </td>
                                        <td width="65%"  align="left" valign="center" style="font-family: helvetica; font-size: 18px"  >
                                            <input type="password" name="password2" value="" size="30" Required  style="line-height: 20px; font-size:18px" /><br>                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="35%"  align="right" height="40" valign="center" style="font-family: Times New Roman; font-size: 18px" >
                                            <font color="red">*</font>
                                            <font color="black">Employee Role:&nbsp;&nbsp;</font>
                                        </td>
                                        <td width="65%"  align="left" valign="center" style="font-family:  Times New Roman; font-size: 18px"  >
                                                <select name="roleid"   style="line-height: 18px; font-size:16px" >
                                                <option>--- Select a Role ---</option>
                                                <c:forEach var="row" items="${result.rows}">
                                                    <option value="${row.RoleID}">
                                                        <c:out value="${row.Type}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <br>
                                        </td>
                                    </tr>
                               </table>         
                            </td>
                        </tr>
                        <tr >
                              <td colspan='2' height="45" align="center" style="background-color: #737379;">
                                    <input type="submit" value="CONTINUE" 
                                        style="color: white; 
                                        height: 30px; width: 130px; 
                                        background-color: #737379;" />
                                    
                                    <input type="button" value="CANCEL" 
                                        onclick="window.location.href='javascript:history.back()'" 
                                        style="color: white; 
                                        height: 30px; width: 130px; 
                                        background-color: #737379;" />
                              </td>
                        </tr>        
                </form>
                </table>  
                </td>
            </tr> 
            <tr >
                  <td colspan='3' height="40" style="background-color: lightgrey;">
                  </td>
            </tr>        
       </table>    
    </td>                  
    </tr>           
    </table>        
    <div align="center">
        <p > <font size="3" color="black"><b>2009 &copy; by RussWare, Inc | Privacy Policy</b></font></p>
    </div>
</td>
</tr>
<table>
</center>
</body>
</html>