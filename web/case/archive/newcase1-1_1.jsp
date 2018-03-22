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
                        <b>Create New Case</b></a>
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
            <table border="0" width="900" style="background-color: lightgrey">
                <tr>
                    <td colspan="1" height="30" valign="center" align="center"
                         style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                         <font color="#2F4F4F" size="3">
                             <b>Debtor-1 Profile</b>
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
                                Address 1<font color="red">*</font>
                             </td>
                             <td width="65%" height="25">
                                     <input type="text" name="street1" value="" size="33"/>
                             </td> <!-- End first TD col -->  
                       </tr>
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                          <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                               Address 2
                          </td>
                         <td width="65%" height="25">
                                 <input type="text" name="street2" value="" size="33"/>
                         </td> <!-- End first TD col -->  
                       </tr>
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                           <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                 City<font color="red">*</font>
                           </td>
                           <td width="65%" height="25">
                                 <input type="text" name="city" value="" size="17"/>
                           </td>
                       </tr>  
                       <tr>
                            <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                            </td>
                           <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                 State<font color="red">*</font>
                           <td width="65%" height="25" style="font-family: Times New Roman; font-size: 14px">                                
                                 <select name="state" >
                                     <option value='Georgia'>Georgia</option>
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
                                     <option value="Washington" >Washington</option><option value="West Virginia" >West Virginia</option>
                                     <option value="Wisconsin" >Wisconsin</option><option value="Wyoming" >Wyoming</option>		  
                                 </select> 
                                 &nbsp;&nbsp;<font color="red">*</font>Zip code:
                                 <input type="text" name="zipcode" value="" size="8"/>
                           </td> <!-- End first TD col -->  
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                             Work Phone
                         </td>
                         <td width="65%" height="25">
                             <input type="text" name="workphone" value="" size="11" />
                         </td>
                     </tr>
                     <tr>
                         <td width="5%" height="25" style="font-family: Times New Roman; font-size: 14px">
                         </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                            Mobile Phone<font color="red">*</font>
                         </td>
                         <td width="65%" height="25">
                             <input type="text" name="mmobilephone" value="" size="11" />
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                             Home Phone:
                         </td>
                         <td width="65%" height="25">
                             <input type="text" name="homephone" value="" size="11" />
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                            Birthday<font color="red">*</font>
                         </td>
                         <td width="65%" height="25">
                             <input type="date" name="birthdate" value="" size="10" />
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                           <td width="30%" height="30" style="font-family: Times New Roman; font-size: 14px">
                             Social Security #<font color="red">*</font>
                           </td>
                           <td width="65%" height="25">
                             <input type="text" name="socialsecurityno" value="" size="12" />
                           </td> <!-- End first TD col -->  
                       </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                           <td width="30%" height="35" valign="top" style="font-family: Times New Roman; font-size: 14px">
                             Email<font color="red">*</font>
                           </td>
                           <td width="65%" height="25"  valign="top" >
                             <input type="text" name="email" value="" size="32" />
                           </td> <!-- End first TD col -->  
                       </tr>
                   </table>
                </td>
                <td width="43%" valign='top' align='center' style="background-color: white"> <!-- first TD col --> 
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