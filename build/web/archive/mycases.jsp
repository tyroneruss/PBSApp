<%-- 
    Document   : TabTemplate
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
                        + " where UserId=" + userID
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

            if(resultset.getString(1) == "Discharged") {
                discharged_sum = resultset.getInt(2);
            }

            if(resultset.getString(1) == "Dismissed") {
                dismissed_sum = resultset.getInt(2);
            }

            if (value.contains("On Hold")) {
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
<body style="background-color:  #e6e6e6">

<center>  
<table border="0" width='1000' style="background-color: lightgrey">
     <tr >
         <td valign='center' align='left' height="70" width="20%" style="background-color: lightgrey">
             <img src="../images/main/PBSLogo1.0.jpg" id="pbslogo"   alt="PBS Logo"/>
         </td>        
         <td align='center' width="60%" style="font-family: Times New Roman; font-size: 20px">
             <font color="#2F4F4F">
             <b>Case Management</b>
             </font>
         </td>        
         <td valign="top" align="left" width="20%" >
            <font  color="#2F4F4F" size="2" >
                <b>Logged in as:</b>&nbsp;<%= session.getAttribute("fullname") %>
                <br><b>Role:</b>&nbsp;Client Manager&nbsp;&nbsp;
             </font>
             <br>
            <input type="button" value="Logout" onclick="window.location.href='../user/logout.jsp'" />                    
          </td>        
     </tr>    
</table>

<table width='1000'>
<tr><td>
    <br>
    <table border="0" width="1000" style="background-color: lightgrey">  
        <tr><td>
        <table border="0" width="1000" style="background-color: #a6a6a6">
            <tr>
                <td width="165" height="35" align="center"  style="background-color: #737373">
                    <font  color="white" size="3" >
                    <a href="../main/dashboard.jsp" style="color: white;" >Dashboard</a>
                    </font>
                </td>
                <td width="165" align="center" valign="center" >
                      <font  color="white" size="3" >
                      <a href="allcases.jsp" style="color: white;" >
                            Manage All Cases </a>
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
        <li><a href="#tab-1">ALL (<%= total %>)</a></li>
        <li><a href="#tab-2">New (<%= new_sum %>)</a></li>
        <li><a href="#tab-3">Open (<%= open_sum %>)</a></li>
        <li><a href="#tab-4">Processing (<%= processing_sum %>)</a></li>
        <li><a href="#tab-5">Quality Control (<%= quality_sum %>)</a></li>
        <li><a href="#tab-6">Discharged (<%= discharged_sum %>)</a></li>
        <li><a href="#tab-7">On-Hold (<%= onhold_sum %>)</a></li>
        <li><a href="#tab-8">Dismissed (<%= dismissed_sum %>)</a></li>
        <li><a href="#tab-9">Closed (<%= closed_sum %>)</a></li>
    </ul>           

<div id='tab-1' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = " SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: aliceblue; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: white;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>     
</div> 

<div id='tab-2' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'New'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>     
</div> 

<div id='tab-3' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'Open'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>     
</div>     
                
<div id='tab-4' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'Processing'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>     
</div>     

<div id='tab-5' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'Quality Control'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>        
</div>     

<div id='tab-6' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'Discharged'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>     
</div>     
                    
<div id='tab-7' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'On Hold'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>     
</div>     

<div id='tab-8' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'Dismissed'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>          
</div>     
    
<div id='tab-9' class="tab">   
    <table border="0" width="1000" >         
        <tr>
            <td width="5%" height="30" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
               ID# 
            </td>
            <td width="5%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">  
                Date Entered
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px"> 
                Last Modified
            </td>
            <td width="15%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">   
                &nbsp;&nbsp;&nbsp;&nbsp;Status
            </td>
            <td width="25%" align="left" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                &nbsp;&nbsp;Name - Address
            </td>
            <td width="10%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Assigned To
            </td>
            <td width="15%" align="center" valign="center" style="background-color: #778899; font-family: Times New Roman; font-size: 14px">     
                Action
            </td>
        </tr>             
        <tr >
            <td colspan="8">      
                <table border="0" width="1000" style="background-color: white">  
                    <%
                     try {
                         
                        Statement statementNew = connection.createStatement();

                        String  QueryCase = "SELECT c.CaseID, CreatedDate, ModifiedDate,c.Status,"
                                         + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                         + " FROM cases c, debtor d, profile p"
                                         + " WHERE d.ProfileID = p.ProfileID"
                                         + " AND c.CaseID = d.CaseID"    
                                         + " AND c.Status =" + "'Closed'"                            
                                         + " AND c.UserID=" + userID   
                                         + " AND d.debtor = 1"                 
                                         + " Order by c.CaseID";        

                         ResultSet resultsetNew = statementNew.executeQuery(QueryCase);
                         
                         int rowcolor = 0;
                         int counter = 1;
                         
                         String stylevalue = "";

                        if (resultsetNew.next()) {
                         
                            do {   

                                if (rowcolor == 0) {
                                    stylevalue = "style='background-color: white; font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=1;
                                }
                                else {
                                    stylevalue = "style='background-color: aliceblue;  font-family: Times New Roman; font-size: 14px'"; 
                                    rowcolor=0;                                    
                                }
                    %>
                    
                    <tr>
                        <td width="4%" align="center" height='30' valign="top" <%=stylevalue %> >
                            <%= counter %>
                        </td>
                        <td width="6%"  align="center" height='30' valign="top" <%=stylevalue %>  >
                            <a href="../debtor_old/debtor1-1.jsp?caseid=<%= resultsetNew.getInt(1)%>">
                                <img src="../images/main/folder-50px.jpg" height='30' width="30" alt="Folder"/></s>
                        </td>
                        <td width="11%" align="left" height='30' valign="top" <%=stylevalue %>  >
                            &nbsp;&nbsp;<%= resultsetNew.getString(2)%>
                        </td>
                        <td width="11%"  align="left" height='30' valign="top" <%=stylevalue %>  >
                            <%= resultsetNew.getString(3)%>
                        </td>
                        <td width="14%" align="left" height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(4)%>
                        </td>
                        <td width="25%" align="left" height='30' valign="top" <%=stylevalue %> >
                            &nbsp;<%= resultsetNew.getString(5)%>&nbsp;<%= resultsetNew.getString(6)%><br>
                            &nbsp;<%= resultsetNew.getString(7)%><br>
                            &nbsp;<%= resultsetNew.getString(8)%>&nbsp;
                            <%= resultsetNew.getString(9)%>&nbsp;<%= resultsetNew.getString(10)%>      
                        </td>
                        <td width="10%" align="center"  height='30' valign="top" <%=stylevalue %> >
                            <%= resultsetNew.getString(11)%>
                        </td>
                        <td width="15%" align="center"  height='30' valign="top" <%=stylevalue %> >

                        </td>
                    </tr>          
                  <%
                         // out.println("resultset");
                         resultsetNew.next();
                         counter = counter + 1;
                       } while (resultsetNew.isAfterLast() != true);            
                     }         
                     }catch(Exception ex){
                         out.println("Unable to connect to database.");
                     }
                %>
                </table>                  
            </td>                         
        </tr>           
        <tr>
            <td colspan="8" height="30" align="center" valign="center" style="background-color: aliceblue" >                     
            </td>
        </tr> 
    </table>     
</div>     

<div align="center">
    <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
</div>
<% connection.close(); %>  
</center>
</body>
</html>