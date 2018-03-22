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
        Object userID = session.getAttribute("userid"); 
        
        Object CP  = session.getAttribute("theChapter"); 
        Object JT  = session.getAttribute( "theJoint" );     

        Object GD  = session.getAttribute("theGender"); 
        Object FN  = session.getAttribute("theFirstname"); 
        Object MN  = session.getAttribute("theMiddlename"); 
        Object LN  = session.getAttribute("theLastname"); 
        Object ST1 = session.getAttribute("theStreet1"); 
        Object ST2 = session.getAttribute("theStreet2");        
        Object CTY = session.getAttribute( "theCity" );
        Object ST  = session.getAttribute( "theState" );
        Object ZIP = session.getAttribute( "Zipcode");
        Object AT  = session.getAttribute( "theAssignTo" ); 

        Object Cell  = session.getAttribute( "theCellphone" );
        Object Work  = session.getAttribute( "theWorkphone");
        Object Home  = session.getAttribute( "theHomephone" ); 
                
        String Socialsecurityno = request.getParameter( "SSN1" );
        Socialsecurityno = Socialsecurityno + "-" + request.getParameter( "SSN2" );
        Socialsecurityno = Socialsecurityno  + "-" +  request.getParameter( "SSN3" );
        session.setAttribute("theSSN", Socialsecurityno);
      
     try 
        {
        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();
        

        String smtInsertProfile = "INSERT INTO profile (FirstName,MiddleName,LastName,Suffix,"
                               + "Street1,Street2,City,state,zipcode) "
                               + "Values(''," + CP + ",'" + JT + "','Yes','New','" + AT + "'," 
                               + userID + ",now(),now())";    
        
        // statement.executeUpdate(smtInsertCase);
        

        String smtInsertDebtor = "INSERT INTO debtor (Case_number,Chapter_filing,Joint,"
                               + "Active,Status,Assigned_to,CreatedByID,CreatedDate,ModifiedDate) "
                               + "Values(''," + CP + ",'" + JT + "','Yes','New','" + AT + "'," 
                               + 1006 + ",now(),now())";    
             
        // statement.executeUpdate(smtInsertCase);
        out.println("Insert Case statement: " + smtInsertCase);  

        String smtInsertCase = "INSERT INTO cases(Case_number,Chapter_filing,Joint,"
                               + "Active,Status,Assigned_to,CreatedByID,CreatedDate,ModifiedDate) "
                               + "Values(''," + CP + ",'" + JT + "','Yes','New','" + AT + "'," 
                               + 1006 + ",now(),now())";    

        }catch(Exception ex){
           out.println("Unable to access database");
           // response.sendRedirect("../erroorpages/DbErrorpage.jsp");
        }
     %>      

    </head>
    <body>
        <br>
        <h2>Test page</h2>
        <% // response.sendRedirect("debtor1-2.jsp"); %>
    </body>
</html>
