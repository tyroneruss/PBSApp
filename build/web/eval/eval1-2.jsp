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
    // Need session variable for --> client = request.getParameter( "Client" );    
     String Garnishment = request.getParameter( "Garnishment" );
     session.setAttribute( "theGarnishment", Garnishment );

     String IllnessDisability = request.getParameter( "IllnessDisability" );
     session.setAttribute( "theIllnessDisability", IllnessDisability );
     
     String CreditorHarassment = request.getParameter( "CreditorHarassment" );
     session.setAttribute( "theCreditorHarassment", CreditorHarassment );
     
     String Lawsuites = request.getParameter( "Lawsuites" );
     session.setAttribute( "theLawsuites", Lawsuites );

     String Repossesssion = request.getParameter( "Repossesssion" );
     session.setAttribute( "theRepossesssion", Repossesssion );

     String Divorce = request.getParameter( "Divorce" );
     session.setAttribute( "theDivorce", Divorce );

     String WhyForeclosure = request.getParameter( "WhyForeclosure" );
     session.setAttribute( "theWhyForeclosure", WhyForeclosure );

     String LossOfIncome = request.getParameter( "LossOfIncome" );
     session.setAttribute( "theLossOfIncome", LossOfIncome );

     String CreditCards = request.getParameter( "CreditCards" );
     session.setAttribute( "theCreditCards", CreditCards );

     String AutoLoans = request.getParameter( "AutoLoans" );
     session.setAttribute( "theDivorce", AutoLoans );

     String PersoneLoans = request.getParameter( "PersoneLoans" );
     session.setAttribute( "thePersoneLoans", PersoneLoans );

     String IncomeTaxes = request.getParameter( "IncomeTaxes" );
     session.setAttribute( "theIncomeTaxes", IncomeTaxes );

     String ChildSupport = request.getParameter( "ChildSupport" );
     session.setAttribute( "theChildSupport", ChildSupport );

     String PaydayLoans = request.getParameter( "PaydayLoans" );
     session.setAttribute( "thePaydayLoans", PaydayLoans );

     String BillsForeclosure = request.getParameter( "BillsForeclosure" );
     session.setAttribute( "theBillsForeclosure", BillsForeclosure );

     String MedicalBills = request.getParameter( "MedicalBills" );
     session.setAttribute( "theMedicalBills", MedicalBills );

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
          <form name="EvalForm1-0" METHOD=POST ACTION="eval1-3.jsp">          
          <table border="0" width="860" style="background-color: white">
                <tr>
                       <td colspan="3" height="40" style="font-family: Times New Roman; font-size: 15px">
                                &nbsp;&nbsp;&nbsp;<b>Assets and Payments (select Yes/No)</b><br>
                </tr>
                <tr>
                       <td colspan="1" style="font-family: Times New Roman; font-size: 15px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>Do you own Real-estate?
                       </td>
                       <td colspan="1" >
                                <input type="radio" name="rdoOwnRealEstate" value="Yes" />Yes
                                <input type="radio" name="rdoOwnRealEstate" value="No"  />No
                       </td>
                       <td colspan="1" width="200" >
                       </td>
                </tr>
                <tr>
                       <td colspan="1" style="font-family: Times New Roman; font-size: 15px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If yes, are you behind on payments?
                       </td>
                       <td colspan="1" >
                                <input type="radio" name="BehindPmtRealEstate" value="Yes" />Yes
                                <input type="radio" name="BehindPmtRealEstate" value="No" />No
                       </td>
                       <td colspan="1" width="200" >
                       </td>
                </tr>
                <tr>
                       <td colspan="1" style="font-family: Times New Roman; font-size: 15px">
                               &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<font color="red">*</font>Do you own a vehicle (car,truck,van,motorcycles)?
                       </td>
                       <td colspan="1" >
                                <input type="radio" name="OwnVehical" value="Yes" />Yes
                                <input type="radio" name="OwnVehical" value="No" />No
                       </td>
                       <td colspan="1" width="200" >
                       </td>
                </tr>
                <tr>
                        <td colspan="1" style="font-family: Times New Roman; font-size: 15px">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If yes, are you behind on payments?
                        </td>
                        <td colspan="1" >                   
                                 <input type="radio" name="BehindPmtVehical" value="Yes" />Yes
                                 <input type="radio" name="BehindPmtVehical" value="No" />No
                        </td>
                           <td colspan="1" width="200">
                        </td>
                </tr>
                <tr>
                    <td colspan="1" style="font-family: Times New Roman; font-size: 15px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>Do you own any other assets worth more than $1,000?
                    </td>
                    <td colspan="1" >                   
                             <input type="radio" name="AssetOverThousand" value="Yes" />Yes
                             <input type="radio" name="AssetOverThousand" value="No" />No
                    </td>
                    <td colspan="1" width="200" style="font-family: Times New Roman; font-size: 14px">
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

                         