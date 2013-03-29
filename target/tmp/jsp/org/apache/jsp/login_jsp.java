package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta name=\"save\" content=\"history\" />\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"/favicon.ico\" />\r\n");
      out.write("<title>登录雨幕潇潇的网站</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"https://res.mail.qq.com/zh_CN/htmledition/style/ptlogin13363c.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"https://res.mail.qq.com/zh_CN/htmledition/js/qmlogin144e76.js\"></script>\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"header\">\r\n");
      out.write("\t\t\t<a class=\"logo\" href=\"/\">QQ邮箱</a>\r\n");
      out.write("\t\t\t<ul class=\"header_link\">\r\n");
      out.write("\t\t\t\t<li><a href=\"http://en.mail.qq.com\">English</a>|</li>\r\n");
      out.write("\t\t\t\t<li><a\r\n");
      out.write("\t\t\t\t\thref=\"http://support.qq.com/cgi-bin/beta1/titlelist_simple?pn=0&order=3&fid=350\"\r\n");
      out.write("\t\t\t\t\ttarget=\"_blank\">反馈建议</a>|</li>\r\n");
      out.write("\t\t\t\t<li><a href=\"http://service.mail.qq.com\" target=\"_blank\">帮助中心</a>|</li>\r\n");
      out.write("\t\t\t\t<li><a href=\"http://exmail.qq.com?referrer=index_top\"\r\n");
      out.write("\t\t\t\t\ttarget=\"_blank\">企业邮箱</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"downError\" class=\"login_msg\" style=\"display: none;\">\r\n");
      out.write("\t\t\t<p>由于加载安全组件失败，为了您的帐号安全，无法正常登录邮箱，解决方法：</p>\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li>按下F5重新刷新页面。</li>\r\n");
      out.write("\t\t\t\t<li>打开浏览器“选项”菜单，选择“Internet选项”，执行清空缓存功能，确定后按F5刷新本页面。</li>\r\n");
      out.write("\t\t\t\t<li>如上述方式仍然无法解决问题，请登录<a href=\"http://maildisk.bbs.qq.com\"\r\n");
      out.write("\t\t\t\t\ttarget=\"_blank\">邮箱论坛通知我们</a>，我们将尽快为您解决。\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"login_container\" id=\"login\">\r\n");
      out.write("\t\t\t<div class=\"login_box\">\r\n");
      out.write("\t\t\t\t<div class=\"logo_title\">\r\n");
      out.write("\t\t\t\t\t<h1>登录QQ邮箱</h1>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"msgContainer\" class=\"login_box_msg\" style=\"display: none;\"></div>\r\n");
      out.write("\t\t\t\t<noscript>\r\n");
      out.write("\t\t\t\t\t<div class=\"login_box_msg noScript\">\r\n");
      out.write("\t\t\t\t\t\t您的浏览器不支持或已经禁止网页脚本，您无法正常登录。<a\r\n");
      out.write("\t\t\t\t\t\t\thref=\"/zh_CN/help/error_noscript.html\" title=\"了解网页脚本限制的更多信息\"\r\n");
      out.write("\t\t\t\t\t\t\ttarget=\"_blank\"><img\r\n");
      out.write("\t\t\t\t\t\t\tsrc=\"https://res.mail.qq.com/zh_CN/htmledition/images/ico_help104474.gif\"\r\n");
      out.write("\t\t\t\t\t\t\tstyle=\"margin: 0 2px;\" align=\"absmiddle\" />如何解除脚本限制</a>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</noscript>\r\n");
      out.write("\t\t\t\t<div class=\"login_box_msg noCookie\" id=\"infobarNoCookie\"\r\n");
      out.write("\t\t\t\t\tstyle=\"display: none\">\r\n");
      out.write("\t\t\t\t\t你的浏览器不支持或已经禁止使用Cookie，导致无法正常登录。请<a\r\n");
      out.write("\t\t\t\t\t\thref=\"http://service.mail.qq.com/cgi-bin/help?subtype=1&&id=7&&no=1001007#chrome\"\r\n");
      out.write("\t\t\t\t\t\ttitle=\"了解Cookie的更多信息\" target=\"_blank\">启用Cookie<img\r\n");
      out.write("\t\t\t\t\t\tsrc=\"https://res.mail.qq.com/zh_CN/htmledition/images/ico_help104474.gif\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"margin: 0 2px;\" align=\"absmiddle\" /></a>后重试。\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div style=\"display: none;\" id=\"auth\" class=\"login_operate auth\">\r\n");
      out.write("\t\t\t\t\t<div id=\"icon_from\"></div>\r\n");
      out.write("\t\t\t\t\t<div id=\"icon_to\"></div>\r\n");
      out.write("\t\t\t\t\t<div id=\"auth_tips\">\r\n");
      out.write("\t\t\t\t\t\t<p>你已登录腾讯相关网站。</p>\r\n");
      out.write("\t\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t\t是否授权以下帐号自动登录<span id=\"appname\">QQ邮箱</span>？\r\n");
      out.write("\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"auth_account\">\r\n");
      out.write("\t\t\t\t\t\t<label id=\"accounts\" class=\"username_immutable\"></label><span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"username_immutable\">@qq.com</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"login_submit\">\r\n");
      out.write("\t\t\t\t\t\t<a id=\"auth_link\" class=\"login_btn_wrapper btn_auth\"\r\n");
      out.write("\t\t\t\t\t\t\thref=\"javascript:;\" target=\"_top\">授权</a><a id=\"canc_link\"\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"login_cancel\" href=\"javascript:;\"\r\n");
      out.write("\t\t\t\t\t\t\tonclick=\"ptui_switch_login();return false;\">取消</a>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div style=\"display: none\" id=\"qlogin\" class=\"qlogin\"></div>\r\n");
      out.write("\t\t\t\t<div class=\"login_operate\" style=\"display: block\" id=\"web_login\">\r\n");
      out.write("\t\t\t\t\t<form id=\"loginform\" onsubmit=\"return QMLogin.checkInput();\"\r\n");
      out.write("\t\t\t\t\t\tmethod=\"post\" name=\"loginform\" target=\"_self\" autocomplete=\"on\">\r\n");
      out.write("\t\t\t\t\t\t<input value=\"522005705\" type=\"hidden\" id=\"aid\" name=\"aid\" /><input\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"4\" type=\"hidden\" id=\"daid\" name=\"daid\" /><input\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"https://mail.qq.com/cgi-bin/login?vt=passport&vm=wpt&ft=ptlogin\"\r\n");
      out.write("\t\t\t\t\t\t\ttype=\"hidden\" name=\"u1\" id=\"u1\" /><input value=\"1\" type=\"hidden\"\r\n");
      out.write("\t\t\t\t\t\t\tname=\"from_ui\" /><input value=\"1\" type=\"hidden\" name=\"ptredirect\" /><input\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"1\" type=\"hidden\" name=\"h\" /><input value=\"快速登录\"\r\n");
      out.write("\t\t\t\t\t\t\tname=\"wording\" id=\"wording\" type=\"hidden\" /><input\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"https://mail.qq.com/zh_CN/htmledition/style/fast_login13ffb2.css\"\r\n");
      out.write("\t\t\t\t\t\t\ttype=\"hidden\" id=\"css\" name=\"css\" /><input value=\"m_ptmail\"\r\n");
      out.write("\t\t\t\t\t\t\ttype=\"hidden\" name=\"mibao_css\" />\r\n");
      out.write("\t\t\t\t\t\t<div class=\"username\">\r\n");
      out.write("\t\t\t\t\t\t\t<label class=\"txt_default\" for=\"uin\" id=\"label_uin\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdefault_txt=\"邮箱帐号或QQ号码\">&nbsp;</label><input\r\n");
      out.write("\t\t\t\t\t\t\t\tonchange=\"QMLogin.judgeVC()\" readonly=\"true\"\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"login_domain\" id=\"domain\" name=\"u_domain\"\r\n");
      out.write("\t\t\t\t\t\t\t\tstyle=\"font-size: 18px;\" value=\"@qq.com\" type=\"text\"\r\n");
      out.write("\t\t\t\t\t\t\t\ttabindex=\"-1\" /><input onblur=\"QMLogin.judgeVC()\"\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"txt alias\" id=\"uin\" name=\"uin\" type=\"text\" tabindex=\"1\"\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue=\"\" /><input id=\"u\" name=\"u\" value=\"\" type=\"hidden\" />\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"password\">\r\n");
      out.write("\t\t\t\t\t\t\t<label class=\"txt_default\" for=\"p\" id=\"label_p\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdefault_txt=\"QQ密码\">&nbsp;</label><input\r\n");
      out.write("\t\t\t\t\t\t\t\tonfocus=\"QMLogin.judgeVC()\" class=\"txt password\" id=\"p\" name=\"p\"\r\n");
      out.write("\t\t\t\t\t\t\t\ttype=\"password\" tabindex=\"2\" />\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"capTip\" class=\"captips\" style=\"display: none;\">大写锁定已打开</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"about_password\">\r\n");
      out.write("\t\t\t\t\t\t\t<input class=\"remerber_password\" type=\"checkbox\"\r\n");
      out.write("\t\t\t\t\t\t\t\tid=\"remerber_password\" tabindex=\"5\" /><label\r\n");
      out.write("\t\t\t\t\t\t\t\tfor=\"remerber_password\">记住登录状态</label><a class=\"forgetPassword\"\r\n");
      out.write("\t\t\t\t\t\t\t\thref=\"/cgi-bin/loginpage?t=getpwdback\" target=\"_blank\">忘记密码？</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"divSavePassWarning\" class=\"red\" style=\"display: none;\">选择此项后，下次将自动登录邮箱（本机两周内有效）。为了您的信息安全，请不要在网吧或公用电脑上使用。</div>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"verifyinput\" class=\"vfcode\" style=\"display: none\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"vfcodeinput\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label class=\"txt_default\" for=\"verifycode\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tid=\"label_verifycode\" default_txt=\"验证码\">&nbsp;</label><input\r\n");
      out.write("\t\t\t\t\t\t\t\t\tclass=\"txt\" id=\"verifycode\" value=\"\" name=\"verifycode\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\ttype=\"text\" tabindex=\"4\" placeholder=\"\" maxlength=\"6\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tautocomplete=\"off\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"verifytip\" class=\"verifytip\">按右图填写，不区分大小写</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"gray vfcode_img\" style=\"\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<img id=\"imgVerify\" onclick=\"QMLogin.changeImg();\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tonload=\"QMLogin.onLoadVC();\" alt=\"验证码\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"vfcode_change\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a id=\"verifyshow\" id=\"changeimg_link\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\thref=\"javascript:QMLogin.changeImg();\">看不清楚？换一个</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"login_submit\" style=\"\">\r\n");
      out.write("\t\t\t\t\t\t\t<a class=\"login_btn_wrapper\" href=\"javascript:;\"><input\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"login_btn\" id=\"btlogin\" name=\"btlogin\" type=\"submit\"\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue=\"登录\" tabindex=\"5\" /></a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div style=\"display: none;\" id=\"switch\" class=\"lineright\"\r\n");
      out.write("\t\t\t\t\tonmouseup=\"QMLogin.switchMode()\"></div>\r\n");
      out.write("\t\t\t\t<div class=\"login_tips\">\r\n");
      out.write("\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t<span class=\"gray\">还没有QQ邮箱？</span><a\r\n");
      out.write("\t\t\t\t\t\t\thref=\"/cgi-bin/loginpage?t=regist&loc=register,qq,click,0\">立即注册</a>\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t<span class=\"gray\">网络太慢？使用</span><a\r\n");
      out.write("\t\t\t\t\t\t\thref=\"http://w.mail.qq.com/cgi-bin/loginpage?f=xhtml\">基本版</a>\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"mail_advert\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"advert_pic\">\r\n");
      out.write("\t\t\t\t<img\r\n");
      out.write("\t\t\t\t\tstyle=\"width: 153px; height: 195px; background: url('https://res.mail.qq.com/zh_CN/htmledition/images/tg_silence.gif') no-repeat;\"\r\n");
      out.write("\t\t\t\t\tsrc=\"https://res.mail.qq.com/zh_CN/htmledition/images/spacer.gif\"\r\n");
      out.write("\t\t\t\t\talt=\"QQ邮箱，常联系！\" />\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"advert_txt\">\r\n");
      out.write("\t\t\t\t<h1>\r\n");
      out.write("\t\t\t\t\t<a href=\"/zh_CN/htmledition/features/feature_contact.html\"\r\n");
      out.write("\t\t\t\t\t\ttarget=\"_blank\">QQ邮箱，常联系！</a>\r\n");
      out.write("\t\t\t\t</h1>\r\n");
      out.write("\t\t\t\t<p>到头来，</p>\r\n");
      out.write("\t\t\t\t<p>我们记住的，</p>\r\n");
      out.write("\t\t\t\t<p>不是敌人的攻击，</p>\r\n");
      out.write("\t\t\t\t<p>而是朋友的沉默。</p>\r\n");
      out.write("\t\t\t\t<p>——马丁.路德.金</p>\r\n");
      out.write("\t\t\t\t<p class=\"gray\" style=\"font-size: 12px; margin: 8px 0 0 0;\">插画来自丑丑(两岁)</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"mail_intro\">\r\n");
      out.write("\t\t\t<h1>QQ邮箱使用提示</h1>\r\n");
      out.write("\t\t\t<ul class=\"gray\">\r\n");
      out.write("\t\t\t\t<li>您可以用您的QQ号和密码直接登录QQ邮箱。</li>\r\n");
      out.write("\t\t\t\t<li>您还可以<a\r\n");
      out.write("\t\t\t\t\thref=\"/cgi-bin/loginpage?t=regist&loc=register,qq,click,0\">注册</a>一个邮箱帐号（例如：chen@qq.com）并以此登录。\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t<li>手机访问mail.qq.com或使用<a href=\"http://3g.mail.qq.com\"\r\n");
      out.write("\t\t\t\t\ttarget=\"_blank\">手机客户端</a>也可随时随地收发邮件。\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"footer gray\">\r\n");
      out.write("\t\t\t<ul class=\"footer_link\">\r\n");
      out.write("\t\t\t\t<li><a href=\"http://www.tencent.com/\" target=\"_blank\">关于腾讯</a>|</li>\r\n");
      out.write("\t\t\t\t<li><a href=\"http://www.qq.com/contract.shtml\" target=\"_blank\">服务条款</a>|</li>\r\n");
      out.write("\t\t\t\t<li><a href=\"http://service.qq.com/\" target=\"_blank\">客服中心</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<p>&copy; 1998 - 2013 Tencent Inc. All Rights Reserved</p>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\tvar _TIMER_3_ = +new Date();\r\n");
      out.write("\t\tQMLogin.ready();\r\n");
      out.write("\t\t(function() {\r\n");
      out.write("\t\t\tvar _sLen = document.cookie.length, _nCookieNum = Math.random(), _sTestCookie = [\r\n");
      out.write("\t\t\t\t\t\"test\", _nCookieNum, \"test=test\",\r\n");
      out.write("\t\t\t\t\t\";expires=Thu, 01 Jan 9970 00:00:00 GMT\", \";path=/\",\r\n");
      out.write("\t\t\t\t\t\";domain=.mail.qq.com\" ].join(\"\");\r\n");
      out.write("\t\t\tdocument.cookie = _sTestCookie;\r\n");
      out.write("\t\t\tif (document.cookie.length == _sLen) {\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"infobarNoCookie\").style.display = \"\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t_sTestCookie = [ \"test\", _nCookieNum, \"test=test\",\r\n");
      out.write("\t\t\t\t\t\";expires=Thu, 01 Jan 1970 00:00:00 GMT\", \";path=/\",\r\n");
      out.write("\t\t\t\t\t\";domain=.mail.qq.com\" ].join(\"\");\r\n");
      out.write("\t\t\tdocument.cookie = _sTestCookie;\r\n");
      out.write("\t\t})();\r\n");
      out.write("\t</script>\r\n");
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