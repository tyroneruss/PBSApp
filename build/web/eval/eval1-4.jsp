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
  
  <title>PBS Evaluation</title>
  
    <script>
   
  </script>    
  <style>

      div { 
      margin: 5px;
      padding: 5px; 
      border: 2px solid aliceblue; 
      width: 200px;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      }
      #selecttype {
          font-size:17px;
      }
      div > ul { display: none; }
      div:hover > ul {display: block; background: aliceblue; border-top: 2px solid lightgrey;}
      div:hover > ul > li { padding: 5px; border-bottom: 1px solid lightgrey;}
      div:hover > ul > li:hover { background: white;}
      div:hover > ul > li:hover > a { color: black; }         
  
  </style>
  <%

     String EmpFullTime = request.getParameter( "EmpFullTime" );
     session.setAttribute( "theEmpFullTime", EmpFullTime );

     String EmpPartTime = request.getParameter( "EmpPartTime" );
     session.setAttribute( "theEmpPartTime", EmpPartTime );
     
     String PensionRetire = request.getParameter( "PensionRetire" );
     session.setAttribute( "thePensionRetire", PensionRetire );
     
     String ChildSupportAlimony = request.getParameter( "ChildSupportAlimony" );
     session.setAttribute( "theChildSupportAlimony", ChildSupportAlimony );
     
     String SocialSecurity = request.getParameter( "SocialSecurity" );
     session.setAttribute( "theSocialSecurity", SocialSecurity );
     
     String NoIncome = request.getParameter( "NoIncome" );
     session.setAttribute( "theNoIncome", NoIncome );
 
     Float TotalIncomeValue = Float.parseFloat(request.getParameter( "TotalIncome" ));     
     int hhmembers = Integer.parseInt(request.getParameter( "NumPeopleHouseHold" ));


        try {
            String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
            Class.forName("com.mysql.jdbc.Driver").newInstance();            

            Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

            Statement statement = connection.createStatement();

            String  Query = "SELECT SixMonthTotal";
                    Query = Query + " FROM statemedian ";
                    Query = Query + " WHERE StateMedianID =" + hhmembers;

            ResultSet resultset = statement.executeQuery(Query);             
            
            if(resultset.next()) {
     %>

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
                       onclick="window.location.href='../user/logout.jsp'" />                    
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
                  <td colspan="4" height="70" valign="center" align="center" 
                      style="background-color: white; font-family: Times New Roman;">
                      <font color="#2F4F4F" size="4">
                      <%    Float SixMthMean = resultset.getFloat("SixMonthTotal");
                           if ( TotalIncomeValue <= SixMthMean ) {
                      %>
                            <b>Based on information entered the Debtor is <br>qualified to file Chapter 7</b>          
                      <%   }  else {  %>                   
                                 <b>Given the information entered the Debtor may not 
                                 be qualified <br>to file Chapter 7, therefore should consider filing Chapter 13</b>
                      <%   }  %>     
                          <br>
                          </font>
                      </td>
                 </tr>                            
                <%
                      }   
                    connection.close();
                }catch(Exception ex) {
                    out.println("Unable to connect to database." + ex);
                }
                %>
                 <tr >
                  <td colspan='3' style="background-color: white" align="center">
                     <div width="870" >
                        <font size="4" color="#1A2042"><b>Select Bankruptcy Type:</b></font>
                         <ul>
                             <li size="100" ><a id="selecttype" href="../main/dashboard.jsp" style="text-decoration: none; color: black;">Chapter 7</a></li>
                             <li><a id="selecttype" href="../main/dashboard.jsp" style="text-decoration: none; color: black;"> Chapter 11</a></li>
                             <li><a id="selecttype" href="../main/dashboard.jsp" style="text-decoration: none; color: black;"> Chapter 12</a></li>
                             <li><a id="selecttype" href="../main/dashboard.jsp" style="text-decoration: none; color: black;"> Chapter 13</a></li>
                         </ul>
                     </div>                        
                  </td>
                 </tr>
            </table>                  
                    </td>                         
                </tr>           
                <tr>
                    <td height="50" align="left" valign="center" style="background-color: lightgrey;" >                     
                        &nbsp;&nbsp; <input type="button" value="BACK" 
                            onclick="window.location.href='javascript:history.back()'" 
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
    <div width="850" align="center">
      <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font>
    </div>
</td>
</tr>
<table>
</center>
</body>
</html>

                         