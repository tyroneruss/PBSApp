<!-- 
    Document   : Home page
    Created on : Oct 19, 2016
    Author     : Tyrone  #e6e6e6
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>People's Bankruptcy Software - Login</title>
  
  <link rel="stylesheet" href="../css/styleuser.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  

</head>
<body style="background-color: lightgrey">
<!-- Start with new border -->
<table border="0" cellpadding="15" cellspacing="0" align="center" style="border:solid 1px #ffffff">
<tr>
<td style="background-color: #e6e6e6">
<table border="0" cellpadding="0" cellspacing="0" width="600px" align="center">
    <tr>
        <td valign="top" rowspan="2">
                         
    <table border="0" width="600px" style="background-color: aliceblue">
       <tr>
            <td height="80" valign="center" align="left"  style="background-color: lightgrey" >
                &nbsp;&nbsp;<img src="../images/main/PBSLogo1.0.jpg" id="pbslogo" alt="PBS Logo"/>
            </td>    
       </tr>
       <tr>
            <td height="25" valign="left" align="center" style="background-color: aliceblue"  >
                <font color="#2F4F4F" size="5">
                    <b>Create User Account<br></b>
                </font>
            </td>
        </tr>
       <tr >
             <td  height="30" align="center" valign='center' align='center'   style="background-color: lightgrey">
                 <font color="#2F4F4F"  size="4">This platform is best used with Chrome or Firefox</font>
             </td>
       </tr>
       <tr>
        <td style="background-color: aliceblue" align="center" vlign="middle">
            <Form Action="securityquestions.jsp" >
            <table border="0">
                <tbody>
                    <tr>
                        <td colspan="2" height="50" align="center" >
                            <font style="font-family: Helvetica; font-size: 18px" color="#2F4F4F">
                            <b>User login Information</b>
                        </td>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 17px">
                                User Email:
                            </font>
                        </td>
                        <td height="30">
                            &nbsp;&nbsp;<input type="text" name="UserName" value="" size="30" required/>
                         </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 17px">
                                Password: &nbsp;
                            </font>
                        </td>
                        <td height="30">
                            &nbsp;&nbsp;<input type="password" name="password1" value="" size="20"  required/>                               
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 17px">
                                Re-type password:                         
                            </font>
                        </td>
                        <td height="30">
                            &nbsp;&nbsp;<input type="password" name="password2" value="" size="20" required/>                               	
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="10">

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="30" align="center" >
                            <font style="font-family: Helvetica; font-size: 18px" color="#2F4F4F">
                            <b> User Information</b>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 17px">
                                Full name:
                            </font>
                        </td>
                        <td height="30">
                            &nbsp;&nbsp;<input type="text" name="FullName" value="" size="20" required/>
                         </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <font style="font-family: Helvetica; font-size: 17px">
                                Email Address: 
                            </font>
                        </td>
                        <td height="30">
                            &nbsp;&nbsp;<input type="text" name="EmailAddress" value="" size="30" required/>                               
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" height="75" style="background-color: aliceblue">                    
                            <input type="button" value="Cancel" onclick="window.location.href='logout.jsp'" 
                                   style="height: 35px; width: 100px"/>                             			
                            <input type="submit" value="Continue" style="height: 35px; width: 100px"/>                             			
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

