<%-- 
    Document   : TabTemplate
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
      
  </script>
  
  <title>PBS Dashboard</title>
  
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
      
  </style>
  
</head>
<body style="background-color:  white">
<center>  
<table width="950" style="background-color: lightgrey">
<tr>
<td with="150" border="0" style="background-color: aliceblue">    
</td>
<td width="800" style="background-color: white">
    <table border="0" width='800' style="background-color: lightgrey">
         <tr >
             <td valign='center' width='1020' height="75" id="tdbanner-logo" align='left' width="20%" style="background-color: lightgrey">
                 &nbsp;<img src="../images/main/PBSLogo1.0.jpg" id="pbslogo" alt="PBS Logo"/>
             </td>        
             <td align='center' width="57%" style="font-family: Times New Roman; font-size: 20px">
                 <font color="#2F4F4F">
                 <b>Bankruptcy Software</b>
                 </font>
             </td>        
             <td valign="top" align="left" width="23%" >
              </td>        
         </tr>    
    </table>
    <br>
    <table width='800'>
    <tr><td>        
        <table border="1" width="800" style="background-color: lightgrey">  
            <tr>
            <table border="1" width="800" style="background-color: #a6a6a6">
                <tr>
                    <td width="150" height="35" align="center"  style="background-color: #737379">
                        <font  color="white" size="3" >
                            <b>Please Login</b>
                        </font>
                    </td>
                    <td width="150" align="center" valign="center" >
                        <font  color="white" size="3" >
                        </font>                    
                    </td>
                    <td width="150" align="center" valign="center" >

                    </td>
                    <td colspan="2" width="350" align="right" valign="center" >
                    </td>
                </tr>                   
            </table>
            </tr> 
            <tr>
                <td height="30" align="center" valign="center" style="background-color: aliceblue" >                     
                </td>
            </tr> 
            <tr >
                <td style="background-color: lightgrey;">      
                    <table border="1" width="800" style="background-color: white">  
                        <tr>
                            <td align="left"  width="650"  valign="center" style="background-color: white" >
                                <table border="1" width="650" style="background-color: white">  
                                    <tr>
                                        <td width="30%" height='40' align="right" valign="top" style="background-color: white" >
                                            <b>Email:</b>
                                        </td>
                                        <td width="70%"  align="left" valign="top" style="background-color: white" >

                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30%" height='40' align="right" valign="top" style="background-color: white" >
                                            <b>User name:</b>
                                        </td>
                                        <td width="70%"  align="left" valign="top" style="background-color: white" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30%" height='40' align="right" valign="top" style="background-color: white" >
                                            <b>Password:</b>
                                        </td>
                                        <td width="7%"  align="left" valign="top" style="background-color: white" >
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%" height='40' align="right" valign="top" style="background-color: white" >
                                            <input type="checkbox" name="saveinfo" value="ON" />
                                            
                                        </td>
                                        <td width="60%"  align="left" valign="top" style="background-color: white" >

                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%" height='40' align="right" valign="top" style="background-color: white" >

                                        </td>
                                        <td width="60%"  align="left" valign="top" style="background-color: white" >

                                        </td>
                                    </tr>
                                </table>                       
                            </td>
                        </tr>
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
        <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
    </div>
</td>
</tr>
<table>
</center>
</body>
</html>