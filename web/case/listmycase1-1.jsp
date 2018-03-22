<%-- 
    Document   : Tyrone
    Created on : Nov 6, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

  <title>Case Management</title>
  
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
  
    <%

        Object userID = session.getAttribute("userid");
        Object roleID = session.getAttribute("roleid");

        SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");

        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();

        String  Query = " SELECT DISTINCT Status, count( Status )"
                        + " FROM cases"
                        + " Where AssignTo=" + userID  
                        + " GROUP BY Status";

        ResultSet resultset = statement.executeQuery(Query);
        
        int new_sum = 0;
        int open_sum = 0;
        int processing_sum = 0;
        int quality_sum = 0;
        int discharged_sum = 0;
        int dismissed_sum = 0;
        int onhold_sum = 0;
        int closed_sum = 0;
        int total =  0;
        
        if (resultset.next()) {
            
        do {   
            
            String value = resultset.getString(1);

            if (value.contains("New")) {
                new_sum = resultset.getInt(2);
            }
            
            if (value.contains("Open")) {
                open_sum = resultset.getInt(2);     
            }
            
            if (value.contains("Processing")) {
                processing_sum = resultset.getInt(2);
            }            
            
            if (value.contains("Quality")) {
                quality_sum = resultset.getInt(2);     
            }

            if (value.contains("Discharged")) {
                discharged_sum = resultset.getInt(2);
            }

            if (value.contains("Dismissed")) {
                dismissed_sum = resultset.getInt(2);
            }

            if (value.contains("Hold")) {
                onhold_sum = resultset.getInt(2);
            }
            
            if (value.contains("Closed")) {
                closed_sum = resultset.getInt(2);
            }
            
        resultset.next();
      } while (resultset.isAfterLast() != true);            
        
        total = closed_sum + new_sum + open_sum + processing_sum
        + quality_sum + discharged_sum + dismissed_sum + onhold_sum;
        
    }
%>


</head>
<body style="background-color:  white">
<center>  
<table width="1200" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="1000" style="background-color: white">
    <table border="0" width='1000' style="background-color: lightgrey">
         <tr >
             <td valign='center' width='110' height="105" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="107" height="80" alt="logo-01"/>                 
             </td>   
             <td align='center' width="500" style="font-family: Times New Roman;">
                 <font color="#2F4F4F" size="5">
                 <b>Lawyer's Bankruptcy Software</b>
                 </font>
             </td>           
             <td valign="top" align="left" width="200" >
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
    <table width='1000'>
    <tr><td>        
        <table border="0" width="1000" style="background-color: lightgrey">  
            <tr>
            <table border="0" width="1000" style="background-color: #a6a6a6">
                <tr>
                    <td width="130" height="35" align="center"  style="background-color: #737379; font-family: Times New Roman; font-size: 18px">
                        <font  color="white" >
                        <a href="../main/dashboard.jsp" style="color: white;" ><b>Dashboard</b></a>
                        </font>
                    </td>
                    <td width="150" align="center" valign="center" style="font-family: Times New Roman; font-size: 18px">
                      <font  color="white" >
                        <a href="listAllcase1-1.jsp"
                           style="color: white;" >
                            <b>All Cases </b></a>
                       </font>                    
                    </td>
                    <td width="150" align="center" valign="center" style="font-family: Times New Roman; font-size: 18px">
                      <font  color="white" >
                        <a href="../debtor_old/debtor1-1.jsp?userid=<%= session.getAttribute("userid") %>"
                           style="color: white;" >
                            <b>Create New Case</b>
                        </a>
                       </font>                    
                    </td>
                    <td width="150" align="center" valign="center" >
                    </td>
                    <td colspan="2" width="400" align="right" valign="center" >
                        <input type="text" name="search" value="" size="15"/>
                        <font  color="white" size="3" >
                            <a href="" style="text-decoration: none; color: white;" >Search Clients&nbsp; </a>
                        </font>                    
                    </td>
                </tr>                   
            </table>
            </tr> 
            <tr>
                <td colspan="2" height="40" align="center" valign="center" style="background-color: aliceblue;
                    font-family: Times New Roman; font-size: 22px;" >                     
                     <font color="#2F4F4F">
                         <b>Case Management&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
                     </font>
                </td>
            </tr> 
            <tr >
                <td >      
<div class="tabbable">
    <ul class="tabs">
        <li><a href="#tab-1">ALL (<%= total %>)</a></li>
        <li><a href="#tab-2">New (<%= new_sum %>)</a></li>
        <li><a href="#tab-3">Open (<%= open_sum %>)</a></li>
        <li><a href="#tab-4">Processing (<%= processing_sum %>)</a></li>
        <li><a href="#tab-5">Quality Control (<%= quality_sum %>)</a></li>
        <li><a href="#tab-6">On-Hold (<%= onhold_sum %>)</a></li>
        <li><a href="#tab-7">Discharged (<%= discharged_sum %>)</a></li>
        <li><a href="#tab-8">Dismissed (<%= dismissed_sum %>)</a></li>
        <li><a href="#tab-9">Closed (<%= closed_sum %>)</a></li>
    </ul>           

<div id='tab-1' class="tab">   
    
<%
      int current = 0;
      if(request.getParameter("current") != null) {
            current = Integer.parseInt(request.getParameter("current"));
      }
      int skip = 10;
        
        String action = "";
        if(request.getParameter("action") != null) {
          action = request.getParameter("action");
        }
        if ( action.equals("next") ) {
          current += skip;
        }
        if ( action.equals("prev") ) {
          current -= skip;
        }
%>

    <Form Name="form1" Method="POST"  Action="" >
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Client Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                     + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);

                    resultset.last();
                    int rows = resultset.getRow();                   
                    if ( current >= rows ) current = rows-skip;
                    if ( current < 0 ) current = 0;
                       resultset.absolute(current);

                    int rowcolor = 0;
                    
                    String stylevalue = "";
                    
                    int i=0;
                    boolean next = false;
                    while((next=resultset.next()) && i < skip) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= i %>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= session.getAttribute("fullname") %>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            <INPUT TYPE="HIDDEN" NAME="current" VALUE="<%=current%>">
            <INPUT TYPE="HIDDEN" NAME="action" VALUE="next">
            <%
            if(next) {
            %>
            &nbsp;&nbsp;<input type="BUTTON" value="Next Record"  ONCLICK="moveNext()"
                                        style="color: white; 
                                        font-weight: bold;
                                        height: 30px; width: 120px; 
                                        background-color: #737379;" />
            <%
            }
            if(current > 0) {
            %>
            &nbsp;&nbsp;<input type="BUTTON" value="Previous Record"  ONCLICK="movePrevious()"
                                        style="color: white; 
                                        font-weight: bold;
                                        height: 30px; width: 120px; 
                                        background-color: #737379;" />
            <%
            }
            %>
        </form>
       <SCRIPT LANGUAGE="JavaScript">
            <!--
            function moveNext()
            {
                form1.action.value = 'next';
                form1.submit()
            }    
            function movePrevious()
            {
                form1.action.value = 'prev';
                form1.submit()
            }    
            // --> 
        </SCRIPT>
            </td>
        </tr> 
    </table>   
</div>

<div id='tab-2' class="tab">      
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Client Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='" + "New'"                            
                                     + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= i %>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= session.getAttribute("fullname") %>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>   

</div> 
                
<div id='tab-3' class="tab">   
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Client Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='" + "Open'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= session.getAttribute("fullname") %>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>   

             
</div> 
                
<div id='tab-4' class="tab">   
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Client Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='Processing'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= session.getAttribute("fullname") %>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <% if ( i==0 ) { %>
        <tr>
            <td colspan="8" height="80" align="left" valign="center" style="background-color: white;" >                     
            </td>
        </tr> 
        <% } %>

        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>   

              
</div> 
                
<div id='tab-5' class="tab">   
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='Quality Control'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(11)%>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>   

              
</div> 
                
<div id='tab-6' class="tab">   
 
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='On-Hold'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(11)%>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <% if ( i==0 ) { %>
        <tr>
            <td colspan="8" height="80" align="left" valign="center" style="background-color: white;" >                     
            </td>
        </tr> 
        <% } %>

        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>    
              
</div> 
                
<div id='tab-7' class="tab">   
 
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='Discharged'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(11)%>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <% if ( i==0 ) { %>
        <tr>
            <td colspan="8" height="80" align="left" valign="center" style="background-color: white;" >                     
            </td>
        </tr> 
        <% } %>

        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>   
</div> 
                
<div id='tab-8' class="tab">   
 
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='Discharged'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= i %>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= session.getAttribute("fullname") %>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <% if ( i==0 ) { %>
        <tr>
            <td colspan="8" height="80" align="left" valign="center" style="background-color: white;" >                     
            </td>
        </tr> 
        <% } %>

        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>   

              
</div> 
                
<div id='tab-8' class="tab">   
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.AssignTo=" + userID  
                                    + " AND c.Status ='Dismissed'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="left" valign="top" <%=stylevalue %> >
                            <%= session.getAttribute("fullname") %>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <% if ( i==0 ) { %>
        <tr>
            <td colspan="8" height="80" align="left" valign="center" style="background-color: white;" >                     
            </td>
        </tr> 
        <% } %>

        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>               
</div> 

<div id='tab-9' class="tab">   
 
    <table border="0" width="1000"  >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white;">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px; color: white "> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; color: white; font-size: 14px">     
                Action
            </td>
        </tr>              
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                <%
                                             
                    statement = connection.createStatement();

                    QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                    + " FirstName,LastName,Street1,City,State,ZipCode,AssignTo"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='Closed'"                            
                                    + " Order by c.CaseID";        

                    resultset = statement.executeQuery(QueryCase);
                    
                    rowcolor = 0;                   
                    stylevalue = "";
                    
                    i=0;
                    next = false;
                    while((next=resultset.next())) {
                        if (rowcolor == 0) {
                            stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=1;
                        }
                        else {
                            stylevalue = "style='background-color: #eaeafb;  font-family: Times New Roman; font-size: 14px'"; 
                            rowcolor=0;                                    
                        }
                      i++;
                %>
                    <tr>
                        <td width="4%" align="center" height='60' valign="top" <%=stylevalue %> >
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="./caseMgt1-0.jsp?caseid=<%= resultset.getInt(1)%>" >
                                <img src="../images/main/folder-50px.jpg" height='35' width="35" alt="Folder"/>
                            </s>
                        </td>
                        <td width="11%" align="left" valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultset.getString(2)%>
                        </td>
                        <td width="11%"  align="left" valign="top" <%=stylevalue %>  >
                            <%= resultset.getString(3)%>
                        </td>
                        <td width="14%" align="left" valign="top" <%=stylevalue %> >
                            <%= resultset.getString(4)%>
                        </td>
                        <td width="25%" align="left" valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultset.getString(5)%>&nbsp;<%= resultset.getString(6)%><br>
                            &nbsp;<%= resultset.getString(7)%><br>
                            &nbsp;<%= resultset.getString(8)%>&nbsp;
                            <%= resultset.getString(9)%>&nbsp;<%= resultset.getString(10)%>      
                        </td>
                        <td width="10%" align="center" valign="top" <%=stylevalue %> >
                            <%= session.getAttribute("fullname") %>
                        </td>
                        <td width="15%" align="center"  valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                     }              
                %> 

                </table>                  
            </td>                         
        </tr>           
        <% if ( i==0 ) { %>
        <tr>
            <td colspan="8" height="80" align="left" valign="center" style="background-color: white;" >                     
            </td>
        </tr> 
        <% } %>

        <tr>
            <td colspan="8" height="40" align="left" valign="center" style="background-color: lightgrey;" >                     
            </td>
        </tr> 
    </table>               
    </div>       
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

                         