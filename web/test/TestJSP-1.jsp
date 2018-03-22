<%-- 
    Document   : TestJSP-1
    Created on : Feb 3, 2017, 2:55:02 AM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <%
        String url = PortalUtil.getPageUrl(ScopedServletUtils.getOuterR equest(getRequest())
        ,
        getResponse(), PortalPageConstants.ADVISER_SEARCH_RESULTS_PAGE
        , null);


        getRequest().setAttribute("url", url);
        getRequest().setAttribute("popup", "true");

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>


    </body>
</html>
