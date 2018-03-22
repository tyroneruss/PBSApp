<%-- 
    Document   : TabTemplate
    Created on : Nov 6, 2016, 12:42:06 AM
    Author     : Tyrone
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <title>PBS Login</title>
  
    <script>
        
    function close_wind() 
    { 
      // all event operations 
      window.close ; 
    } 
  
  </script>    
  <style>
      
  </style>
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
         <tr >
             <td valign='center' width='130' height="110" id="tdbanner-logo" align='center' width="20%" 
                 style="background-color: #737379" >
                 <img src="../images/main/pbslogo.jpg" width="107" height="90" alt="logo-01"/>                 
             </td>   
             <td align='center' width="690" style="font-family: Times New Roman;">
                 <font color="#2F4F4F" size="5">
                 <b>People's Bankruptcy Software</b>
                 </font>
             </td>           
         </tr>    
    </table>
    <br>
    <table width='820'>
    <tr><td>        
        <form name="LogoutForm" METHOD=POST ACTION="login.jsp">          
        <table border="0" width="820" style="background-color: lightgrey">  
            <tr>
            <table border="0" width="820" style="background-color: #a6a6a6">
                <tr>
                    <td width="150" height="35" align="left"  style="background-color: #737379">
                        <font  color="white" size="5" >
                            Log Out Message
                        </font>
                    </td>
                </tr>                   
            </table>
            </tr> 
            <tr >
                <td style="background-color: lightgrey;" align="center" vlign="center" height="300">      
                               <table border="0" width="560"  height="300" style="background-color: white">  
                                    <tr>
                                        <td colspan="2" align="center" height="80" valign="center" style="font-family: Times New Roman; font-size: 20px;"  >
                                            <font color="black">
                                            You have been logged out of your account. Please select the Continue 
                                            button to return to the login screen and to completely end your session.
                                            </font>
                                        </td>
                                    </tr>
                               </table>         
                            </td>
                        </tr>
                        <tr >
                              <td colspan='2' height="45" align="center" style="background-color: #737379;">                                    
                                    <input type="submit" value="CONTINUE" 
                                        onClick='close_wind();'
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