<%-- 
    Document   : InsertDebtorDb
    Created on : Nov 5, 2016, 6:31:25 AM
    Author     : tyron
--%>

<%@page import="java.sql.ResultSet"%>
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
        String startDateStr = request.getParameter("BirthDate");

    try {
        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();
        
        String smtFindProfile = "SELECT ProfileID FROM debtor "
                              + " WHERE DebtorID=" + ID;
        
        out.println(smtFindProfile);
        ResultSet resultset = statement.executeQuery(smtFindProfile);
        // out.println("Debtor Query: " + smtInsertDebtor);  

       if (resultset.next()) {
            out.println(resultset.getString("ProfileID"));
    %>
    </head>
    <body>
        <br>
        <h2>Test ID: <%= resultset.getString(1) %></h2>
    
    
        <% // response.sendRedirect("bankapp1-1.jsp"); 
    
        }
       }catch(Exception ex){
           out.println("Unable to access database");
           response.sendRedirect("../erroorpages/DbErrorpage.jsp");
        }
     %>      

    </body>
</html>
