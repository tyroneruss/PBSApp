<%-- 
    Document   : Tyrone
    Created on : Nov 6, 2016
    Author  
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
 
  <script  LANGUAGE="JavaScript">
        function moveOnMax(field,nextFieldID){
            if(field.value.length >= field.maxLength){
              document.getElementById(nextFieldID).focus();
            }
        }
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
    String Gender = request.getParameter( "gender" );
    session.setAttribute("theGender", Gender);                           
     
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
                     <b>Debtor-1 Profile</b>
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
                        <tr>
                          <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                          </td>
                          <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                              Address 1<font color="red">*</font>
                          </td>
                          <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px" >
                              <input type="text" name="address1" value="" size="45" Required />
                          </td> <!-- End first TD col -->  
                        </tr>                             
                        <tr>
                          <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                          </td>
                          <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                              Address 2:
                          </td>
                          <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px" >
                              <input type="text" name="address2" value=""  size="45" />
                          </td> <!-- End first TD col -->  
                        </tr>                             
                        <tr>
                          <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                          </td>
                          <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                              City<font color="red">*</font>
                          </td>
                          <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px" >
                              <input type="text" name="city" value="" size="25"  Required />
                          </td>
                        </tr>                             
                        <tr>
                          <td width="10%" height="25" style="font-family: Times New Roman; font-size: 15px">

                          </td>
                          <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                              State<font color="red">*</font>
                          </td>
                          <td width="60%" height="25" style="font-family: Times New Roman; font-size: 15px" >
                              <select name="state" style="width: 150px">
                                  <option value='unknown'>--- Select One ---</option>
                                  <option value="Alabama" >Alabama</option><option value="Alaska" >Alaska</option>
                                  <option value="Arizona" >Arizona</option><option value="Arkansas" >Arkansas</option>
                                  <option value="California" >California</option><option value="Colorado" >Colorado</option>
                                  <option value="Connecticut" >Connecticut</option><option value="Delaware" >Delaware</option>
                                  <option value="District of Columbia" >District of Columbia</option><option value="Florida" >Florida</option>
                                  <option value="GA" >Georgia</option><option value="Hawaii" >Hawaii</option>
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
                              &nbsp;&nbsp;&nbsp;Zip code:<font color="red">*</font>&nbsp;
                              <input type="text" name="zipcode" value="" size="10" Required />
                          </td> <!-- End first TD col -->
                        </tr>                             
                   <% if (Joint.equals("Yes")) { %>                       
                         <tr>
                          <td width="10%" height="30" style="font-family: Times New Roman; font-size: 15px">

                          </td>
                          <td colspan="2" width="90%" height="25" style="font-family: Times New Roman; font-size: 15px">
                              &nbsp;&nbsp;&nbsp;&nbsp;Does Debtor 2 live at a different address<font color="red">*</font>                             
                              <select name="diff_address" style="width: 60px">
                                  <option value='No' >No</option>
                                  <option value='Yes'>Yes</option>
                              </select>
                          </td>
                        </tr>                                       
                    <% } %>
                     <tr>
                         <td width="5%" height="25" style="font-family: Times New Roman; font-size: 14px">
                         </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                            Cell phone<font color="red">*</font>
                         </td>
                         <td width="65%" height="25">
                             <input type="text" name="cellphone" value="" size="11" />
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                             Work phone
                         </td>
                         <td width="65%" height="25">
                             <input type="text" name="workphone" value="" size="11" />
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                             Home phone
                         </td>
                         <td width="65%" height="25">
                             <input type="text" name="homephone" value="" size="11" />
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                         <td width="30%" height="25" style="font-family: Times New Roman; font-size: 15px">
                            Birthday<font color="red">*</font>
                         </td>
                         <td width="65%" height="25">
                             <input type="text" name="birthdate" size="11" id="BDfield" maxlength=10 onkeyup="moveOnMax(this,'ssn3field')" />
                             &nbsp;(mm/dd/yyyy)
                         </td>
                     </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                           <td width="30%" height="30" style="font-family: Times New Roman; font-size: 15px">
                             Social Security#<font color="red">*</font>
                           <td width="65%" height="25">
                                <input type="text" name="SSN1" size="2" id="ssn3field" maxlength=3  onkeyup="moveOnMax(this,'ssn2field')"/>
                                <input type="text" name="SSN2" size="1" id="ssn2field" maxlength=2  onkeyup="moveOnMax(this,'ssn4field')"/>
                                <input type="text" name="SSN3" size="3" id="ssn4field" maxlength=4  onkeyup="moveOnMax(this,'emailfield')"/>
                            </td> <!-- End first TD col -->  
                       </tr>
                     <tr>
                        <td width="5%" height="25" style="font-family: Times New Roman; font-size: 17px">

                        </td>
                           <td width="30%" height="35" valign="top" style="font-family: Times New Roman; font-size: 15px">
                             Email<font color="red">*</font>
                           </td>
                           <td width="65%" height="25"  valign="top" >
                             <input type="text" name="email" value="" size="32" id="emailfield" />
                           </td> <!-- End first TD col -->  
                       </tr>
                </table>
                </td>                         
                       <td width="45%" valign='top' align='center' style="background-color: white"> <!-- first TD col --> 
                      <br>
                      <table border="0" border style="border-color: #ffffff; height: 100px; background: #778899; border:5px;-moz-border-radius:10px;-webkit-border-radius:10px;" >
                          <tr>
                            <td colspan="2" align="center" height="30"  width="250" > <!-- first TD col -->  
                                <font color="white" ><b>Progress with this case...&nbsp;&nbsp;</b></font>
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
                        </td> <!-- End first TD col -->   
                          </tr>
                      </table> 
                </td>
                </tr>
                <tr>
                    <td height="30" align="left" valign="center" style="background-color: aliceblue;" > 
                        &nbsp;&nbsp;<font color="red" size="4">*</font>&nbsp;Indicates a required field. 
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