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
        Object UserType = session.getAttribute("Type");
        Object AccessL = session.getAttribute("AccessLevel");
        
        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();

        String  Query = "SELECT * from user";

        ResultSet resultset = statement.executeQuery(Query);
        
        resultset.next();
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
                        <a href="case1-2.jsp?userid=<%= session.getAttribute("userid") %>"
                           style="color: white;" >
                            <b>My Cases </b></a>
                       </font>                    
                    </td>
                    <td width="150" align="center" valign="center" style="font-family: Times New Roman; font-size: 18px">
                      <font  color="white" >
                        <a href="../debtor/debtor1-1.jsp?userid=<%= session.getAttribute("userid") %>"
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
                           <%= resultset.getInt(1)%>
                        </td>
                        <td width="6%"  align="center"  valign="top" <%=stylevalue %>  >
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='" + "New'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='" + "Open'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='Processing'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='Quality Control'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='On-Hold'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='Discharged'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='Discharged'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='Dismissed'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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
                                    + " FirstName,LastName,Street1,City,State,ZipCode,Assigned_to"
                                    + " FROM cases c, debtor d, profile p"
                                    + " WHERE  c.Debtor1 = d.DebtorID AND"
                                    + " d.ProfileID = p.ProfileID"                                 
                                    + " AND c.Status ='Closed'"                            
                                    + " AND d.debtor = 1"                 
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
                            <a href="../debtor/debtor1-1a.jsp?caseid=<%= resultset.getInt(1)%>" >
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

                         