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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\r');
      out.write('\n');

	String basePath = request.getContextPath();
	String easyUIHome = basePath+"/easyui-1.3.2";

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(easyUIHome);
      out.write("/themes/black/easyui.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(easyUIHome);
      out.write("/themes/icon.css\">\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.print(easyUIHome);
      out.write("/jquery-1.8.0.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.print(easyUIHome);
      out.write("/jquery.easyui.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.print(easyUIHome);
      out.write("/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<title>雨幕潇潇</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"easyui-layout\">\r\n");
      out.write("\t\t<div data-options=\"region:'north'\" style=\r\n");
      out.write("\t\t\t\t\"height:50px;text-align: center;vertical-align: middle;\">\r\n");
      out.write("\t\t\t雨幕潇潇的小屋\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div data-options=\"region:'south',split:true\" style=\r\n");
      out.write("\t\t\t\t\t\t\"height:50px;text-align: center;vertical-align: middle;\">\r\n");
      out.write("\t\t\tCopyright © 2010-2013 www.yumuxiaoxiao.com\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div data-options=\"region:'east',split:true\" style=\"width:260px;\">\r\n");
      out.write("\t\t\t<div id=\"calendar\" class=\"easyui-calendar\" style=\"width:250px;height:180px;\"></div>  \r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div data-options=\"region:'west',split:true\" title=\"我的菜单\" style=\"width:230px;\">\r\n");
      out.write("\t\t\t<div class=\"easyui-accordion\" data-options=\"fit:true,border:false\">\r\n");
      out.write("\t\t\t\t<div title=\"系统结构\" style=\"padding:10px;\" >\r\n");
      out.write("\t\t\t\t\t<ul class=\"easyui-tree\" data-options=\"url:'tree_data1.json',animate:true,dnd:true\"></ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div title=\"商品出售\" style=\"padding:10px;\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div title=\"博客分享\" data-options=\"selected:true\" style=\"padding:10px;\">\r\n");
      out.write("\t\t\t\t\tcontent2\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div title=\"留言版\" style=\"padding:10px\">\r\n");
      out.write("\t\t\t\t\tcontent3\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div data-options=\"region:'center',title:'我的地盘'\">\r\n");
      out.write("\t\t\t<div class=\"easyui-tabs\" data-options=\"fit:true,border:false,plain:true\">\r\n");
      out.write("\t\t\t\t<div title=\"首页\" data-options=\"href:'_content.html'\" style=\"padding:10px\"></div>\r\n");
      out.write("\t\t\t\t<div title=\"表格\" style=\"padding:5px\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("</body>\r\n");
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
