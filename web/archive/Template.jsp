<%-- 
    Document   : TabTemplate
    Created on : Nov 6, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <title>PBS Debtor</title>
  
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
    <table border="0" width='875' style="background-color: lightgrey">
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
    <table width='870'>
    <tr><td>        
        <table border="0" width="870" style="background-color: lightgrey">  
            <tr>
            <table border="0" width="870" style="background-color: #a6a6a6">
                <tr>
                    <td width="150" height="35" align="center"  style="background-color: #737379">
                        <font  color="white" size="4" >
                            <b>Evaluation</a></b>
                        </font>
                    </td>
                    <td width="150" height="35" align="center" >
                        <font  color="white" size="4" >
                        <a href="../main/dashboard.jsp" style="color: white;" ><b>Dashboard</b></a>
                        </font>
                    </td>
                    <td width="150" align="center" valign="center" >

                    </td>
                    <td colspan="2" width="550" align="right" valign="center" >
                        <input type="text" name="search" value="" size="15"/>
                        <font  color="white" size="3" >
                            <a href="" style="text-decoration: none; color: white;" >Search Clients&nbsp; </a>
                        </font>                    
                    </td>
                </tr>                   
            </table>
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
                <table border="0" width="850" style="background-color: white">
                    <tr>
                        <td colspan="1" width="55%" height="30" valign="center" align="center"
                             style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                             <font color="#2F4F4F" size="3">
                                 <b>Debtor Details</b>
                             </font>
                         </td>
                         <td colspan="1" width="45%" style="background-color: aliceblue;" >
                         </td>
                    </tr> 
                    <tr> <!-- first TR row --> 
                    <td width="55%"> 
                     <!-- Profile table --> 
                        <table border="0">
                            <tr >
                              <td width="30%" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;                                   
                                  <font color="red">*</font>Gender:
                              </td>
                              <td width="70%" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                      <input type="radio" name="Gender" value="female" Required />Male
                                      <input type="radio" name="Gender" value="male" Required />Female                                    
                              </td>
                            </tr>
                            <tr >
                              <td width="30%" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;                                   
                                  <font color="red">*</font>First name:
                              </td>
                              <td width="70%" height="25" >
                                  <input type="text" name="FirstName" value="" size="14" />  
                              </td>
                            </tr>
                            <tr>
                              <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                 &nbsp;&nbsp;&nbsp;&nbsp;Middle name:&nbsp;
                              </td>
                              <td width="70%" height="25">
                                  <input type="text" name="MiddleName" value="" size="14" />
                              </td>
                            </tr>
                            <tr>
                              <td width="profile30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;&nbsp;<font color="red">*</font>Last name:
                              </td>
                              <td width="70%" height="25" style="font-family: Times New Roman; font-size: 14px" >
                                  <input type="text" name="LastName" value="" size="14"/>
                                  &nbsp;&nbsp;&nbsp;Suffix:
                                  <select name="Suffix" >
                                      <option value="">Select</option>
                                      <option value="Sr">Sr  </option>
                                      <option value="Jr">Jr  </option>
                                      <option value="II">II  </option>
                                      <option value="III">III </option>
                                      <option value="Iv">IV  </option>
                                  </select>
                              </td> <!-- End first TD col -->  
                            </tr>                             
                            <tr>
                                  <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                          &nbsp;&nbsp;<font color="red">*</font>Address 1: 
                                  </td>
                                  <td width="70%" height="25">
                                          <input type="text" name="Street1" value="" size="31"/>
                                  </td> <!-- End first TD col -->  
                            </tr>
                            <tr>
                               <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                      &nbsp;&nbsp;<font color="red">*</font>Address 2:
                               </td>
                              <td width="70%" height="25">
                                      <input type="text" name="Street2" value="" size="31"/>
                              </td> <!-- End first TD col -->  
                            </tr>
                            <tr>
                                <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                      &nbsp;&nbsp;<font color="red">*</font>City:
                                </td>
                                <td width="70%" height="25">
                                      <input type="text" name="City" value="" size="17"/>
                                </td>
                            </tr>  
                            <tr>
                                <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                      &nbsp;&nbsp;<font color="red">*</font>State:
                                </td>
                                <td width="70%" height="25" style="font-family: Times New Roman; font-size: 14px">                                
                                      <select name="State" >
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
                                      <input type="text" name="ZipCode" value="" size="8"/>
                                </td> <!-- End first TD col -->  
                          </tr>
                          <tr>
                              <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;&nbsp;<font color="red">*</font>Work Phone:
                              </td>
                              <td width="70%" height="25">
                                  <input type="text" name="WorkPhone" value="" size="10" />
                              </td>
                          </tr>
                          <tr>
                              <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;&nbsp;<font color="red">*</font>Mobile Phone:
                              </td>
                              <td width="70%" height="25">
                                  <input type="text" name="MobilePhone" value="" size="10" />
                              </td>
                          </tr>
                          <tr>
                              <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;&nbsp;<font color="red">*</font>Home Phone:
                              </td>
                              <td width="70%" height="25">
                                  <input type="text" name="HomePhone" value="" size="10" />
                              </td>
                          </tr>
                          <tr>
                              <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;&nbsp;<font color="red">*</font>Birthday:
                              </td>
                              <td width="70%" height="25">
                                  <input type="date" name="BirthDate" value="" size="10" />
                              </td>
                          </tr>
                          <tr>
                                <td width="30%" height="30" style="font-family: Times New Roman; font-size: 14px">
                                  &nbsp;&nbsp;<font color="red">*</font>Social Security #:
                                </td>
                                <td width="70%" height="25">
                                  <input type="text" name="SocialSecurityNo" value="" size="12" />
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
             </form>
        </td>                  
        </tr>           
                <tr>
                    <td colspan="2" height="50" align="left" valign="center" style="background-color: lightgrey;" >                     
                        &nbsp;&nbsp; <input type="submit" value="CONTINUE" 
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />

                       &nbsp;&nbsp; <input type="button" value="CANCEL" 
                            onclick="window.location.href='javascript:history.back()'" 
                            style="color: white; 
                            height: 30px; width: 100px; 
                            background-color: #737379;" />
                     </td>
                </tr>        
        </table>        
    </div>

    <div id='tab-2' class="tab">   
    </div> 

    <div id='tab-3' class="tab">   
    </div>     

</td>
</tr>
<table>
</center>
</body>
</html>

                         