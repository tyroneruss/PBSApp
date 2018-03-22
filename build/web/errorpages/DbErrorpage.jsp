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
  <link rel="stylesheet" href="../css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
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
</head>
<body style="background-color: 	#e6e6e6">
<center>  
    <table border="0" width='825'>
         <tr >
             <td valign='center' align='left' height="70" width="30%" style="background-color: #e6e6e6">
                 <img src="../images/PBSLogo1.0.jpg" width="170" height="70"   alt="PBS Logo"/>
             </td>        
             <td align='center' height="70" width="70%" style="font-family: Times New Roman; font-size: 21px">
                 <font color="#2F4F4F">
                 <b>Chapter 7 Bankruptcy - Voluntary Petition</b>
                 </font>
             </td>        
         </tr>    
     </table>
    <br>
    <table width='825'>
    <tr><td>
    <div class="tabbable">
        <ul class="tabs">
            <li><a href="#tab-1">Debtors</a></li>
            <li><a href="#tab-2">Creditors</a></li>
            <li><a href="#tab-3">Income and Assets</a></li>
            <li><a href="#tab-4">Liability and Expenses</a></li>
            <li><a href="#tab-5">Case Management</a></li>
            <li><a href="#tab-6">File Management</a></li>
        </ul>
            <div id='tab-1' class="tab">      
            <table border="0" width="825" style="background-color: lightgrey">  
                <tr>
                     <td colspan="4" height="40" valign="center" align="center" 
                         style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                         <font color="#2F4F4F" size="4">
                             <b>Debtor Details</b>
                         </font>
                     </td>
                </tr> 
                <tr> <!-- Remove this section  -->
                      <td colspan="4"  height="100" width="100" style="background-color: white">
                         <font color="red" size="4">
                            &nbsp;&nbsp;Database is temporarily not available ... please try again later
                         </font>
                      </td>
                </tr>
                <tr >
                    <td  colspan="4" align="bottom" height="40" style="background-color: aliceblue">
                        &nbsp;&nbsp;<input onclick="window.location.href='../home/index.html'"  
                                           type="button" value="Save & Exit" 
                        style="height:30px;width: 90px" />
                        &nbsp;&nbsp;<font color="red"><b>*</b></font> is a required field.
                         <br> 
                    </td> 
                <tr>         
       </table>
                <div align='center'>
                    <p > <font color="aliceblue">2009 &copy; by Russ Consulting Services, Inc | Privacy Policy</font></p>
                </div>
                
       </div>
   
            <!-- Next Tab  -->
            <div id="tab-2" class="tab">
                
                <div >
                    <p > <font color="aliceblue">2009 &copy; by Russ Consulting Services, Inc | Privacy Policy</font></p>
                </div>
                
            </div>
            
            <!-- Next Tab  -->
            <div id="tab-3" class="tab">

                <div >
                    <p > <font color="aliceblue">2009 &copy; by Russ Consulting Services, Inc | Privacy Policy</font></p>
                </div>
                
            </div>

            <!-- Next Tab  -->
            <div id="tab-4" class="tab">

                <div >
                    <p > <font color="aliceblue">2009 &copy; by Russ Consulting Services, Inc | Privacy Policy</font></p>
                </div>
                
            </div>

            <!-- Next Tab  -->
            <div id="tab-5" class="tab">
                
                <div >
                    <p > <font color="aliceblue">2009 &copy; by Russ Consulting Services, Inc | Privacy Policy</font></p>
                </div>
            </div>

            <!-- Next Tab  -->
            <div id="tab-6" class="tab">
                Tab 6 Contents
            </div>
          </div>
     </div>
    </td>
    </tr>
    </table>
</center>
</body>
</html>