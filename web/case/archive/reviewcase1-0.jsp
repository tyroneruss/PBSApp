<%-- 
    JSP Page   : Debtor 
    Created on : Dec 23, 2016
    Author     : Tyrone Russ
--%>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <title>Bankruptcy - New Case</title>
  
  <script>
 
  </script>    
  
  <style>
  #logoutbutton {
      height:25px; width: 65px; 
      color: #ffffff; font-size: 12px;
      background-color: #09092a; 
      border: 5px solid #09092a;        
      -moz-border-radius: 15px;
      -webkit-border-radius: 15px;  
      }   
  </style>
  
<%  
    String Address1 = request.getParameter( "address1" );
    session.setAttribute("theAddress1", Address1);                           

    String Address2 = request.getParameter( "address2" );
    session.setAttribute("theAddress2", Address2);                           

    String City = request.getParameter( "city" );
    session.setAttribute("theCity", City);                           

    String State = request.getParameter( "state" );
    session.setAttribute("theState", State);     
    
    String Zipcode = request.getParameter( "zipcode" );
    session.setAttribute("theZipcode", Zipcode);                           

    String Workphone = request.getParameter( "workphone" );
    session.setAttribute("theWorkphone", Workphone);  
    
    String Homephone = request.getParameter( "homephone" );
    session.setAttribute("theHomephone", Homephone);     

    String Mobilephone = request.getParameter( "mobilephone" );
    session.setAttribute("theMobilephone", Mobilephone);
    
    String Birthdate = request.getParameter( "birthdate" );
    session.setAttribute("theBirthdate", Birthdate);
    
    String Socialsecurityno = request.getParameter( "socialsecurityno" );
    session.setAttribute("theSSN", Socialsecurityno);
    
    String Email = request.getParameter( "email" );
    session.setAttribute("theEmail", Email);   
%> 
  
</head>
<body style="background-color:  white">
<center>  
<table width=1100" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="900" style="background-color: white">
    <table border="0" width='920' style="background-color: lightgrey">
         <tr >
             <td valign='center' width='120' height="105" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="95" height="72" alt="logo-01"/>                 
             </td>   
             <td align='center' width="665" style="font-family: Times New Roman;">
                 <font color="#2F4F4F" size="5">
                 <b>People's Bankruptcy Software</b>
                 </font>
             </td>           
             <td valign="top" align="left" width="230" >
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
    <table width='910'>
    <tr><td>        
        <table border="0" width="910" style="background-color: lightgrey">  
            <tr><td>
            <table border="0" style="background-color: #a6a6a6">
                <tr>
                    <td width="165" height="35" align="center"  style="background-color: #737379">
                        <font  color="white" size="4" >
                        <b>Review Debtor's Profile</b></a>
                        </font>
                    </td>
                    <td width="165" align="center" valign="center" >
                        <font  color="white" size="4" >
                        <a href="../main/dashboard.jsp" style="color: white;" ><b>Dashboard</b> </a>
                        </font>                    
                    </td>
                    <td width="280" align="center" valign="center" >

                    </td>
                    <td colspan="2" width="300" align="right" valign="center" >
                        <input type="text" name="search" value="" size="15"/>
                        <font  color="white" size="3" >
                            <a href="" style="text-decoration: none; color: white;" >Search Clients&nbsp; </a>
                        </font>                    
                    </td>
                </tr> 
            </table>
            </td>
            </tr> 
    </table>
    <table border="0" width="900" >         
        <tr >
            <td >      
            <form name="DebtorForm1-1" METHOD=POST ACTION="reviewcase1.0.jsp">          
            <table border="0" width="900" style="background-color: white">
                <tr>
                    <td colspan="1" height="30" valign="center" align="center"
                         style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                         <font color="#2F4F4F" size="3">
                             <b>Review Debtor-1 Profile</b>
                         </font>
                     </td>
                     <td colspan="3"  style="background-color: aliceblue;" >
                     </td>
                </tr> 
                <tr> <!-- first TR row --> 
                <td width="57%" > <!-- first TD col -->  
                    <!-- Profile table --> 
                   <table border="0">
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                             <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                 <br>
                                Name:  
                             </td>
                             <td width="65%" height="25">
                                     <%= session.getAttribute("theFirstname") %> 
                                     &nbsp;&nbsp;<%= session.getAttribute("theMiddlename") %> 
                                     &nbsp;&nbsp;<%= session.getAttribute("TheLastname") %> 
                             </td> <!-- End first TD col -->  
                       </tr> 
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                          <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                               Address:
                          </td>
                         <td width="65%Address:" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                     <%= session.getAttribute("theAddress1") %> 
                          </td> <!-- End first TD col -->  
                       </tr>
                       
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                          <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                               Address 2:
                          </td>
                         <td width="65%" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                     <%= session.getAttribute("theAddress2") %> 
                          </td> <!-- End first TD col -->  
                       </tr>
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                           <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                 City:
                           </td>
                           <td width="65%" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                 <%= session.getAttribute("theCity") %> 
                           </td>
                       </tr>  
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                           <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                 State: <%= session.getAttribute("theState") %>  
                           </td>
                           <td width="65%" height="25" style="font-family: Times New Roman; font-size: 14px">                                
                                 &nbsp;&nbsp;Zip code: <%= session.getAttribute("theZipcode") %>
                                 
                           </td> <!-- End first TD col -->  
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                             Work Phone:
                         </td>
                         <td width="65%" height="25">
                             <%= session.getAttribute("theWorkphone") %>
\                         </td>
                     </tr>
                     <tr>
                         <td width="5%" height="25" style="font-family: Times New Roman; font-size: 14px">
                         </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                            Mobile Phone<font color="red">*</font>
                         </td>
                         <td width="65%" height="25">
                             <%= session.getAttribute("theMobilephone") %>
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                             Home Phone:
                         </td>
                         <td width="65%" height="25">
                             <%= session.getAttribute("theHomephone") %>
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                            Birthday<font color="red">*</font>
                         </td>
                         <td width="65%" height="25">
                             <%= session.getAttribute("theBirthdate") %>
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                           <td width="30%" height="30" style="font-family: Times New Roman; font-size: 14px">
                             Social Security #<font color="red">*</font>
                           </td>
                           <td width="65%" height="25">
                             <%= session.getAttribute("theSSN") %>
                           </td> <!-- End first TD col -->  
                       </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                           <td width="30%" height="35" valign="top" style="font-family: Times New Roman; font-size: 14px">
                             Email<font color="red">*</font>
                           </td>
                           <td width="65%" height="25"  valign="top" >
                             <%= session.getAttribute("theEmail") %>
                           </td> <!-- End first TD col -->  
                       </tr>
                   </table>
                </td>
                <td width="43%" valign='top' align='center' style="background-color: white"> <!-- first TD col --> 
                    <br>
                      <table border="0" border style="border-color: #ffffff; height: 100px; background: #778899; border:5px;-moz-border-radius:10px;-webkit-border-radius:10px;" >
                          <tr>
                            <td colspan="2" align="center" height="30"  width="250" > <!-- first TD col -->  
                                <font color="white" ><b>Progress with this case...&nbsp;&nbsp;</b></font>
                            </td> <!-- End first TD col -->  
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                   <img src="../images/nav/GreenChkArrow.jpg" width="25" height="25" alt="chkArrow-01"/>
                            </td> <!-- End first TD col -->   
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Evaluation completed  
                            </td> <!-- End first TD col -->   
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white" > <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td> <!-- End first TD col -->   
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Adding Debtor(s) profile
                            </td> <!-- End first TD col -->   
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white" > <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td> <!-- End first TD col -->   
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Entering Creditors
                            </td>
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td>
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Entering Assets and Income
                            </td>
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td> 
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Entering Liability and Expenses
                            </td>  
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td> 
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Filing Petition
                            </td>  
                          </tr>
                      </table>  
                </td>
                </tr>
            </table>    
                <tr>
                    <td height="30" align="left" valign="center" style="background-color: aliceblue;" > 
                    </td>
                </tr>
                <tr>
                    <td colspan="1" height="40" align="left" valign="center" style="background-color: lightgrey" >                     
                            &nbsp;&nbsp; <input type="button" value="BACK" onclick="window.location.href='javascript:history.back()'" 
                            style="color: white; 
                            height: 30px; width: 80px; 
                            background-color: #737379;" />
                            &nbsp;&nbsp; <input type="submit" value="CONTINUE"  
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />
                     </td>
                </tr>        
            </td>                         
        </tr>           
    </table>    
</td>
</tr>
</table>
<div align="center">
    <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
</div>
</center>
</body>
</html>