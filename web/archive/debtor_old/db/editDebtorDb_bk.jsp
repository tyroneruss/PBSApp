<%-- 
    Document   : InsertDebtorDb
    Created on : Nov 5, 2016, 6:31:25 AM
    Author     : tyron
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.management.Query"%>
<%@page import="com.sun.xml.registry.uddi.bindings_v2_2.Contact"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

     <%    
        String ID = request.getParameter( "DebtorID" );     
        String GD = request.getParameter( "Gender" );     
        String FN = request.getParameter( "FirstName" );     
        String MN = request.getParameter( "MiddleName" );
        String LN = request.getParameter( "LastName" );
        String SX = request.getParameter( "Suffix" );
        String ST1 = request.getParameter( "Street1" );
        String ST2 = request.getParameter( "Street2" );
        String CT = request.getParameter( "City" );
        String ST = request.getParameter( "State" );
        String ZP = request.getParameter( "ZipCode" );
        String WP = request.getParameter( "WorkPhone" );
        String MP = request.getParameter( "MobilePhone" );
        String HP = request.getParameter( "HomePhone" );
        String SN = request.getParameter( "SocialSecurityNo" ); 

// Format Date of Birth and Calculate Age
        String startDateStr = request.getParameter("BirthDate");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        //surround below line with try catch block as below code throws checked exception
        Date startDate = sdf.parse(startDateStr);
        String DOB = sdf.format(startDate);

        int yearDOB = Integer.parseInt(DOB.substring(0, 4));
        int monthDOB = Integer.parseInt(DOB.substring(5, 7));
        int dayDOB = Integer.parseInt(DOB.substring(8, 10));

        DateFormat dateFormat = new SimpleDateFormat("yyyy");
        java.util.Date date = new java.util.Date();
        int thisYear = Integer.parseInt(dateFormat.format(date));

        dateFormat = new SimpleDateFormat("MM");
        date = new java.util.Date();
        int thisMonth = Integer.parseInt(dateFormat.format(date));

        dateFormat = new SimpleDateFormat("dd");
        date = new java.util.Date();
        int thisDay = Integer.parseInt(dateFormat.format(date));

        int AGE = thisYear - yearDOB;

        if (thisMonth < monthDOB) {
            AGE = AGE - 1; 
    }

      if (thisMonth == monthDOB && thisDay < dayDOB) {
            AGE = AGE - 1;
    }
   
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();
        
        String smtFindProfile = "SELECT * FROM profile "
                              + " WHERE ProfileID=" + 
        

//        String smtInsertProfile = "UPDATE INTO profile (FirstName,MiddleName,LastName,Suffix,"
//                          + " Street1,Street2,City,State,ZipCode,WorkPhone,MobilePhone,"
//                          + " HomePhone,Age,Gender,SocialSecurityNo,DateOfBirth, LastUpdate)" 
//                          + " VALUES ('" + FN + "','" + MN + "','" + LN + "','" + SX + "','" + ST1 
//                          + "','" + ST2 + "','" + CT + "','" + ST + "','" + ZP  + "','" + WP  
//                          + "','" + MP  + "','" + HP + "'," + AGE + ",'" + GD + "','"  + SN + "','" + DOB + "',now())";     


       //statement.executeUpdate(smtInsertProfile);
       //out.println("Profile Query: " + smtInsertProfile);  
           
       String debtortype = "Debtor 1";
       int CaseID = 0;
               
       String smtInsertDebtor = "INSERT INTO debtor (ProfileID,CaseID,Debtor)" 
                          + " VALUES ((select MAX(ProfileID) from profile)," + CaseID + ",'" + debtortype + "')";     
       
       out.println("    ");  
       statement.executeUpdate(smtInsertDebtor);
       out.println("Debtor Query: " + smtInsertDebtor);  

       }catch(Exception ex){
           out.println("Unable to access database");
           response.sendRedirect("../erroorpages/DbErrorpage.jsp");
        }
     %>      

    </head>
    <body>
        <br>
        <h2>Test page</h2>
        <% // response.sendRedirect("bankapp1-1.jsp"); %>
    </body>
</html>
