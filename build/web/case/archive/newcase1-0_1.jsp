<%-- 
    Document   : Tyrone
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
<table width="1040" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="840" style="background-color: white">
    <table border="0" width='855' style="background-color: lightgrey">
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
    <table width='850'>
    <tr><td>        
        <table border="0" width="850" style="background-color: lightgrey">  
            <tr><td>
            <table border="0" style="background-color: #a6a6a6">
                <tr>
                    <td width="165" height="35" align="center"  style="background-color: #737373">
                        <font  color="white" size="4" >
                        <a href="../dashboard.jsp" style="color: white;" ><b>Dashboard</b></a>
                        </font>
                    </td>
                    <td width="165" align="center" valig+-n="center" >
                        <font  color="white" size="4" >
                        <a href="../case/allcases.jsp" style="color: white;" ><b>Manage Cases</b> </a>
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
    <table border="0" width="850" >         
        <tr>
            <td colspan="2" height="30" valign="center" align="center"
                 style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                 <font color="#2F4F4F" size="4">
                     <b>Create New Case </b>
                 </font>
             </td>
        </tr> 
        <tr >
            <td width="90%"  style="background-color: white">      
            <form name="DebtorForm1-1" METHOD=POST ACTION="newcase1-1.jsp">          
            <table border="0" style="background-color: white">
                    <%
                           
                        String caseID = request.getParameter( "caseid" );
                        session.setAttribute("caseID", caseID);                           

                        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();            

                        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

                        Statement statement = connection.createStatement();

                        String  Query = "SELECT UserID, FullName FROM user ";
                        ResultSet resultset = statement.executeQuery(Query);

                        if (resultset.next()) {
                                     
                    %>     
                    <tr>
                        <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                        </td>
                        <td colspan="2" width="90%" height="25" style="font-family: Times New Roman; font-size: 15px">
                            &nbsp;&nbsp;&nbsp;&nbsp;First name:<font color="red">*</font>
                            <input type="text" name="firstname" value=""  Required />
                            &nbsp;&nbsp;&nbsp;&nbsp;Middle Initial:
                            <input type="text" name="middlename" value=""  size="2" />
                        </td> <!-- End first TD col -->  
                     </tr>                             
                    <tr>
                      <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                      </td>
                      <td width="40%" height="25" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp;&nbsp;Bankruptcy Type:<font color="red">*</font>
                      </td>
                      <td width="50%" height="25" style="font-family: Times New Roman; font-size: 15px" >
                          <select name="Chapter" >
                              <option value="">Select One</option>
                              <option value="7">Chapter 7</option>
                              <option value="11">Chapter 11</option>
                              <option value="12">Chapter 12 Farmers</option>
                              <option value="13">Chapter 13</option>
                          </select>
                      </td> <!-- End first TD col -->  
                    </tr>                             
                    <tr >
                      <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                      </td>
                      <td width="40%" height="25"  style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;                                   
                          <font color="red">*</font>Joint filing:(Yes/No)
                      </td>
                      <td width="50%" height="25"  style="font-family: Times New Roman; font-size: 15px">
                          <select name="joint">
                              <option  value="">Select</option>
                              <option value="Yes">Yes</option>
                              <option value="No">No</option>
                          </select>
                      </td>
                    </tr>
                    <tr>
                      <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                      </td>
                        <td width="40%" height="25" style="font-family: Times New Roman; font-size: 15px">
                              &nbsp;&nbsp;<font color="red">*</font>State:
                        </td>
                        <td width="50%" height="25" style="font-family: Times New Roman; font-size: 15px">                                
                              <select name="State" style="width: 150px">
                                  <option value='unknown'>Select One</option>
                                  <option value="Alabama" >Alabama</option><option value="Alaska" >Alaska</option>
                                  <option value="Arizona" >Arizona</option><option value="Arkansas" >Arkansas</option>
                                  <option value="California" >California</option><option value="Colorado" >Colorado</option>
                                  <option value="Connecticut" >Connecticut</option><option value="Delaware" >Delaware</option>
                                  <option value="District of Columbia" >District of Columbia</option><option value="Florida" >Florida</option>
                                  <option value="Georgia" >Georgia</option><option value="Hawaii" >Hawaii</option>
                                  <option value="Idaho" >Idaho</option><option value="Illinois" >Illinois</option>
                                  <option value="Indiana" >Indiana</option><option value="Iowa" >Iowa</option>
                                  <option value="Kansas" >Kansas</option><option value="Kentucky" >Kentucky</option>
                                  <option value="Louisiana" >Louisiana</option><option value="Maine" >Maine</option>
                                  <option value="Maryland" >Maryland</option><option value="Massachusetts" >Massachusetts</option>
                                  <option value="Michigan" >Michigan</option><option value="Minnesota" >Minnesota</option>
                                  <option value="Mississippi" >Mississippi</option><option value="Missouri" >Missouri</option>
                                  <option value="Montana" >Montana</option><option value="Nebraska" >Nebraska</option>
                                  <option value="Nevada" >Nevada</option><option value="New Hampshire" >New Hampshire</option>
                                  <option value="New Jersey" >New Jersey</option><option value="New Mexico" >New Mexico</option>
                                  <option value="New York" >New York</option><option value="North Carolina" >North Carolina</option>
                                  <option value="North Dakota" >North Dakota</option><option value="Ohio" >Ohio</option>
                                  <option value="Oklahoma" >Oklahoma</option><option value="Oregon" >Oregon</option>
                                  <option value="Pennsylvania" >Pennsylvania</option><option value="Puerto Rico" >Puerto Rico</option>      
                                  <option value="Rhode Island" >Rhode Island</option><option value="South Carolina" >South Carolina</option>
                                  <option value="South Dakota" >South Dakota</option><option value="Tennessee" >Tennessee</option>
                                  <option value="Texas" >Texas</option><option value="UT" >Utah</option>      
                                  <option value="Vermont" >Vermont</option><option value="Virginia" >Virginia</option>
                                  <option value="Wisconsin" >Wisconsin</option><option value="Wyoming" >Wyoming</option>		  
                              </select> 
                        </td> <!-- End first TD col -->  
                  </tr>
                  <tr>
                    <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                    </td>
                  <td width="50%" height="25" style="font-family: Times New Roman; font-size: 15px">
                      &nbsp;&nbsp;&nbsp;Assign To:
                  </td>
                  <td width="40%" height="25" style="font-family: Times New Roman; font-size: 15px" >
                      <select name="AssignTo" >
                          <option value=""><%= session.getAttribute("fullname") %></option>
                  <%    do 
                        {
                  %>        
                          <option value="<%= resultset.getString(2)%>"><%= resultset.getString(2)%></option>
                  <%
                           resultset.next();
                         } while (resultset.isAfterLast() != true);            
                     }         
                   %> 
                      </select>
                  </td> <!-- End first TD col -->  
                </tr>                             
                </table>
                </td> 
                </tr>
                <tr>
                    <td colspan="2" height="35" align="right" valign="center" style="background-color: lightgrey;" >                     
                            <input type="submit" value="NEXT" 
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
</td>
</tr>
</table>
<div align="center">
    <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
</div>
</center>
</body>
</html>