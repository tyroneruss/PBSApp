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
    <table border="0" width='850' style="background-color: lightgrey">
         <tr >
             <td valign='center' align='left' height="80" width="20%" style="background-color: lightgrey">
                 &nbsp;&nbsp;<img src="../images/main/PBSLogo1.0.jpg" id="pbslogo"  alt="PBS Logo"/>
             </td>        
             <td align='center' width="57%" style="font-family: Times New Roman; font-size: 20px">
                 <font color="#2F4F4F">
                 <b>Chapter 7 Bankruptcy</b>
                 </font>
             </td>        
             <td valign="top" align="left" width="23%" >
                <font  color="#2F4F4F" size="1" >
                <b>Logged in as: <%= session.getAttribute("fullname") %>
                <br>Role: Client Manager&nbsp;&nbsp;
                 </font>
                <input type="button" id="logoutbutton" value="Logout"  
                       onclick="window.location.href='../user/logout.jsp'" />                    
              </td>        
         </tr>    
    </table>
    <br>
    <table width='850'>
    <tr><td>        
        <table border="0" width="850" style="background-color: lightgrey">  
            <tr><td>
            <table border="0" style="background-color: #a6a6a6">
                <tr>
                    <td width="165" height="35" align="center"  style="background-color: #737373">
                        <font  color="white" size="3" >
                        <a href="../dashboard.jsp" style="color: white;" >Dashboard</a>
                        </font>
                    </td>
                    <td width="165" align="center" valign="center" >
                          <font  color="white" size="3" >
                                <a href="../case/allcases.jsp" style="color: white;" >
                                     Manage Cases 
                                </a>                                                 `
                        </font>                    
                    </td>
                    <td width="165" align="center" valign="center" >

                    </td>
                    <td colspan="2" width="350" align="right" valign="center" >
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
    <table border="0" width="850" >         
        <tr >
            <td >      
            <form name="DebtorForm1-1" METHOD=POST ACTION="db/insertDebtor.jsp">          
            <table border="0" width="850" style="background-color: lightgrey">
                <tr>
                    <td colspan="1" height="30" valign="center" align="center"
                         style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                         <font color="#2F4F4F" size="3">
                             <b>Debtor(s) Profile</b>
                         </font>
                     </td>
                     <td colspan="3"  style="background-color: aliceblue;" >
                     </td>
                </tr> 
                <tr> <!-- first TR row --> 
                    <td width="55%" valign="top"> <!-- first TD col --> 
                      <br>
                      <%
                        Object caseID = session.getAttribute("caseID");

                        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();            

                        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

                        Statement statement = connection.createStatement();

                        String  Query = "SELECT DebtorID, FirstName, LastName, WorkPhone,State"
                                       + " FROM debtor, profile "
                                       + " WHERE debtor.ProfileID = profile.ProfileID"
                                       + " AND debtor.CaseID=" + caseID;

                        ResultSet resultset = statement.executeQuery(Query);

                        if (resultset.next()) {
                       %>
                       
                       <table width="500" border="0" border style="border-color: #ffffff; height: 90px; 
                                  background: #778899; border:5px;-moz-border-radius:10px;-webkit-border-radius:10px;" >
                          <tr>
                             <td colspan="5" align="center" height="25"   
                                 style="font-family: Times New Roman; font-size: 16px"> <!-- first TD col -->  
                                 <font color="white" ><b>Add, Edit, or Remove</b></font>
                             </td> <!-- End first TD col -->  
                         </tr>
                         <TR style="border-color: #ffffff;">
                            <TD align="center" style="font-family: Times New Roman; font-size: 12px"><b>First name</b></TD>
                            <TD align="center" style="font-family: Times New Roman; font-size: 12px"><b>Last name</b></TD>
                            <TD align="center" style="font-family: Times New Roman; font-size: 12px"><b>Work phone</b></TD>
                            <TD align="center" style="font-family: Times New Roman; font-size: 12px"><b>State</b></TD>
                            <TD align="center" style="font-family: Times New Roman; font-size: 12px"><b>Edit</b></TD>
                            <TD align="center" style="font-family: Times New Roman; font-size: 12px"><b>Delete</b></TD>
                         </TR>
                     <% 
                                     
                       do {   

                     %> 
                       <tr>
                           <TD align="left" width="90" height="30" style="background-color: white; font-family: Times New Roman; font-size: 13px"> <!-- first TD col -->  
                               &nbsp;&nbsp;<%= resultset.getString(2)%>
                           </TD> <!-- End first TD col -->   
                           <td align="left" width="90" height="30" style="background-color: white; font-family: Times New Roman; font-size: 13px"> <!-- first TD col -->  
                              &nbsp;&nbsp; <%= resultset.getString(3)%>
                           </td> <!-- End first TD col -->   
                           <td align="center" width="130" height="30" style="background-color: white; font-family: Times New Roman; font-size: 13px"> <!-- first TD col -->  
                              <%= resultset.getString(4)%>
                           </td> <!-- End first TD col -->   
                           <td align="center" width="130" height="30" style="background-color: white; font-family: Times New Roman; font-size: 13px"> <!-- first TD col -->  
                              <%= resultset.getString(5)%>
                           </td> <!-- End first TD col -->   
                           <TD align="center"  style="background-color: white" width="80">
                               <input type="button" name="edit" value="Edit" style="height:25px;width: 67px" 
                               onClick="javascript:window.location='editDebtor.jsp?id=<%= resultset.getString(1)%>'">
                           </TD>
                           <TD align="center" style="background-color: white" width="80">
                               <input type="button" name="delete" value="Remove" style="height:25px;width: 67" 
                               onClick="javascript:window.location='deleteDebtor.jsp?id=<%= resultset.getString(1)%>'">
                           </TD>
                       <tr>               
                  <%
                           resultset.next();
                         } while (resultset.isAfterLast() != true);            
                     }         
                   %> 
                </table>
                </td>                         
                <td width="45%" valign='top' align='center' style="background-color: white"> <!-- first TD col --> 
                    <br>
                      <table border="0" border style="border-color: #ffffff; height: 100px; background: #778899; border:5px;-moz-border-radius:10px;-webkit-border-radius:10px;" >
                          <tr>
                            <td colspan="2" align="center" height="30"  width="250" > <!-- first TD col -->  
                                <font color="white" ><b>Progress in this section...&nbsp;&nbsp;</b></font>
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
                                   <img src="../images/nav/GreenChkArrow.jpg" width="25" height="25" alt="chkArrow-01"/>
                            </td> <!-- End first TD col -->   
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Debtor(s) Profile Completed
                            </td> <!-- End first TD col -->   
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white" > <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td> <!-- End first TD col -->   
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                  &nbsp;Entering Creditors
                            </td> <!-- End first TD col -->   
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td> <!-- End first TD col -->   
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                 &nbsp;Entering Assets and Income
                            </td> <!-- End first TD col -->   
                          </tr>
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                   <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                            </td> <!-- End first TD col -->   
                            <td align="left" width="200" height="30" style="background-color: white; font-family: Times New Roman; font-size: 14px"> <!-- first TD col -->  
                                &nbsp;Entering Liability and Expenses 
                            </td> <!-- End first TD col -->   
                          </tr>
                      </table>  
                    <br>
                </td>
                </tr>
                <tr>                 
                    <td  colspan="4" height="40" style="background-color: aliceblue">
                        &nbsp;&nbsp;<input type="submit" value="Continue"
                                          style="height: 30px; width: 90px "/>
                        &nbsp;&nbsp;<input onclick="window.location.href='../user/logoutpage.jsp'"  
                        type="button" value="Save & Exit" style="height:30px;width: 90px"/>
                        &nbsp;&nbsp;<font color="red">*</font> is a required field.
                        <br> 
                    </td>
                </tr>
            </table>    
            </td>                         
        </tr>           
    </table>     
</div> 

<div id='tab-2' class="tab">   
</div> 

<div id='tab-3' class="tab">   
</div>     

<div id='tab-4' class="tab">   
</div>       

<div id='tab-5' class="tab">   
</div>     
    
<div id='tab-6' class="tab">   
</div>     
    
<div id='tab-7' class="tab">   
</div>     
    
<div id='tab-8' class="tab">   
</div>     
    
<div id='tab-9' class="tab">   
</div>     
    
    
<div align="center">
    <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
</div>
</center>
</body>
</html>