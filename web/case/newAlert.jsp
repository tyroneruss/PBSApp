<%-- 
    Document   : newAlert
    Created on : Feb 3, 2017, 1:16:19 AM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <style type=”text/css"> 
        .web_dialog_overlay { position: fixed; top: 0; right: 0; bottom: 0; 
                             left: 0; height: 100%; width: 100%; margin: 0; 
                             padding: 0; background: #000000; opacity: .15; 
                             filter: alpha(opacity=15); -moz-opacity: .15; 
                             z-index: 101; display: none; } .web_dialog 
                            { display: none; position: fixed; width: 380px; 
                              height: 200px; top: 50%; left: 50%; margin-left: -190px; 
                              margin-top: -100px; background-color: #ffffff; 
                              border: 2px solid #336699; padding: 0px; z-index: 102; 
                              font-family: Verdana; font-size: 10pt; } .web_dialog_title
                            { border-bottom: solid 2px #336699; background-color: #336699; 
                              padding: 4px; color: White; font-weight:bold; } .web_dialog_title a 
                            { color: White; text-decoration: none; } .align_right { text-align: right; } 
    </style>

    <script type="text/javascript"> $(document).ready(function () { $("#btnShowSimple").click(function (e) { ShowDialog(false); 
        e.preventDefault(); }); $("#btnShowModal").click(function (e) { ShowDialog(true); 
        e.preventDefault(); }); $("#btnClose").click(function (e) { HideDialog();
        e.preventDefault(); }); $("#btnSubmit").click(function (e) { var brand = $("#brands input:radio:checked").val(); 
        $("#output").html("<b>Your favourite restaurant: </b>" + brand); HideDialog(); 
        e.preventDefault(); }); });

        function ShowDialog(modal) { $("#overlay").show(); $("#dialog").fadeIn(300); 

        if (modal) { $("#overlay").unbind("click"); } 
        else { $("#overlay").click(function (e) { HideDialog(); }); } } 

        function HideDialog() 
        { 
          $("#overlay").hide(); 
          $("#dialog").fadeOut(300); 
        } 

    </script>


    <body>
        <br>
        <h3>JavaScript Popup Window</h3> <input type="button" id="btnShowSimple" 
        value="Simple Dialog" /> <input type="button" id="btnShowModal" value="Modal Dialog" /> 
        <br /><br /> <div id="output"></div> <div id="overlay" class="web_dialog_overlay"></div> 
        
        <div id="dialog" class="web_dialog"> 
        <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0"> 
            <tr> 
                <td class="web_dialog_title">Online Survey</td> 
                <td class="web_dialog_title align_right"> <a href="#" id="btnClose">Close</a> </td> 
            </tr> 
            <tr> 
                <td> </td> 
                <td> </td> 
            </tr> 
            <tr> 
                <td colspan="2" style="padding-left: 15px;"> 
                    <b>Select your favorite restaurant? </b> 
                </td> 
            </tr> 
            <tr> <td> </td> 
                <td> </td> 
            </tr> 
            <tr> 
                <td colspan="2" style="padding-left: 15px;"> 
                    <div id="brands"> <input id="brand1" name="brand" 
                         type="radio" checked="checked" value="Dominos" /> Dominos 
                        <input id="brand2" name="brand" type="radio" value="US Pizza" /> US Pizza 
                        <input id="brand3" name="brand" type="radio" value="Pizza Hut" /> Pizza Hut 
                    </div> 
                </td> 
            </tr> 
            <tr> <td> </td> 
                <td> </td> 
            </tr> 
            <tr> 
                <td colspan="2" style="text-align: center;">
                    <input id="btnSubmit" type="button" value="Submit" /> 
                </td> 
            </tr>        
        </table> 
        </div>
    </body>
</html>
