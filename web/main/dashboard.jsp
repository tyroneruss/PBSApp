<%-- 
    Document   : TabTemplate
    Created on : Nov 6, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  
</head>
<body style="background-color:  white">
<center>  
<table width="1150" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="950" style="background-color: white">
    <table border="0" width='975' style="background-color: lightgrey">
         <tr >
             <td valign='center' width='120' height="120" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="110" height="100" alt="logo-01"/>                 
             </td>   
             <td align='center' width="520" style="font-family: Times New Roman; font-size: 28px">
                 <font color="#2F4F4F" >
                 <b>People's Bankruptcy Software</b>
                 </font>
             </td>           
             <td valign="top" align="left" width="180" >
                <font  color="#2F4F4F" size="3" >
                <br><b>Logged in as:</b> <%= session.getAttribute("fullname") %>
                    <br><b>Role:</b> <%= session.getAttribute("Type") %>&nbsp;&nbsp;
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
    <table width='970'>
    <tr><td>   
        <table border="0" width="970" style="background-color: lightgrey">  
            <tr>
            <table border="0" width="970" style="background-color: #a6a6a6">
                <tr>
                    <td width="135" height="35" align="center"   style="background-color: #737379; font-family: Times New Roman; font-size: 18px">
                        <font  color="white">
                        <b>Dashboard</b>
                        </font>
                    </td>
                    <td width="120" align="right" valign="center"  style="font-family: Times New Roman; font-size: 18px" >
                        <font  color="white"  >
                        <a href="../case/listAllcase1-1.jsp" style="color: white;" ><b>Manage Cases</b></a>
                        </font>                    
                    </td>
                    <td width="120" align="center" valign="center"  style="font-family: Times New Roman; font-size: 18px">
                        <font  color="white" >
                        <a href="../eval/eval1-0.jsp" style="color: white;" ><b>Evaluation</b></a>
                        </font>                    
                    </td>
                    <td colspan="2" width="470" align="right" valign="center" >
                        <input type="text" name="search" value="" size="15"/>
                        <font  color="white" size="3" >
                            <a href="" style="text-decoration: none; color: white;" >Search Clients&nbsp; </a>
                        </font>                    
                    </td>
                </tr>                   
            </table>
            </tr> 
            <tr>
                <td height="30" align="center" valign="center" style="background-color: aliceblue" >                     
                </td>
            </tr> 
            <tr >
                <td >      
                    <table border="0" width="950" style="background-color: white">  
                        <tr>
                            <td align="center"  width="15%" height='150' valign="top" style="background-color: white" >
                                <img src="../images/main/userpermission.png" alt="Admin"/>                                                      
                            </td>
                            <td align="left" width="25%"  valign="top" style="background-color: white" >
                                <font  color="#2F4F4F" size="2" >
                                    <b>Users & Permissions</b>
                                    <br><a href="./user/createlogin.jsp">Create User</a>
                                    <br><a href="">Change Password</a>
                                    <br>Total # of Users Active = 2
                                </font>
                            </td>
                            <td width="10%"  valign="top" style="background-color: white" >
                                <img src="../images/main/FileCabinet.png" alt="Cases"/>                                                      
                            </td>
                            <td width="23%" valign="top" style="background-color: white" >
                                <font  color="#2F4F4F" size="2" >
                                    <b>Case Management System</b>
                                    <br><a href="../case/newcase1-0.jsp">Create new case</a>
                                    <br><a href="../case/listmycase1-1.jsp">List My Cases</a>
                                    <br>Total # of Active Cases
                                </font>
                            </td>
                            <td width="10%" valign="top" style="background-color: white" >
                                <img src="../images/main/DocumentLibrary.png" alt="DL"/>                                                      
                            </td>
                            <td width="23%" valign="top" style="background-color: white" >
                                <font  color="#2F4F4F" size="2" >
                                    <b>Document Library System</b>
                                    <br>Bankruptcy Forms
                                    <br>Add new Forms
                                    <br>Add Bankruptcy Rules
                                </font>
                            </td>
                        </tr>          
                        <tr>
                            <td align="center" width="15%" height='150' valign="top" style="background-color: white" >
                                <img src="../images/main/billmoney.png" alt="Admin"/>                                                      
                            </td>
                            <td align="left" width="23%"  valign="top" style="background-color: white" >
                                <font  color="#2F4F4F" size="2" >
                                    <b>Billing</b>
                                    <br><a href="">View Receivables</a>
                                    <br><a href="">View Payables</a>
                                    <br>Total # of Active accounts = 2
                                </font>
                            </td>
                            <td align="center" width="10%"  valign="top" style="background-color: white" >
                                <img src="../images/main/calendar.png" alt="Admin"/>                                                                                                                                          
                            </td>
                            <td width="23%"  valign="top" style="background-color: white" >                                
                                <font  color="#2F4F4F" size="2" >
                                    <b>Tasks, Reminders</b>
                                    <br><a href="">Create Tasks/Reminders</a>
                                    <br>View Tasks/Reminders List
                                    <br>View Full Size Calendar
                                </font>
                            </td>
                            <td width="10%"  valign="top" style="background-color: white" >
                                <img src="../images/main/Automation.png" alt="Organization"/>                                                                                     
                            </td>
                            <td width="23%" valign="top" style="background-color: white" >
                                <font  color="#2F4F4F" size="2" >
                                    <b>Organization Settings</b>
                                    <br><a href="">Company Profile</a>
                                    <br><a href="">Services Offered</a>
                                    <br>
                                </font>
                           </td>
                        </tr>          
                        <tr>
                            <td colspan="6" width="15%" height='50' valign="top" style="background-color: white" >
                            </td>
                        </tr>          
                    </table>                  
                </td>                         
            </tr>           
            <tr>
                <td height="30" align="center" valign="center" style="background-color: lightgrey" >                     
                </td>
            </tr> 
    </table>    
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