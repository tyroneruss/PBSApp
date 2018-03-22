<%-- 
    Document   : TabTemplate
    Created on : Nov 6, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<%
    
    String value = request.getParameter( "AddClient" ); 
    String client = request.getParameter( "Client" ); 

    boolean test = false; 

    if(value == "Yes") {      
        test = true; 
    }
    
    if(test) {      
        session.setAttribute("eval1-0Message", "Please select a client or choose Yes to create new Client."); //session is set
        // request.setAttribute("EvalMessage", "Please select client or choose Yes to create new Client.");      
        response.sendRedirect("eval1-0_error.jsp");        
    }
    
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
                    <td width="150" align="center" valign="center" >
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
          <table border="0" width="860" style="background-color: white">
            <tr>
                <td colspan="4" height="40" style="font-family: Times New Roman; font-size: 15px; ">                                                      
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <b>Client:</b>&nbsp;          
                    <%                      
                      out.println(client);
                    %>
                </td
            </tr>
          <form name="EvalForm1-0" METHOD=POST ACTION="eval1-2.jsp">          
            <tr>
                <td colspan="2" style="font-family: Times New Roman; font-size: 15px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Why are you applying for bankruptcy? 
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    (select all that apply)</b>
                </td>
                <td colspan="2" align="left" style="font-family: Times New Roman; font-size: 15px;">
                        <b>What bills do you have? 
                       <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(select all that apply)</b>
                </td>
            </tr>
            <tr>
                <td >
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Garnishment" value="On"/>Garnishment
                         <br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="IllnessDisability" value="On"/>Illness Disability
                         <br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="CreditorHarassment" value="On" />Creditor Harassment
                         <br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Lawsuits" value="On" />Lawsuits
                </td>
                <td >
                         <input type="checkbox" name="Repossesssion" value="On" />Repossession
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                         <input type="checkbox" name="Divorce" value="On" />Divorce
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                         <input type="checkbox" name="Foreclosure" value="On" />Foreclosure
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                         <input type="checkbox" name="LossOfIncome" value="On" />Loss of Income
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td >
                         <input type="checkbox" name="CreditCards" value="On" />Credit Cards
                         <br><input type="checkbox" name="AutoLoans" value="On" />Auto Loans
                         <br><input type="checkbox" name="PersonalLoans" value="On" />Personal Loans
                         <br><input type="checkbox" name="IncomeTaxes" value="On" />Income Taxes
                </td>
                <td >
                         <input type="checkbox" name="ChildSupport" value="On" />Child Support
                         <br><input type="checkbox" name="PaydayLoans" value="On" />Payday Loans
                         <br><input type="checkbox" name="WhyForeclosure" value="On" value="On" />Foreclosure
                         <br><input type="checkbox" name="MedicalBills" value="On" />Medical Bills
                         <br>
                 </td>
             </tr>
             <tr>
                 <td colspan="4" height="30">
                     
                 </td>
             </tr>
             </table>                  
                </td>                         
            </tr>           
            <tr>
                <td height="50" align="left" valign="center" style="background-color: lightgrey;" >                     
                    <input type="submit" value="CONTINUE" 
                        style="color: white; 
                        height: 30px; width: 100px; 
                        background-color: #737379;" />

                   &nbsp;&nbsp; <input type="button" value="BACK" 
                        onclick="window.location.href='javascript:history.back()'" 
                        style="color: white; 
                        height: 30px; width: 100px; 
                        background-color: #737379;" />
                   &nbsp;&nbsp; <input type="button" value="CANCEL" 
                        onclick="window.location.href='../main/dashboard.jsp'" 
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

                         