<%-- 
    JSP Page   : Debtor 
    Created on : Dec 23, 2016, 12:42:06 AM
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
<table width="1080" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="850" style="background-color: white">
    <table border="0" width='860' style="background-color: lightgrey">
         <tr >
             <td valign='center' width='110' height="100" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="95" height="75" alt="logo-01"/>                 
             </td>   
             <td align='center' width="480" style="font-family: Times New Roman;">
                 <font color="#2F4F4F" size="5">
                 <b>People's Bankruptcy Software</b>
                 </font>
             </td>           
             <td valign="top" align="left" width="220" >
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
    <table width='800'>
    <tr><td>        
        <table border="0" width="850" style="background-color: lightgrey">  
            <tr><td>
            <table border="0" style="background-color: #a6a6a6">
                <tr>
                    <td width="165" height="35" align="center"  style="background-color: #737379">
                        <font  color="white" size="3" >
                        <a href="../main/dashboard.jsp" style="color: white;" ><b>Dashboard</b></a>
                        </font>
                    </td>
                    <td width="165" align="center" valign="center" >
                        <font  color="white" size="4" >
                        <a href="../case/case1-1.jsp" style="color: white;" ><b>Manage Cases</b> </a>
                        </font>                    
                    </td>
                    <td width="170" align="center" valign="center" >

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
        <li><a href="#tab-5">Document Management</a></li>
    </ul>           

<div id='tab-1' class="tab">   
    <table border="0" width="850" >         
        <tr >
            <td >      
            <form name="DebtorForm1-1" METHOD=POST ACTION="db/insertDebtor.jsp">          
            <table border="0" width="850" style="background-color: white">
                <tr>
                    <td width="55%" height="30" valign="center" align="center"
                         style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                         <font color="#2F4F4F" size="3">
                             <b>Debtor(s)</b>
                         </font>
                     </td>
                     <td width="45%" style="background-color: aliceblue;" >
                     </td>
                </tr> 
                <tr> <!-- first TR row --> 
                   <td width="55%"  valign="top" > <!-- first TD col -->  
                       <br>
                      <%
                        String caseID = request.getParameter( "caseid" );
                        
                        // out.println(caseID);

                        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();            

                        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

                        Statement statement = connection.createStatement();

                        String  Query = "SELECT DebtorID, FirstName, LastName, WorkPhone,State"
                                       + " FROM debtor, profile "
                                       + " WHERE debtor.ProfileID = profile.ProfileID"
                                       + " AND debtor.CaseID=" + caseID;

                        ResultSet resultset = statement.executeQuery(Query);
                        
                        int count = 0;
                        if (resultset.next()) {
                       %>
                       
                       <table width="500" border="0" border style="border-color: #ffffff; height: 90px; 
                                background: #778899; border:5px;-moz-border-radius: 10px;-webkit-border-radius: 10px;" >
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
                           </TD>  
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
                       </tr>               
                        <%       count = count + 1;
                                 resultset.next();
                               } while (resultset.isAfterLast() != true);            
                           }         
                         %> 
                        
                        <tr>
                            <td height="20" > 
                                <br>
                            </td>
                        </tr>
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
                                      &nbsp;Debtor(s) profile completed
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
            </table>    
                <tr>
                    <td height="30" align="left" valign="center" style="background-color: aliceblue;" > 
                    </td>
                </tr>
                <tr>
                    <td height="40" align="left" valign="center" style="background-color: lightgrey" >   
                        &nbsp;&nbsp; <input type="submit" value="ADD DEBTOR" 
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />

                       &nbsp;&nbsp; <input type="button" value="CONTINUE" 
                            onclick="window.location.href='debtor1-2.jsp'" 
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />
                       
                       &nbsp;&nbsp; <input type="button" value="SAVE & EXIT" 
                            onclick="window.location.href='../user/logout.jsp'" 
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />
                     </td>
                </tr>        
            </td>                         
        </tr>           
    </table>    
</div> 

<div id='tab-2' class="tab">   

</div>     

<div id='tab-4' class="tab">   

</div>     
    

<div id='tab-5' class="tab">   

</div>     
    

<div id='tab-6' class="tab">   

</div>     
    
</td>
</tr>
</table>
<div align="center">
    <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
</div>
</center>
</body>
</html>