<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="save" content="history" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="/favicon.ico" />
<title>登录雨幕潇潇的网站</title>
<link rel="stylesheet" type="text/css" href="https://res.mail.qq.com/zh_CN/htmledition/style/ptlogin13363c.css" />
</head>
<body>
	<script type="text/javascript" src="https://res.mail.qq.com/zh_CN/htmledition/js/qmlogin144e76.js"></script>
	<div class="container">
		<div class="header">
			<a class="logo" href="/">QQ邮箱</a>
			<ul class="header_link">
				<li><a href="http://en.mail.qq.com">English</a>|</li>
				<li><a
					href="http://support.qq.com/cgi-bin/beta1/titlelist_simple?pn=0&order=3&fid=350"
					target="_blank">反馈建议</a>|</li>
				<li><a href="http://service.mail.qq.com" target="_blank">帮助中心</a>|</li>
				<li><a href="http://exmail.qq.com?referrer=index_top"
					target="_blank">企业邮箱</a></li>
			</ul>
		</div>
		<div id="downError" class="login_msg" style="display: none;">
			<p>由于加载安全组件失败，为了您的帐号安全，无法正常登录邮箱，解决方法：</p>
			<ul>
				<li>按下F5重新刷新页面。</li>
				<li>打开浏览器“选项”菜单，选择“Internet选项”，执行清空缓存功能，确定后按F5刷新本页面。</li>
				<li>如上述方式仍然无法解决问题，请登录<a href="http://maildisk.bbs.qq.com"
					target="_blank">邮箱论坛通知我们</a>，我们将尽快为您解决。
				</li>
			</ul>
		</div>
		<div class="login_container" id="login">
			<div class="login_box">
				<div class="logo_title">
					<h1>登录QQ邮箱</h1>
				</div>
				<div id="msgContainer" class="login_box_msg" style="display: none;"></div>
				<noscript>
					<div class="login_box_msg noScript">
						您的浏览器不支持或已经禁止网页脚本，您无法正常登录。<a
							href="/zh_CN/help/error_noscript.html" title="了解网页脚本限制的更多信息"
							target="_blank"><img
							src="https://res.mail.qq.com/zh_CN/htmledition/images/ico_help104474.gif"
							style="margin: 0 2px;" align="absmiddle" />如何解除脚本限制</a>
					</div>
				</noscript>
				<div class="login_box_msg noCookie" id="infobarNoCookie"
					style="display: none">
					你的浏览器不支持或已经禁止使用Cookie，导致无法正常登录。请<a
						href="http://service.mail.qq.com/cgi-bin/help?subtype=1&&id=7&&no=1001007#chrome"
						title="了解Cookie的更多信息" target="_blank">启用Cookie<img
						src="https://res.mail.qq.com/zh_CN/htmledition/images/ico_help104474.gif"
						style="margin: 0 2px;" align="absmiddle" /></a>后重试。
				</div>
				<div style="display: none;" id="auth" class="login_operate auth">
					<div id="icon_from"></div>
					<div id="icon_to"></div>
					<div id="auth_tips">
						<p>你已登录腾讯相关网站。</p>
						<p>
							是否授权以下帐号自动登录<span id="appname">QQ邮箱</span>？
						</p>
					</div>
					<div class="auth_account">
						<label id="accounts" class="username_immutable"></label><span
							class="username_immutable">@qq.com</span>
					</div>
					<div class="login_submit">
						<a id="auth_link" class="login_btn_wrapper btn_auth"
							href="javascript:;" target="_top">授权</a><a id="canc_link"
							class="login_cancel" href="javascript:;"
							onclick="ptui_switch_login();return false;">取消</a>
					</div>
				</div>
				<div style="display: none" id="qlogin" class="qlogin"></div>
				<div class="login_operate" style="display: block" id="web_login">
					<form id="loginform" onsubmit="return QMLogin.checkInput();"
						method="post" name="loginform" target="_self" autocomplete="on">
						<input value="522005705" type="hidden" id="aid" name="aid" /><input
							value="4" type="hidden" id="daid" name="daid" /><input
							value="https://mail.qq.com/cgi-bin/login?vt=passport&vm=wpt&ft=ptlogin"
							type="hidden" name="u1" id="u1" /><input value="1" type="hidden"
							name="from_ui" /><input value="1" type="hidden" name="ptredirect" /><input
							value="1" type="hidden" name="h" /><input value="快速登录"
							name="wording" id="wording" type="hidden" /><input
							value="https://mail.qq.com/zh_CN/htmledition/style/fast_login13ffb2.css"
							type="hidden" id="css" name="css" /><input value="m_ptmail"
							type="hidden" name="mibao_css" />
						<div class="username">
							<label class="txt_default" for="uin" id="label_uin"
								default_txt="邮箱帐号或QQ号码">&nbsp;</label><input
								onchange="QMLogin.judgeVC()" readonly="true"
								class="login_domain" id="domain" name="u_domain"
								style="font-size: 18px;" value="@qq.com" type="text"
								tabindex="-1" /><input onblur="QMLogin.judgeVC()"
								class="txt alias" id="uin" name="uin" type="text" tabindex="1"
								value="" /><input id="u" name="u" value="" type="hidden" />
						</div>
						<div class="password">
							<label class="txt_default" for="p" id="label_p"
								default_txt="QQ密码">&nbsp;</label><input
								onfocus="QMLogin.judgeVC()" class="txt password" id="p" name="p"
								type="password" tabindex="2" />
							<div id="capTip" class="captips" style="display: none;">大写锁定已打开</div>
						</div>
						<div class="about_password">
							<input class="remerber_password" type="checkbox"
								id="remerber_password" tabindex="5" /><label
								for="remerber_password">记住登录状态</label><a class="forgetPassword"
								href="/cgi-bin/loginpage?t=getpwdback" target="_blank">忘记密码？</a>
						</div>
						<div id="divSavePassWarning" class="red" style="display: none;">选择此项后，下次将自动登录邮箱（本机两周内有效）。为了您的信息安全，请不要在网吧或公用电脑上使用。</div>
						<div id="verifyinput" class="vfcode" style="display: none">
							<div class="vfcodeinput">
								<label class="txt_default" for="verifycode"
									id="label_verifycode" default_txt="验证码">&nbsp;</label><input
									class="txt" id="verifycode" value="" name="verifycode"
									type="text" tabindex="4" placeholder="" maxlength="6"
									autocomplete="off" />
								<div id="verifytip" class="verifytip">按右图填写，不区分大小写</div>
							</div>
							<div class="gray vfcode_img" style="">
								<img id="imgVerify" onclick="QMLogin.changeImg();"
									onload="QMLogin.onLoadVC();" alt="验证码" />
								<div class="vfcode_change">
									<a id="verifyshow" id="changeimg_link"
										href="javascript:QMLogin.changeImg();">看不清楚？换一个</a>
								</div>
							</div>
						</div>
						<div class="login_submit" style="">
							<a class="login_btn_wrapper" href="javascript:;"><input
								class="login_btn" id="btlogin" name="btlogin" type="submit"
								value="登录" tabindex="5" /></a>
						</div>
					</form>
				</div>
				<div style="display: none;" id="switch" class="lineright"
					onmouseup="QMLogin.switchMode()"></div>
				<div class="login_tips">
					<p>
						<span class="gray">还没有QQ邮箱？</span><a
							href="/cgi-bin/loginpage?t=regist&loc=register,qq,click,0">立即注册</a>
					</p>
					<p>
						<span class="gray">网络太慢？使用</span><a
							href="http://w.mail.qq.com/cgi-bin/loginpage?f=xhtml">基本版</a>
					</p>
				</div>
			</div>
		</div>
		<div class="mail_advert">


			<div class="advert_pic">
				<img
					style="width: 153px; height: 195px; background: url('https://res.mail.qq.com/zh_CN/htmledition/images/tg_silence.gif') no-repeat;"
					src="https://res.mail.qq.com/zh_CN/htmledition/images/spacer.gif"
					alt="QQ邮箱，常联系！" />
			</div>
			<div class="advert_txt">
				<h1>
					<a href="/zh_CN/htmledition/features/feature_contact.html"
						target="_blank">QQ邮箱，常联系！</a>
				</h1>
				<p>到头来，</p>
				<p>我们记住的，</p>
				<p>不是敌人的攻击，</p>
				<p>而是朋友的沉默。</p>
				<p>——马丁.路德.金</p>
				<p class="gray" style="font-size: 12px; margin: 8px 0 0 0;">插画来自丑丑(两岁)</p>
			</div>
		</div>
		<div class="mail_intro">
			<h1>QQ邮箱使用提示</h1>
			<ul class="gray">
				<li>您可以用您的QQ号和密码直接登录QQ邮箱。</li>
				<li>您还可以<a
					href="/cgi-bin/loginpage?t=regist&loc=register,qq,click,0">注册</a>一个邮箱帐号（例如：chen@qq.com）并以此登录。
				</li>
				<li>手机访问mail.qq.com或使用<a href="http://3g.mail.qq.com"
					target="_blank">手机客户端</a>也可随时随地收发邮件。
				</li>
			</ul>
		</div>
		<div class="footer gray">
			<ul class="footer_link">
				<li><a href="http://www.tencent.com/" target="_blank">关于腾讯</a>|</li>
				<li><a href="http://www.qq.com/contract.shtml" target="_blank">服务条款</a>|</li>
				<li><a href="http://service.qq.com/" target="_blank">客服中心</a></li>
			</ul>
			<p>&copy; 1998 - 2013 Tencent Inc. All Rights Reserved</p>
		</div>
	</div>
</body>
</html>