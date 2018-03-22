<%-- 
    Document   : Security Questions
    Created on : Dec 22, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <title>PBS Security Questions</title>
  
    <script>
  
  </script>    
  <style>
      
  </style>
  
<%
     String userName = request.getParameter( "username" );
     session.setAttribute( "theUserName", userName );

     String passWord = request.getParameter("password1"); 	
     session.setAttribute( "thePassWord", passWord );

     String fullName = request.getParameter( "fullame" );
     session.setAttribute( "theFullName", fullName );
     
     String EmailAddress = request.getParameter( "email" );
     session.setAttribute( "theEmailAddress", EmailAddress ); 
    
%>

</head>

<body style="background-color:  white">
<center>  
<table width="1000" style="background-color: lightgrey">
<tr>
<td with="200" border="0" style="background-color: aliceblue">    
</td>
<td width="820" style="background-color: aliceblue">
    <table border="0" width='820' style="background-color: lightgrey">
         <tr>
             <td valign='center' width='125' height="120" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="107" height="90" alt="logo-01"/>                 
             </td>        
             <td align='center' width="675" style="font-family: Times New Roman; font-size: 28px">
                 <font color="#2F4F4F">
                    <b>People's Bankruptcy Software</b>
                 </font>
             </td>              
         </tr>    
    </table>
    <br>
    <table width='820'>
    <tr><td>        
        <table border="0" width="820" style="background-color: lightgrey">  
            <tr>
            <table border="0" width="820" style="background-color: #a6a6a6">
                <tr>
                    <td width="150" height="35" align="center"  style="background-color: #737379">
                        <font  color="white" size="5" >
                                Please select 3 security question</b>
                        </font>
                    </td>
                </tr>                   
            </table>
            </tr> 
            <tr >
                <Form Name="loginform" Method="POST"  Action="insetUserDb.jsp" >
                <td style="background-color: lightgrey;" align="center" vlign="center" height="300">      
                               <table border="0" width="560" height="400" style="background-color: white">  
                                    <tr>
                                        <td colspan="2" align="center" height="40" valign="center" style="font-family: Times New Roman; font-size: 20px;"  >
                                            <font color="black">
                                            Fields marked with a red asterisk (<font color="red">*</font>) are required
                                            </font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="left" height="40" valign="center" style="font-family: Times New Roman; font-size: 20px" >
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <font color="black">Question 1<font color="red">*</font>:</font>                                             
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;<select name="Question1" style="line-height: 18px; font-size:18px" >
                                                <option >Select Question</option>
                                                <option value="What was the name of your high school?">What was the name of your elementary / primary school?</option>
                                                <option value="In what city/town does your nearest sibling live?">In what city or town does your nearest sibling live?"</option>
                                                <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                                                <option value="In what city was your father born?">In what city was your father born?</option>
                                                <option value="What the name your favorite food?">What is the name of your favorite food?</option>
                                                <option value="What was the of your first car?">What was the of your first car?</option>
                                                <option value="What month were you married in?">What month were you married in?</option>
                                                <option value="What's your mother's middle name?">What's your mother's middle name?</option>
                                                <option value="What's the name of your first born?">What's the name of your first born?</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  align="left" height="40" valign="top" style="font-family: Times New Roman; font-size: 20px"  >
                                            <font style="font-family:  Times New Roman; font-size: 18px">
                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Answer 1:
                                            </font>
                                            <input type="text" name="Answer1" value="" size="15"  required/>                               	
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="left" height="40" valign="center" style="font-family: Times New Roman; font-size: 20px" >
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <font color="black">Question 2<font color="red">*</font>:</font>                                             
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;<select name="Question2" style="line-height: 18px; font-size:18px" >
                                                <option >Select Question</option>
                                                <option value="What is the first name of the best friend?">What is the first name of the best friend?</option>
                                                <option value="What was the name of your high school?">What was the name of your elementary / primary school?</option>
                                                <option value="In what city or town does your nearest sibling live?">In what city or town does your nearest sibling live?"</option>
                                                <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                                                <option value="In what city was your father born?">In what city was your father born?</option>
                                                <option value="What the name your favorite food?">What is the name of your favorite food?</option>
                                                <option value="What was the of your first car?">What was the of your first car?</option>
                                                <option value="What month were you married in?">What month were you married in?</option>
                                                <option value="What's your mother's middle name?">What's your mother's middle name?</option>
                                                <option value="What's the name of your first born?">What's the name of your first born?</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  align="left" height="40" valign="top" style="font-family: Times New Roman; font-size: 20px"  >
                                            <font style="font-family:  Times New Roman; font-size: 18px">
                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Answer 2:
                                            </font>
                                            <input type="text" name="Answer2" value="" size="15"  required/>                               	
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="left" height="40" valign="center" style="font-family: Times New Roman; font-size: 20px" >
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <font color="black">Question 3<font color="red">*</font>:</font>                                             
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;<select name="Question3" style="line-height: 18px; font-size:18px" >
                                                <option >Select Question</option>
                                                <option value="What is the first name of the best friend?">What is the first name of the best friend?</option>
                                                <option value="What was the name of your high school?">What was the name of your elementary / primary school?</option>
                                                <option value="In what city or town does your nearest sibling live?">In what city or town does your nearest sibling live?"</option>
                                                <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                                                <option value="In what city was your father born?">In what city was your father born?</option>
                                                <option value="What the name your favorite food?">What is the name of your favorite food?</option>
                                                <option value="What was the of your first car?">What was the of your first car?</option>
                                                <option value="What month were you married in?">What month were you married in?</option>
                                                <option value="What's your mother's middle name?">What's your mother's middle name?</option>
                                                <option value="What's the name of your first born?">What's the name of your first born?</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  align="left" height="40" valign="top" style="font-family: Times New Roman; font-size: 20px"  >
                                            <font style="font-family:  Times New Roman; font-size: 18px">
                                                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Answer 3:
                                            </font>
                                            <input type="text" name="Answer3" value="" size="15"  required/>                               	
                                        </td>
                                    </tr>
                               </table>         
                            </td>
                        </tr>
                        <tr >
                              <td colspan='2' height="45" align="center" style="background-color: #737379;">
                                    <input type="submit" value="CONTINUE" 
                                        style="color: white; 
                                        height: 30px; width: 130px; 
                                        background-color: #737379;" />
                                    
                                    <input type="button" value="CANCEL" 
                                        onclick="window.location.href='javascript:history.back()'" 
                                        style="color: white; 
                                        height: 30px; width: 130px; 
                                        background-color: #737379;" />
                              </td>
                        </tr>        
                </form>
                </table>  
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
    <div align="center">
        <p > <font size="3" color="black"><b>2009 &copy; by RussWare, Inc | Privacy Policy</b></font></p>
    </div>
</td>
</tr>
<table>
</center>
</body>
</html>