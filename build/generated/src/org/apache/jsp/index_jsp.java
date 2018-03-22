package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("  \n");
      out.write("  <title>PBS Dashboard</title>\n");
      out.write("  \n");
      out.write("  <script>\n");
      out.write("  \n");
      out.write("  </script>    \n");
      out.write("  <style>\n");
      out.write("      \n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body style=\"background-color:  white\">\n");
      out.write("<center>  \n");
      out.write("<table width=\"1000\" style=\"background-color: lightgrey\">\n");
      out.write("<tr>\n");
      out.write("<td with=\"200\" border=\"0\" style=\"background-color: aliceblue\">    \n");
      out.write("</td>\n");
      out.write("<td width=\"800\" style=\"background-color: aliceblue\">\n");
      out.write("    <table border=\"0\" width='800' style=\"background-color: lightgrey\">\n");
      out.write("         <tr>\n");
      out.write("             <td valign='center' width='120' height=\"115\" id=\"tdbanner-logo\" align='center' width=\"20%\" \n");
      out.write("                 style=\"background-color: #737379\" >\n");
      out.write("                 <img src=\"../images/main/pbslogo.jpg\" width=\"90\" height=\"90\" alt=\"logo-01\"/>                 \n");
      out.write("             </td>        \n");
      out.write("             <td align='center' width=\"850\" style=\"font-family: Times New Roman; font-size: 28px\">\n");
      out.write("                 <font color=\"#2F4F4F\">\n");
      out.write("                    <b>People's Bankruptcy Software</b>\n");
      out.write("                 </font>\n");
      out.write("             </td>              \n");
      out.write("         </tr>    \n");
      out.write("    </table>\n");
      out.write("    <br>\n");
      out.write("    <table width='800'>\n");
      out.write("    <tr><td>        \n");
      out.write("        <table border=\"0\" width=\"800\" style=\"background-color: lightgrey\">  \n");
      out.write("            <tr>\n");
      out.write("            <table border=\"0\" width=\"800\" style=\"background-color: #a6a6a6\">\n");
      out.write("                <tr>\n");
      out.write("                    <td width=\"150\" height=\"35\" align=\"center\"  style=\"background-color: #737379\">\n");
      out.write("                        <font  color=\"white\" size=\"3\" >\n");
      out.write("                            <a href=\"./user/login.jsp\" style=\"color: white;\" >\n");
      out.write("                                <b>Login</b></a>\n");
      out.write("                        </font>\n");
      out.write("                    </td>\n");
      out.write("                    <td width=\"150\" align=\"center\" valign=\"center\" >\n");
      out.write("                        <font  color=\"white\" size=\"3\" >\n");
      out.write("                            <a href=\"\" style=\"color: white;\" >\n");
      out.write("                                <b>Run Evaluation</b></a>\n");
      out.write("                        </font>                    \n");
      out.write("                    </td>\n");
      out.write("                    <td width=\"150\" align=\"center\" valign=\"center\" >\n");
      out.write("                    </td>\n");
      out.write("                    <td colspan=\"2\" width=\"350\" align=\"right\" valign=\"center\" >\n");
      out.write("                    </td>\n");
      out.write("                </tr>                   \n");
      out.write("            </table>\n");
      out.write("            </tr> \n");
      out.write("            <tr >\n");
      out.write("                <td style=\"background-color: lightgrey;\">      \n");
      out.write("                    <table border=\"0\" width=\"800\" height='400' style=\"background-color: white\">  \n");
      out.write("                        <tr>\n");
      out.write("                            <td align=\"center\"  width=\"800\"  valign=\"center\" style=\"background-color: white\" >\n");
      out.write("                                <table border=\"0\" width=\"650\" style=\"background-color: white\">  \n");
      out.write("                                    <tr >\n");
      out.write("                                          <td colspan=\"2\" width=\"30%\" height='50' align=\"center\" valign=\"center\" style=\"background-color: white; font-family: Times New Roman;\" >\n");
      out.write("                                              <font color=\"#404040\"  size=\"5\"><b>Items needed when applying for Bankruptcy</b></font>\n");
      out.write("                                          </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td width=\"30%\" height='50' align=\"right\" valign=\"center\" style=\"background-color: white\";>\n");
      out.write("                                            <img src=\"images/main/certicate-01.png\" width=\"60\" height=\"60\" alt=\"Certificate\"/>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td width=\"70%\" height='50'  align=\"left\" valign=\"center\" style=\"background-color: white; font-family: Times New Roman; font-size: 20px\">\n");
      out.write("                                                <h4 style=\"color: #404040;\">&nbsp;&nbsp;Pre-course Bankruptcy Certificate</h4>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td width=\"30%\" height='50' align=\"right\" valign=\"center\" style=\"background-color: aliceblue\" >\n");
      out.write("                                            <img src=\"images/main/blue_images_folder.png\" width=\"60\" height=\"60\" alt=\"Certificate-64\"/>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td width=\"70%\" height='50'  align=\"left\" valign=\"center\" style=\"background-color: white; font-family: Times New Roman; font-size: 20px\">\n");
      out.write("                                                <h4 style=\"color: #404040;\">&nbsp;&nbsp;List of all  Creditors</h4>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td width=\"30%\" height='50' align=\"right\" valign=\"top\" style=\"background-color: white\" >\n");
      out.write("                                            <img src=\"images/main/fees.png\" width=\"65\" height=\"65\" alt=\"Certificate-64\"/>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td width=\"70%\" height='50'  align=\"left\" valign=\"center\" style=\"background-color: white; font-family: Times New Roman; font-size: 20px\">\n");
      out.write("                                            <b><h4 style=\"color: #404040;\">&nbsp;&nbsp;Current Monthly Household Expenses</b></h4>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td width=\"30%\" height='50' align=\"right\" valign=\"top\" style=\"background-color: white\" >\n");
      out.write("                                            <img src=\"images/main/billmoney.png\" width=\"65\" height=\"65\" alt=\"Certificate-64\"/>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td width=\"70%\" height='50'  align=\"left\" valign=\"center\" style=\"background-color: white; font-family: Times New Roman; font-size: 20px\">\n");
      out.write("                                                <b><h4 style=\"color: #404040;\">&nbsp;&nbsp;Current Income and Assets</b></4>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                </table>                       \n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>                       \n");
      out.write("                </td>\n");
      out.write("            </tr> \n");
      out.write("            <tr >\n");
      out.write("                  <td colspan='3' height=\"40\" style=\"background-color: lightgrey;\">\n");
      out.write("\n");
      out.write("                  </td>\n");
      out.write("            </tr>        \n");
      out.write("       </table>    \n");
      out.write("    </td>                  \n");
      out.write("    </tr>           \n");
      out.write("    </table>        \n");
      out.write("    <div align=\"center\">\n");
      out.write("        <p > <font size=\"3\" color=\"black\">2009 &copy; by RussWare, Inc | Privacy Policy</font></p>\n");
      out.write("    </div>\n");
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<table>\n");
      out.write("</center>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
