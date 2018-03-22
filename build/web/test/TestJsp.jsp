<%-- 
    Document   : TestJsp
    Created on : Jan 7, 2017, 2:27:44 PM
    Author     : tyron
--%>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<%
    int current2 = 0;
    if(request.getParameter("current2") != null) {
          current2 = Integer.parseInt(request.getParameter("current2"));
    }
    int skip2 = 2;

    String action2 = "";
    if(request.getParameter("action2") != null) {
      action2 = request.getParameter("action2");
    }
    if ( action2.equals("next2") ) {
      current2 += skip2;
    }
    if ( action2.equals("prev2") ) {
      current2 -= skip2;
    }
%>

    </BODY>
</HTML>