<%-- 
    Author     : Tyrone
    Created on : May 9, 2017      
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

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
  
  <title>PBS - Creditor</title>
 
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
                    <td width="150" align="center" valig+-n="center" >
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
                     <b>Create New Case </b>
                 </font>
             </td>
             <td colspan="1"  style="background-color: aliceblue;" >
             </td>
        </tr> 
        <tr >
            <td width="55%"  style="background-color: white"> 
                <br>
                
            <form name="DebtorForm1-1" METHOD=POST ACTION="reviewcase1-1.jsp">          
            <table border="0" style="background-color: white">
                      <%                       
                          
                        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();            

                        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

                        Statement statement = connection.createStatement();

                        String  Query = "SELECT UserID, FullName FROM user ";
                        ResultSet resultset = statement.executeQuery(Query);


                        if (resultset.next()) {
                                     
                   %>     
                        <tr>
                          <td width="5%" height="28" style="font-family: Times New Roman; font-size: 17px">

                          </td>
                          <td width="55%" height="28" style="font-family: Times New Roman; font-size: 17px">
                              &nbsp;&nbsp;&nbsp;&nbsp;Bankruptcy Type:<font color="red">*</font>
                          </td>
                          <td width="40%" height="28" style="font-family: Times New Roman; font-size: 17px" >
                              <select name="chapter"  style="width: 110px" required >
                                  <option value="">Select One</option>
                                  <option value="7">Chapter 7</option>
                                  <option value="11">Chapter 11</option>
                                  <option value="13">Chapter 13</option>
                              </select>
                          </td>
                        </tr>                             
                        <tr >
                          <td width="5%" height="28" style="font-family: Times New Roman; font-size: 17px">

                          </td>
                          <td width="55%" height="28"  style="font-family: Times New Roman; font-size: 17px">
                              &nbsp;&nbsp;&nbsp;&nbsp;Joint filing:(Yes/No)<font color="red">*</font>
                          </td>
                          <td width="40%" height="28"  style="font-family: Times New Roman; font-size: 17px">
                              <select name="joint" style="width: 50px">
                                  <option value="No">No</option>
                                  <option value="Yes">Yes</option>
                              </select>
                          </td>
                        </tr>
                        <tr>
                          <td width="5%" height="28" style="font-family: Times New Roman; font-size: 17px">

                          </td>
                            <td width="55%" height="25" style="font-family: Times New Roman; font-size: 17px">
                                  &nbsp;&nbsp;&nbsp;&nbsp;State<font color="red">*</font>
                            </td>
                            <td width="40%" height="28" style="font-family: Times New Roman; font-size: 17px">                                
                                  <select name="filingstate" style="width: 150px">
                                      <option value="<%= session.getAttribute("theState") %>"> <%= session.getAttribute("theState") %></option>
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
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                      <td width="55%" height="25" style="font-family: Times New Roman; font-size: 17px">
                          &nbsp;&nbsp;&nbsp;&nbsp;Assign To
                      </td>
                      <td width="40%" height="25" style="font-family: Times New Roman; font-size: 17px" >
                           <select name="assignto" >
                                <option value="<%= session.getAttribute("UserID") %>"><%= session.getAttribute("fullname") %></option>
                                <%    do 
                                      {
                                %>        
                                        <option value="<%= resultset.getString(1)%>" > <%= resultset.getString(2)%></option>
                                <%
                                         resultset.next();
                                       } while (resultset.isAfterLast() != true);            
                                   }         
                                 %> 
                          </select>
                      </td> <!-- End first TD col -->  
                    </tr>                             
                    <tr>
                      <td width="5%" height="28" style="font-family: Times New Roman; font-size: 15px">

                      </td>
                      <td width="30%" height="28" style="font-family: Times New Roman; font-size: 15px">
                          &nbsp;&nbsp;&nbsp;&nbsp;Bankruptcy Case #:
                      </td>
                      <td width="65%" height="28" style="font-family: Times New Roman; font-size: 15px" >
                          <input type="text" name="casenumber" size="30" value=" " />
                      </td> <!-- End first TD col -->  
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
                                  &nbsp;Debtor(s) profile complete
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
                          <tr>
                            <td align="center" width="50" height="30" style="background-color: white"> 
                            <!-- first TD col -->  
                            </td>
                         </tr>
                     
                          </tr>                    
                            </td> <!-- End first TD col -->   
                          </tr>
                      </table> 
                </td>
                </tr>
                <tr>
                    <td height="30" align="left" valign="center" style="background-color: aliceblue;" > 
                        &nbsp;&nbsp;<font color="red" size="4">*</font>&nbsp;indicates a required field. 
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