<!-- 
    Document   : Home page
    Created on : Oct 19, 2016
    Author     : Tyrone  #e6e6e6
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>People's Bankruptcy Software - Login</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <style>
    input[type="button"] {
        height:35px; width:150px; 
        background: DarkCyan; 
        color: white; font-size: 18px; 
        padding: 5px 10px;
    }  
    
    input[type="submit"] {
        height:35px; width:150px; 
        background: DarkCyan; 
        color: white; 
        font-size: 18px; 
        padding: 5px 10px;    
    }      
  </style>

</head>

<%
     String username = request.getParameter( "UserName" );
     session.setAttribute( "theUserName", username );

     String PassWord = request.getParameter("password2"); 	
     session.setAttribute( "thePassWord", PassWord );

     String FullName = request.getParameter( "FullName" );
     session.setAttribute( "theFullName", FullName );
     
     String EmailAddress = request.getParameter( "EmailAddress" );
     session.setAttribute( "theEmailAddress", EmailAddress ); 
    
     String Gender = request.getParameter("Gender"); 	
     session.setAttribute( "theGender", Gender );    
%>

<body style="background-color: lightgrey">
<!-- Start with new border -->
<table border="0" cellpadding="15" cellspacing="0" align="center" style="border:solid 1px #ffffff">
<tr>
<td style="background-color: White">
<table border="0" cellpadding="0" cellspacing="0" width="620px" align="center">
    <tr>
        <td valign="top" rowspan="2">
                         
<table border="0" width='620px' style="background-color: lightgrey">
       <tr>
            <td align='left'  width="35">&nbsp;&nbsp;<img src="../images/PBSLogo1.0.jpg" width="180" height="75"   alt="PBS Logo"/>
            </td>    
       </tr>
       <tr>
            <td height="50" valign="left" align="center" 
                style="background-color: aliceblue" style="font-family: Times New Roman;"  style="color:darkblue;">
                <font color="#2F4F4F" size="5">
                <b>Create User Account<br><b>
                </font>
            </td>
       </tr>
       <tr >
             <td  height="30" align="center" valign='center' align='center'>
                 <font color="#2F4F4F"  size="4">This platform is best used with chrome or firefox</font>
             </td>
       </tr>
       <tr>
        <td style="background-color: aliceblue" align="center" vlign="middle">
            <Form Action="db/InsertUserDb.jsp" >
            <table border="0">
                <tbody>
                    <tr>
                        <td colspan="2" height="50" align="center" >
                            <font style="font-family: Helvetica; font-size: 18px" color="#2F4F4F">
                            <b>Please select security question</b>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 16px">
                                Question 1:
                            </font>
                        </td>
                        <td height="30">
                            <select name="Question1" >
                                <option  style="height: 20px" > -- Select Security Question #1 -- </option>
                                <option value="What is the first name of the person you first kissed?">What is the first name of the person you first kissed?</option>
                                <option value="What was the name of your elementary/primary school?">What was the name of your elementary / primary school?</option>
                                <option value="In what city or town does your nearest sibling live?">In what city or town does your nearest sibling live?"</option>
                                <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                                <option value="In what city was your father born?">In what city was your father born?</option>
                                <option value="What the name your favorite food?">What the name your favorite food?</option>
                                <option value="What was the of your first car?">What was the of your first car?</option>
                                <option value="What month were you married in?">What month were you married in?</option>
                                <option value="What's your mother's middle name?">What's your mother's middle name?</option>
                                <option value="What's the name of your first born?">What's the name of your first born?</option>
                            </select>
                         </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 16px">
                                Answer 1:
                            </font>
                        </td>
                        <td height="30">
                            <input type="text" name="Answer1" value="" size="20"  required/>                               	
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 16px">
                                Question 2:
                            </font>
                        </td>
                        <td height="30">
                            <select name="Question2">
                                <option  style="height: 20px" > -- Select Security Question #2 -- </option>
                                <option value="What is the first name of the person you first kissed?">What is the first name of the person you first kissed?</option>
                                <option value="What was the name of your elementary/primary school?">What was the name of your elementary / primary school?</option>
                                <option value="In what city or town does your nearest sibling live?">In what city or town does your nearest sibling live?"</option>
                                <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                                <option value="In what city was your father born?">In what city was your father born?</option>
                                <option value="What the name your favorite food?">What the name your favorite food?</option>
                                <option value="What was the of your first car?">What was the name of your first car?</option>
                                <option value="What month were you married in?">What month were you married in?</option>
                                <option value="What's your mother's middle name?">What's your mother's middle name?</option>
                                <option value="What's the name of your first born?">What's the name of your first born child?</option>
                            </select>
                         </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 16px">
                                Answer 2:
                            </font>
                        </td>
                        <td height="30">
                            <input type="text" name="Answer2" value="" size="20"  required/>                               	
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 16px">
                                Question 3:
                            </font>
                        </td>
                        <td height="30">
                            <select name="Question3">
                                <option  style="height: 20px" > -- Select Security Question #3 -- </option>
                                <option value="What is the first name of the person you first kissed?">What is the first name of the person you first kissed?</option>
                                <option value="What was the name of your elementary/primary school?">What was the name of your elementary / primary school?</option>
                                <option value="In what city or town does your nearest sibling live?">In what city or town does your nearest sibling live?"</option>
                                <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                                <option value="In what city was your father born?">In what city was your father born?</option>
                                <option value="What the name your favorite food?">What the name your favorite food?</option>
                                <option value="What was the of your first car?">What was the of your first car?</option>
                                <option value="What month were you married in?">What month were you married in?</option>
                                <option value="What's your mother's middle name?">What's your mother's middle name?</option>
                                <option value="What's the name of your first born?">What's the name of your first born?</option>
                            </select>
                         </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 16px">
                                Answer 3:
                            </font>
                        </td>
                        <td height="30">
                            <input type="text" name="Answer3" value="" size="20"  required/>                               	
                        </td>
                    </tr>
                    <tr>
                           <td colspan="2" align="center" height="75">                    
                               <input type="button" value="Cancel" />                             			
                               <input type="submit" value="Create Account" />                             			
                           </td>
                     </tr>                       
                </tbody>
            </table>
            </form>
          </td>
        </tr>
        <tr >
              <td colspan='3' height="40" style="background-color: lightgrey;">
                          
              </td>
        </tr>        
    </table>
    </td>
    </tr>
    </table>
    </td>
    </tr>
</table>
</body>
</html>

