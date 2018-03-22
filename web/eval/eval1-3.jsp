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
     String OwnRealEstate = request.getParameter( "OwnRealEstate" );
     session.setAttribute( "theOwnRealEstate", OwnRealEstate );

     String BehindPmtRealEstate = request.getParameter( "BehindPmtRealEstate" );
     session.setAttribute( "theBehindPmtRealEstate", BehindPmtRealEstate );

     String OwnVehical = request.getParameter( "OwnVehical" );
     session.setAttribute( "theOwnVehical", OwnVehical );

     String BehindPmtVehical = request.getParameter( "BehindPmtVehical" );
     session.setAttribute( "theBehindPmtVehical", BehindPmtVehical );

     String AssetOverThousand = request.getParameter( "AssetOverThousand" );
     session.setAttribute( "theAssetOverThousand", AssetOverThousand );

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
          <form name="EvalForm1-0" METHOD=POST ACTION="eval1-4.jsp">          
          <table border="0" width="860" style="background-color: white">
                <tr>
                    <td colspan="2"  height="40" align="left" style="font-family: Times New Roman; font-size: 15px" >
                             <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                What types of Income do you have? (select all that apply)</b>
                         </font>
                    </td>
                </tr>
                <tr>
                    <td colspan="1"  height="40" valign="center" align="left" width="40%">
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="EmpFullTime" value="On" />Employed, Full-time
                             <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="EmpPartTime" value="On" />Employed, Part-time
                             <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="SelfEmployed" value="On" />Self-employed  
                             <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="PensionRetire" value="On" />Pension / Retirement               
                         </font>
                    </td>
                    <td colspan="1"  height="40" valign="center" align="left" >
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="ChildSupportAlimony" value="On" />Child Support / Alimony                 
                               <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="SocialSecurity" value="On" />Social-Security
                               <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Farmer" value="On" />Farmer
                               <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="NoIncome" value="On" />No Income
                          </font>
                     </td>
                </tr>
                <tr>
                    <td valign="top" style="font-family: Times New Roman; font-size: 15px">
                        <br>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <font color="red">*</font><b>Estimate Total Monthly Income:</b></label>
                         <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <b>$</b>&nbsp;<input type="text" id="field" name="TotalIncome" size="10" Required />
                         <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If you are unsure about your monthly, 
                         <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;just provide your best estimate.                                          
                    </td>
                    <td valign="top" style="font-family: Times New Roman; font-size: 15px">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font color="red">*</font>Enter the number of people in</b> 
                         <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>your household:</b>;&nbsp;
                         <input type="text" name="NumPeopleHouseHold" size="5" Required />                         
                     </td>
                </tr>             
                <tr>
                    <td colspan="3" height="10" ></td>

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

                         