<%-- 
    Document   : Bankruptcy - Debitor page
    Created on : Oct 18, 2016, 2:54:59 PM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>People's Bankruptcy Software</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
</head>
<body>
<table border="0" cellpadding="15" cellspacing="0" align="center" >
    <tr>
    <td style="background-color:White">
    <table border="0" cellpadding="0" cellspacing="0" width="970px" align="center">
    <tr>
    <td valign="top" rowspan="2">
    <!-- End Table Code for the border -->                     

    <table border="0" width='1045' style="background-color: lightgrey">
            <tr >
                <td align='left' align="center" width="35"><img src="../images/PBSLogo1.0.jpg" width="180" height="73" alt="PBS Logo"/>
                </td>            
                <td align="center" >
                    <h2> Preparing - Chapter 7 Bankruptcy </h2>
                </td>
            </tr>
    </table>

    <div id="tabs" >
      <ul>
        <li><a href="#tabs-2">Debitors</a></li>
        <li><a href="#tabs-1">Creditors</a></li>
        <li><a href="#tabs-3">Income and Assets</a></li>
        <li><a href="#tabs-3">Liability and Expenses </a></li>
        <li><a href="#tabs-3">Case Management </a></li>
        <li><a href="#tabs-3">File Bankruptcy</a></li>
      </ul>
    
    <div id="tabs-1">
            
<!-- Begin  Tabs  -->
      </div>
      <div id="tabs-2">
    <form name="IdenityForm" action="InsertXML.jsp">
           
    <table border="0" width="1000" style="background-color: lightgrey" style="border-style: solid; border-top: thick double #ff0000;">             
            <tr>
                  <td colspan="3" height="40" valign="center" align="center" style="background-color: aliceblue" style="font-family: Times New Roman;" >
                    <font color="#2F4F4F" size="4">
                    <b>Creditor Information</b>
                    </font>
                  </td>           
                  <table  border="1" style="background-color: lightgrey" width="1000"> 
                      <tr> <!-- first TR row --> 
                          <td width="650"> <!-- first TD col -->  
                           <!-- Profile table --> 
                          <table border="1">
                              <tr>
                                    <td colspan="2" width="370" height="40"> <!-- first TD col -->  
                                        &nbsp;&nbsp;<b>Company name:<input type="text" name="Company" 
                                        value="Entered Company" size="25" readonly="readonly" /></b>
                                    </td> <!-- End first TD col -->  
                              </tr> 
                              <tr>
                                <td width="300" height="40"> <!-- first TD col -->  
                                    <b>&nbsp;&nbsp;&nbsp;<font color="red">*</font>When was the debit incurred:?</b>
                                    <br>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="date" name="txtIncurredDate" value="" size="4"/>
                                </td> <!-- End first TD col -->  
                                <td width="280" height="40"> <!-- first TD col -->  
                                    <b></b>
                                    <input type="text" name="txtMiddlename" value="" size="2" />
                                </td> <!-- End first TD col -->  
                              </tr>
                              <tr>
                                <td width="300" height="40"> <!-- first TD col -->  
                                       &nbsp;<b>&nbsp;&nbsp;<font color="red">*</font>Who incurred the debt?</b><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<select name="Suffix" >
                                        <option>Debitor 1 only</option>
                                        <option>Debitor 2 only</option>
                                        <option>Debitor 1 and 2 only</option>
                                        <option>At least on of the debeitors and another</option>
                                    </select>
                                </td> <!-- End first TD col -->                                    
                                <td align="left" valign="center" width="350" height="40"> <!-- first TD col -->  
                                    <input type="checkbox" style="height:20px;width:20px" name="Chk_CommunityDebt" value="On" />
                                    <b>Check if this claim is for a <br>&nbsp;&nbsp;&nbsp;&nbsp;
                                       &nbsp;&nbsp;&nbsp;community debt</b>
                                </td> <!-- End first TD col -->  
                              </tr>
                              <tr>
                                <td width="640" height="40"> <!-- first TD col -->  
                                    <b>
                                    &nbsp;&nbsp;&nbsp;&nbsp;Is the claim subject to offset?&nbsp;&nbsp;
                                    <input type="radio" name="rdoOffsetClaims" value="" />Yes&nbsp;&nbsp;
                                    <input type="radio" name="rdoOffsetClaims" value="" />No</b>
                                </td> <!-- End first TD col -->  
                              </tr>
                          </table>
                          </td>
                          <td width="350"  align='center' style="background-color: white"> <!-- first TD col --> 
                              <br>
                                <table border="0" style="background: white; border:5px;-moz-border-radius:10px;-webkit-border-radius:10px;" >
                                    <tr>
                                      <td colspan="2" align="center" height="35"  width="275" style="background-color: #1A2042"> <!-- first TD col -->  
                                          <font color="white" ><b>Progress in this section...&nbsp;&nbsp;</b></font>
                                      </td> <!-- End first TD col -->  
                                    </tr>
                                    <tr>
                                      <td align="center" width="50" height="35" style="background-color: white"> <!-- first TD col -->  
                                             <img src="../images/nav/GreenChkArrow.jpg" width="30" height="30" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="35" style="background-color: white"> <!-- first TD col -->  
                                          <b>Evaluation completed</b>
                                      </td> <!-- End first TD col -->   
                                    <tr>
                                    <tr>
                                      <td align="center" width="50" height="35" style="background-color: white"> <!-- first TD col -->  
                                             <img src="../images/nav/GreenChkArrow.jpg" width="30" height="30" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="35" style="background-color: white"> <!-- first TD col -->  
                                          <b>Debitor(s) Profile completed</b>
                                      </td> <!-- End first TD col -->   
                                    <tr>
                                    <tr>
                                      <td align="center" width="50" height="35" style="background-color: white"> <!-- first TD col -->  
                                             <img src="../images/nav/YellowArrow.png" width="30" height="30" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="35" style="background-color: white"> <!-- first TD col -->  
                                          <b>Entering Creditors </b>
                                      </td> <!-- End first TD col -->   
                                    <tr>
                                    <tr>
                                      <td align="center" width="50" height="35" style="background-color: white"> <!-- first TD col -->  
                                             <img src="../images/nav/YellowArrow.png" width="30" height="30" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="35" style="background-color: white"> <!-- first TD col -->  
                                          <b>Assets and Income</b>
                                      </td> <!-- End first TD col -->   
                                    <tr>
                                    <tr>
                                      <td align="center" width="50" height="35" style="background-color: white"> <!-- first TD col -->  
                                             <img src="../images/nav/YellowArrow.png" width="30" height="30" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="35" style="background-color: white"> <!-- first TD col -->  
                                          <b>Liability and Expenses</b>
                                      </td> <!-- End first TD col -->   
                                    <tr>
                                </table>
                              <br>
                               <tr>
                                    <td  colspan="2" style="background-color: white" width="300" height="50"> 
                                        <!-- first TD col -->  
                                        &nbsp;&nbsp;&nbsp;<input type="button" onclick="window.location.href='debitorTab2.jsp'" value="Add Debitor"  style="height:35px;width:110px" />
                                        &nbsp;&nbsp;&nbsp;<input type="button" onclick="window.location.href='creditorTab1.jsp'" value="Next >> "  style="height:35px;width:110px" />
                                        &nbsp;&nbsp;<input type="button" onclick="window.location.href='../home/index.jsp'"  value="Save & Exit" style="height:35px;width:110px"/>
                                    </td> <!-- End first TD col -->  
                               </tr>
                          </td>
            </tr>            
    </table>
    
    </form> 

      </div>
      <div id="tabs-3">
        <p></p>
        <p></p>
      </div>
      <div id="tabs-4">
        <p></p>
        <p></p>
      </div>
      <div id="tabs-5">
          <p></p>  
          <p></p>
      </div>
      <div id="tabs-6">
          <p></p>  
          <p></p>
      </div>
    </div>
    <!-- Bottom Table Code for the border -->
    </td>
    <tr>
    </table>
    </td>
    </tr>
</table>
<!-- Bottom Table Code for the border -->
</body>
</html>
