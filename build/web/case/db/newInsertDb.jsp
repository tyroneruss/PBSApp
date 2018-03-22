<%-- 
    Document   : InsertDebtorDb
    Created on : Nov 5, 2016, 6:31:25 AM
    Author     : tyron
--%>

<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.management.Query"%>
<%@page import="com.sun.xml.registry.uddi.bindings_v2_2.Contact"%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <%      
        Object AT  = session.getAttribute( "theAssignTo" );     
        Object CP  = session.getAttribute( "theChapter"); 
        Object JT  = session.getAttribute( "theJoint" );        
        Object CN  = session.getAttribute( "theCaseNumber" ); 

        Object FN  = session.getAttribute("theFirstname"); 
        Object MN  = session.getAttribute("theMiddlename"); 
        Object LN  = session.getAttribute("theLastname"); 
        Object SF  = session.getAttribute("theSuffix"); 
        
        Object ST1 = session.getAttribute("theAddress1");
        
        Object ST2 = session.getAttribute( "theStreet2");        
        Object CTY = session.getAttribute( "theCity" );
        Object ST  = session.getAttribute( "theState" );
        Object ZIP = session.getAttribute( "theZipcode");

        Object CL  = session.getAttribute( "theCellphone" );
        Object WP  = session.getAttribute( "theWorkphone");
        Object HP  = session.getAttribute( "theHomephone" );                

        Object DOB  = session.getAttribute( "theDOB" ); 
              
        Object AGE  = session.getAttribute( "theAge" );   
        Object GD   = session.getAttribute( "theGender" );  
        Object SSN  = session.getAttribute( "theSSN" );                 
       
        Object UserID = session.getAttribute("userid");
        
    try 
        
        {
        String connectionURL = "jdbc:mysql://localhost:3306/pbsdb";
        Class.forName("com.mysql.jdbc.Driver").newInstance();            

        Connection connection = DriverManager.getConnection(connectionURL,"root", "rhouse11");

        Statement statement = connection.createStatement();
        
        String smtInsertProfile = "INSERT INTO profile "
                                +       "(FirstName,MiddleName,LastName,Suffix,Street1,"
                                +       " Street2,City,State,ZipCode,Workphone,MobilePhone,HomePhone,Age,"
                                +       " Gender,SocialSecurityNo,DateOfBirth,LastUpdate)"
                                + " Values('" + FN + "','" + MN + "','" + LN + "','" + SF  + "','" + ST1 + "','" + ST2 + "','" +  CTY + "','" + ST + "','" + ZIP
                                +           "','" + WP + "','" + CL + "','" + HP + "'," + AGE + ",'" + GD + "','" + SSN +  "','" + DOB + "',now())";    
        
        statement.executeUpdate(smtInsertProfile);
        // out.println(smtInsertProfile + "\n");  
              
        String smtInsertDebtor = "INSERT INTO debtor (ProfileID,NumNoLocations,ReceivedCounselingCert"
                                    + ",CertAskCounseling,ReceivedBriefing,NotRequiredReceiveBriefing,InCapacity,Disability,LastUpdate)"
                                    + " Values((select MAX(ProfileID) from profile),1,'','','','','','',now())";    
        
        statement.executeUpdate(smtInsertDebtor);
         // out.println(smtInsertDebtor + "\n");  
        
        
        String smtInsertCase = "INSERT INTO cases(AssignTo,Debtor1,CaseNumber,Chapter_filing,Joint,"
                               + "Active,Status,CreatedByID,CreatedDate,ModifiedDate) "
                               + "Values(" + AT + ",(select MAX(DebtorID) from debtor),'" 
                               + CN + "'," + CP + ",'" + JT + "','Yes','New'," + UserID + ",now(),now())";    
                          
        statement.executeUpdate(smtInsertCase);
        // out.println(smtInsertCase);  
        
        }catch(Exception ex){
           out.println("Unable to access database");
           // response.sendRedirect("../erroorpages/DbErrorpage.jsp");
        }
     %>      

    </head>
    <body>
        <br>
        <h2>Inserted record successfully!</h2>
        <% response.sendRedirect("../listmycase1-1.jsp"); %>
    </body>

