<%-- 
    Document   : Tyrone
    Created on : May 9, 2017
    Author  
--%>

<%@page import="java.sql.ResultSet"%>
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
      $(document).ready(function(){
        $(".tabbable").find(".tab").hide();
        $(".tabbable").find(".tab").first().show();
        $(".tabbable").find(".tabs li").first().find("a").addClass("active");
        $(".tabbable").find(".tabs").find("a").click(function(){
        tab = $(this).attr("href");
        $(".tabbable").find(".tab").hide();
        $(".tabbable").find(".tabs").find("a").removeClass("active");
        $(tab).show();
        $(this).addClass("active");
        return false;
        });
    });     

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

        <div class="tabbable">
            <ul class="tabs">
                <li><a href="#tab-1">Debtors</a></li>            
                <li><a href="#tab-2">Creditors</a></li>
                <li><a href="#tab-3">Income and Assets</a></li>
                <li><a href="#tab-4">Liability and Expenses</a></li>
                <li><a href="#tab-5">File Management</a></li>
                <li><a href="#tab-6">Case Management</a></li>
            </ul>           
                     
    <div id='tab-1' class="tab">   
    <%  

        Object userID = session.getAttribute("userid");
        Object roleID = session.getAttribute("roleid");

        String caseID = request.getParameter( "caseid" );

        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();

        String  Query = " SELECT FirstName,Middlename,LastName,Suffix,Street1,Street2,"
                        + " City,State,ZipCode,WorkPhone,MobilePhone,HomePhone,Email,FilingState,"
                        + " Age,Gender,SocialSecurityNo,DateOfBirth,CaseNumber,Chapter_filing,Joint"
                        + " FROM profile p, debtor d, cases c"
                        + " WHERE  d.`ProfileID` = p.`ProfileID` AND "
                        + "        c.Debtor1 = d.DebtorID AND "
                        + "        c.`CaseID` =" + caseID;
        
        ResultSet resultset = statement.executeQuery(Query);

        if(resultset.next()) {           

    %> 
  
    <table border="0" width="970" >               
        <tr>
            <td colspan="2" height="30" valign="center" align="center"
                 style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                 <font color="#2F4F4F" size="4">
                     <b>Debtor-1 Profile</b>
                 </font>
             </td>
             <td colspan="1"  style="background-color: aliceblue;" >
             </td>
        </tr>         
        <tr >
            <td width="55%"  style="background-color: white"> 
                <br>                
                
           <form name="CaseForm1-0" METHOD=POST ACTION="../creditor/creditorCase1-0.jsp">
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
                                     onclick="window.location.href='./editDebtorCMT1-0.jsp'" />                    
                            </td>
                    </tr>
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender: 
                      </td>
                      <td width="60%" height="25"  style="font-family: Times New Roman; font-size: 15px">                                                    
                         &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= resultset.getString("Gender")%>
                      </td>
                    </tr>
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name:
                     </td>
                      <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                          <%= resultset.getString("FirstName")%>
                          &nbsp;<%= resultset.getString("MiddleName")%>
                          &nbsp;<%= resultset.getString("LastName")%>
                      </td> <!-- End first TD col -->  
                    </tr>                             
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:
                      </td>
                      <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= resultset.getString("Street1") %>
                          &nbsp;<%= resultset.getString("Street2") %>
                      </td> <!-- End first TD col -->  
                    </tr>                    
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                      <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                  
                     </td>
                      <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                          <%= resultset.getString("City")%>
                          &nbsp;<%= resultset.getString("state")%>
                          &nbsp;<%= resultset.getString("ZipCode")%>
                      </td> <!-- End first TD col -->  
                    </tr>                             
                    <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                         <td width="30%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                            &nbsp;&nbsp;&nbsp;&nbsp; Mobile Phone:
                         </td>
                         <td width="60%"  height="25" style="font-family: Times New Roman; font-size: 15px">
                            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <%= resultset.getString("MobilePhone") %>
                         </td>
                     </tr>
                     <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                        <td width="30%" align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Work Phone: 
                        </td>
                         <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= resultset.getString("WorkPhone") %>
                         </td>
                     </tr>
                     <tr>
                      <td width="10%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                         
                      </td>
                        <td width="30%" align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                           &nbsp; &nbsp;&nbsp;&nbsp;Home Phone:
                        </td>
                         <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                               &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= resultset.getString("HomePhone") %>
                         </td>
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
                             &nbsp;&nbsp;&nbsp;&nbsp;Bankruptcy Type:
                            </td>
                            <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px">
                               &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Chapter &nbsp;
                               <%= resultset.getString("Chapter_filing") %>
                            </td> <!-- End first TD col -->  
                        </tr>                             
                        <tr >
                          <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp;Joint filing:
                          </td>
                          <td width="60%" height="25"  style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                             <%= resultset.getString("Joint") %>
                          </td>
                        </tr>
                     <tr>
                        <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp;Social security#:
                        </td>
                        <td width="60%" height="30" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                          <%= resultset.getString("SocialSecurityNo") %>
                        </td> <!-- End first TD col -->  
                     </tr>
                        <tr >
                          <td width="40%"  align="left" height="25" style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp;&nbsp;Bankruptcy Case #:
                          </td>
                          <td width="60%" height="25"  style="font-family: Times New Roman; font-size: 15px">
                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                          <%= resultset.getString("CaseNumber") %>
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
</div>
<% } %>                          
<div align="center">
    <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
</div>
</center>
</body>
</html>