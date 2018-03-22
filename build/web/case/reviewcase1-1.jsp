<%-- 
    Document   : Tyrone
    Created on : Nov 6, 2016
    Author  
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.management.Query"%>
<%@page import="com.sun.xml.registry.uddi.bindings_v2_2.Contact"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>

<% Class.forName("com.mysql.jdbc.Driver");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <title>Bankruptcy</title>
 
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
    
    String Chapter = request.getParameter( "chapter" );
    session.setAttribute("theChapter", Chapter);                           

    String Filingstate = request.getParameter( "filingstate" );
    session.setAttribute("theFilingstate",Filingstate );                           

    String Joint = request.getParameter( "joint" );
    session.setAttribute("theJoint", Joint);                           

    String Casenumber = request.getParameter( "casenumber" );
    session.setAttribute("theCaseNumber", Casenumber);                           

    String Assignto = request.getParameter( "assignto" );
    session.setAttribute("theAssignTo", Assignto); 

%> 
 
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
             <td align='center' width="520" style="font-family: Times New Roman;">
                 <font color="#2F4F4F" size="5">
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
            <tr><td>
            <table width="970" border="0" style="background-color: #a6a6a6">
                <tr>
                    <td width="150" height="35" align="center"  style="background-color: #737373">
                        <font  color="white" size="4" >
                        <a href="../main/dashboard.jsp" style="color: white;" ><b>Dashboard</b></a>
                        </font>
                    </td>
                    <td width="150" align="center" valign="center" >
                        <font  color="white" size="4" >
                        <a href="../case/allcases.jsp" style="color: white;" ><b>Manage Cases</b> </a>
                        </font>                    
                    </td>
                    <td  width="650" align="right" valign="center" >
                        <input type="text" name="search" value="" size="18"/>
                        <font  color="white" size="3" >
                        <a href="" style="text-decoration: none; color: white;" ><b>Search Clients</b>&nbsp; </a>
                        </font>                    
                    </td>
                </tr> 
            </table>
            </td>
            </tr> 
    </table>
    <table border="0" width="970" >               
        <tr>
            <td colspan="2" height="30" valign="center" align="center"
                 style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                 <font color="#2F4F4F" size="4">
                     <b>Review Debtor-1 Profile</b>
                 </font>
             </td>
             <td colspan="1"  style="background-color: aliceblue;" >
             </td>
        </tr>         
        <tr >
            <td width="55%"  style="background-color: white"> 
                <br>                
                
           <form name="DebtorForm1-1" METHOD=POST ACTION="db/newInsertDb.jsp">
           <table border="0" style="background-color: white">
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                        <td colspan="2" width="70%" align="left" colspan="2" height="25" style="font-family: Times New Roman; font-size: 20px">
                          <font  color="grey">
                                <b>Personal Info</b> 
                          </font>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input type="button" value="Edit" style="color: white; 
                                        border-radius: 15px;
                                        border-color: grey;
                                        height: 30px; width: 50px; 
                                        background-color: grey;" 
                                     onclick="window.location.href='editcase1-0.jsp'" />                    
                            </td>
                    </tr>
                    <tr >
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender: 
                      </td>
                      <td width="60%" height="25"  style="font-family: Times New Roman; font-size: 15px">                                                    
                         &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theGender") %>
                      </td>
                    </tr>
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name:
                     </td>
                      <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theFirstname") %>
                          &nbsp;<%= session.getAttribute("theMiddlename") %>
                          &nbsp;<%= session.getAttribute("theLastname") %>
                      </td> <!-- End first TD col -->  
                    </tr>                             
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:
                      </td>
                      <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theAddress1") %>
                      </td> <!-- End first TD col -->  
                    </tr>                             
<!--                    <tr>
                      <td width="5%" height="25" style="font-family: Times New Roman; font-size: 15px">

                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                          <% //= session.getAttribute("theAddress2") %>
                      </td>  End first TD col   
                    </tr>                             -->
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">

                      </td>
                      <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px" >
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theCity") %>,
                          &nbsp;<%= session.getAttribute("theState") %>
                          &nbsp;&nbsp;
                          <%= session.getAttribute("theZipcode") %>
                      </td> 
                    </tr>                             
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                         <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                            &nbsp;&nbsp;&nbsp;&nbsp; Cell Phone:
                         </td>
                         <td width="60%"  height="25" style="font-family: Times New Roman; font-size: 15px">
                            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theCellphone") %>
                         </td>
                     </tr>
                     <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                        <td width="30%" align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Work Phone: 
                        </td>
                         <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theWorkphone") %>
                         </td>
                     </tr>
                     <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                        <td width="30%" align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                           &nbsp; &nbsp;&nbsp;&nbsp;Home Phone:
                        </td>
                         <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                               &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theHomephone") %>
                         </td>
                     </tr>
                     <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                        <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Birthday:
                        </td>
                         <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                              &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theBirthdate") %>
                         </td>
                     </tr>
                     <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                        <td width="30%" align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:
                        </td>
                           <td width="06%" height="25" valign="top" style="font-family: Times New Roman; font-size: 15px">
                              &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theEmail") %>
                           </td> <!-- End first TD col -->  
                     </tr>                       
                </table>
                </td>                         
                <td width="45%" valign='top' align='center' style="background-color: white"> <!-- first TD col --> 
                    <br>
                      <table border="0" border style="border-color: #ffffff" >
                        <tr>
                            <td colspan="2" align="left" colspan="2" height="25" style="font-family: Times New Roman; font-size: 20px">
                                <font  color="grey">
                                    <b>Bankruptcy Info</b>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="button" value="Edit" style="color: white; 
                                        border-radius: 15px;
                                        border-color: grey;
                                        height: 30px; width: 50px; 
                                        background-color: grey;" 
                                     onclick="window.location.href='editcase1-0.jsp'" />                    
                                </font>
                            </td> 
                        </tr>
                         <tr>
                            <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp; Filing State:
                            </td>
                            <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                               &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Chapter &nbsp;<%= session.getAttribute("theFilingstate") %>
                            </td> <!-- End first TD col -->  
                        </tr>                             
                         <tr>
                            <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp; Bankruptcy Type:
                            </td>
                            <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                               &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Chapter &nbsp;<%= session.getAttribute("theChapter") %>
                            </td> <!-- End first TD col -->  
                        </tr>                             
                        <tr >
                          <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp;Joint filing:
                          </td>
                          <td width="60%" height="25"  style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theJoint") %>
                          </td>
                        </tr>
                     <tr>
                        <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Social security#:
                        </td>
                        <td width="60%" height="30" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theSSN") %>
                        </td> <!-- End first TD col -->  
                     </tr>
                        <tr >
                          <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp;Bankruptcy Case #:
                          </td>
                          <td width="60%" height="25"  style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= session.getAttribute("theCaseNumber") %>
                          </td>
                        </tr>
                      </table>  
                          <tr>
                            <td  width="10" height="30" style="background-color: white"> <!-- first TD col -->  

                            </td> <!-- End first TD col -->   
                          </tr>                    
                        </td> <!-- End first TD col -->   
                          </tr>
                      </table> 
                </td>
                </tr>
                <tr>
                    <td height="30" align="left" valign="center" style="background-color: aliceblue;" > 
                    </td>
                </tr>
                <tr>
                    <td height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
                            <input type="button" value="BACK" 
                        onclick="window.location.href='javascript:history.back()'" 
                            style="color: white;  font-weight: bold;
                            height: 30px; width: 100px; 
                            background-color: #737379;" />&nbsp;&nbsp;
                            
                            <input type="submit" value="CONTINUE" 
                            style="color: white;  font-weight: bold;
                            height: 30px; width: 100px; 
                            background-color: #737379;" />&nbsp;&nbsp;
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
</center>
</body>
</html>