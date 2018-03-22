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
    <table border="0" width='825' style="background-color: lightgrey">
         <tr >
             <td valign='center' align='left' width="20%" style="background-color: lightgrey">
                 <img src="../images/main/PBSLogo1.0.jpg" id="pbslogo"  alt="PBS Logo"/>
             </td>        
             <td align='center' width="57%" style="font-family: Times New Roman; font-size: 20px">
                 <font color="#2F4F4F">
                 <b>Chapter 7 Bankruptcy</b>
                 </font>
             </td>        
             <td valign="top" align="left" width="23%" >
                <font  color="#2F4F4F" size="1" >
                <b>Logged in as: Tyrone Russ
                <br>Role: Client Manager&nbsp;&nbsp;
                 </font>
                <input type="button" id="logoutbutton" value="Logout"  
                       onclick="window.location.href='../user/logoutpage.jsp'" />                    
              </td>        
         </tr>    
     </table>
    <br>
    <table width='825'>
    <tr><td>        
        <table border="0" width="825" style="background-color: white">  
            <tr>
                <td colspan="4" width="50%" height="50" valign="center" style="background-color: lightgrey" >
                    <img src="../images/nav/Dashboard-03.jpg" alt="Dashboard-Logo"/>                      
                </td>
            </tr> 
            <tr >
                <td >
        <div class="tabbable">
            <ul class="tabs">
                <li><a href="#tab-1">Debtors</a></li>
                <li><a href="#tab-2">Creditors</a></li>
                <li><a href="#tab-3">Income and Assets</a></li>
                <li><a href="#tab-4">Liability and Expenses</a></li>
                <li><a href="#tab-6">File Management</a></li>
                <li><a href="#tab-6">Case Management</a></li>
            </ul>           
                     
        <div id='tab-1' class="tab">   
            <form name="DebtorForm1-1" METHOD=POST ACTION="db/insertDebtor.jsp">          
            <table border="0" width="825" style="background-color: lightgrey">  
                     <td colspan="1" height="40" valign="center" align="center" 
                         style="background-color: aliceblue; font-family: Times New Roman; font-size: large" >
                         <font color="#2F4F4F" size="4">
                             <b>Edit Debtor's Profile</b>
                         </font>
                     </td>
                     <td colspan="3"  style="background-color: aliceblue;" >
                     </td>
                </tr> 
                      <tr> <!-- first TR row --> 
                          <td width="60%"> <!-- first TD col -->  
                           <!-- Profile table --> 
                            <%

                             String debtorID = request.getParameter( "id" );
                             
                             try {
                                 String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
                                 Class.forName("com.mysql.jdbc.Driver").newInstance();            

                                 Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");
                                 Statement statement = connection.createStatement();

                                 String  Query = "SELECT Gender, FirstName, MiddleName, LastName, Suffix, Street1, Street2,"
                                                + " City, State, Zipcode, WorkPhone, MobilePhone, "
                                                + " HomePhone, Age, SocialSecurityNo, DateOfBirth "
                                                + " FROM debtor, profile "
                                                + " WHERE DebtorID=" + debtorID
                                                + " AND debtor.ProfileID = profile.ProfileID";

                                 ResultSet resultset = statement.executeQuery(Query);

                                 if (resultset.next()) {                            
                            %>
                          <table border="0">
                              <tr >
                                    <td colspan="4" width="30%" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                        <input type="hidden" name="DebtorID" value=<%= request.getParameter("id")%> />                                   
                                        &nbsp;<font color="red">*</font>Gender:
                                    <%  if(resultset.getString(2) == "female") { %>
                                            <input type="radio" name="Gender" value="female" checked="checked" />Female  
                                            <input type="radio" name="Gender" value="male" />Male
                                    <%  } else { %>
                                            <input type="radio" name="Gender"  value="female" />Female  
                                            <input type="radio" name="Gender" value="male" checked="checked" />Male
                                    <%  } %>
                                    </td>
                              </tr>
                              <tr >
                                <td width="30%" height="25"  style="font-family: Times New Roman; font-size: 14px">
                                    &nbsp;                                   
                                    <font color="red">*</font>First name:
                                </td>
                                <td width="70%" height="25" >
                                    <input type="text" name="FirstName" value='<%= resultset.getString(2)%>' size="14" />  
                                </td>
                              </tr>
                              <tr>
                                <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                   &nbsp;&nbsp;&nbsp;&nbsp;Middle name:&nbsp;
                                </td>
                                <td width="70%" height="25">
                                    <input type="text" name="MiddleName" value='<%= resultset.getString(3)%>' size="14" />
                                </td>
                              </tr>
                              <tr>
                                <td width="profile30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                    &nbsp;&nbsp;<font color="red">*</font>Last name:
                                </td>
                                <td width="70%" height="25" style="font-family: Times New Roman; font-size: 14px" >
                                    <input type="text" name="LastName" value='<%= resultset.getString(4)%>'  size="14"/>
                                    &nbsp;&nbsp;&nbsp;Suffix:
                                    <select name="Suffix" >
                                        <option  value='<%= resultset.getString(5)%>' >
                                            <%= resultset.getString(5)%>
                                        </option>
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
                                            <input type="text" name="Street1" value='<%= resultset.getString(6)%>' size="31"/>
                                    </td> <!-- End first TD col -->  
                              </tr>
                              <tr>
                                 <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                        &nbsp;&nbsp;<font color="red">*</font>Address 2:
                                 </td>
                                <td width="70%" height="25">
                                        <input type="text" name="Street2" value='<%= resultset.getString(7)%>'  size="31"/>
                                </td> <!-- End first TD col -->  
                              </tr>
                              <tr>
                                  <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                        &nbsp;&nbsp;<font color="red">*</font>City:
                                  </td>
                                  <td width="70%" height="25">
                                        <input type="text" name="City" value='<%= resultset.getString(8)%>'  size="17"/>
                                  </td>
                              </tr>  
                              <tr>
                                  <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                        &nbsp;&nbsp;<font color="red">*</font>State:
                                  <td width="70%" height="25" style="font-family: Times New Roman; font-size: 14px">                                
                                        <select name="State" >
                                            <option value='<%= resultset.getString(9)%>' ><%= resultset.getString(9)%></option>
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
                                        <input type="text" name="ZipCode" value='<%= resultset.getString(10)%>' size="8"/>
                                  </td> <!-- End first TD col -->  
                            </tr>
                            <tr>
                                <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                    &nbsp;&nbsp;<font color="red">*</font>Work Phone:
                                </td>
                                <td width="70%" height="25">
                                    <input type="text" name="WorkPhone" value='<%= resultset.getString(11)%>'  size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                    &nbsp;&nbsp;<font color="red">*</font>Mobile Phone:
                                </td>
                                <td width="70%" height="25">
                                    <input type="text" name="MobilePhone" value='<%= resultset.getString(12)%>'  size="10" />
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                    &nbsp;&nbsp;<font color="red">*</font>Home Phone:
                                </td>
                                <td width="70%" height="25">
                                    <input type="text" name="HomePhone" value='<%= resultset.getString(13)%>'  size="10" />
                                </td>
                            </tr>
                            <tr>
                                  <td width="30%" height="30" style="font-family: Times New Roman; font-size: 14px">
                                    &nbsp;&nbsp;<font color="red">*</font>Social Security #:
                                  </td>
                                  <td width="70%" height="25">
                                    <input type="text" name="SocialSecurityNo" value='<%= resultset.getString(15)%>'  size="12" />
                                  </td> <!-- End first TD col -->  
                              </tr>
                            <tr>
                                <td width="30%" height="25" style="font-family: Times New Roman; font-size: 14px">
                                    &nbsp;&nbsp;<font color="red">*</font>Birthday:
                                </td>
                                <td width="70%" height="25">
                                    <input type="date" name="BirthDate" value=''  size="10" />
                                    &nbsp;&nbsp;<font color="red">*</font>Age:
                                    <input type="text" name="Age" value='<%= resultset.getString(14)%>'   size="10" />
                                </td>
                            </tr>
                          </table>
                          </td>                         
                          <td width="40%"  align='center' style="background-color: white"> <!-- first TD col --> 
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
                                      <td align="left" width="200" height="30" style="background-color: white" style="font-family: Times New Roman; font-size: 8px"> <!-- first TD col -->  
                                            Evaluation completed  
                                      </td> <!-- End first TD col -->   
                                    </tr>
                                    <tr>
                                      <td align="center" width="50" height="30" style="background-color: white" > <!-- first TD col -->  
                                             <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="30" style="background-color: white" style="font-family: Times New Roman; font-size: 8px"> <!-- first TD col -->  
                                            Update Debtor's Profile
                                      </td> <!-- End first TD col -->   
                                    </tr>
                                    <tr>
                                      <td align="center" width="50" height="30" style="background-color: white" > <!-- first TD col -->  
                                             <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="30" style="background-color: white" style="font-family: Times New Roman; font-size: 8px"> <!-- first TD col -->  
                                            Entering Creditors
                                      </td> <!-- End first TD col -->   
                                    </tr>
                                    <tr>
                                      <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                             <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="30" style="background-color: white" style="font-family: Times New Roman; font-size: 10px"> <!-- first TD col -->  
                                            Entering Assets and Income
                                      </td> <!-- End first TD col -->   
                                    </tr>
                                    <tr>
                                      <td align="center" width="50" height="30" style="background-color: white"> <!-- first TD col -->  
                                             <img src="../images/nav/YellowArrow.png" width="25" height="25" alt="chkArrow-01"/>
                                      </td> <!-- End first TD col -->   
                                      <td align="left" width="200" height="30" style="background-color: white" style="font-family: Times New Roman; font-size: 10px"> <!-- first TD col -->  
                                            Liability and Expenses
                                      </td> <!-- End first TD col -->   
                                    </tr>
                                </table>  
                          </td>
                </tr>
                <%
                              }        
                    // connection.close();
                   }catch(Exception ex){
                       out.println("Unable to connect to database.");
                   }
                %>
                <tr>                 
                    <td  colspan="4" height="40" style="background-color: aliceblue">
                        &nbsp;&nbsp;<input type="submit" value="Save"
                                          style="height: 30px; width: 90px "/>
                        &nbsp;&nbsp;<input onclick="window.location.href='javascript:history.back()'"  
                        type="button" value="Cancel" style="height:30px;width: 90px"/>
                        <br> 
                    </td>
                </tr>
            </table>    

        </div>

        <div id='tab-2' class="tab">    
        </div>


        <div id='tab-3' class="tab">    
        </div>


        <div id='tab-4' class="tab">    
        </div>


        <div id='tab-5' class="tab">    
        </div>


        <div id='tab-6' class="tab">    
        </div>

            </td>
            </tr>
            <tr>
                 <td colspan="4" width="50%" height="40" valign="center" align="center" 
                     style="background-color: aliceblue" >
                 </td>
            </tr> 
        </table>
    </td></tr>                 
    </table>    
    <div align="center">
        <p > <font size="3" color="black">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>
    </div>
</center>
</body>
</html>