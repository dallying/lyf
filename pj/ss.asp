<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
var isIE = function(){
	var b = document.createElement('b');
	b.innerHTML = '<!--[if lt IE 9]><i></i><![endif]-->';
	return b.getElementsByTagName('i').length === 1;
}
function ss(){
	alert('ie6:' + isIE(6) + '\n' + 'ie7:' + isIE(7) + '\n' + 'ie8:' + isIE(8) + '\n' + 'ie9:' + isIE(9) + '\n' + 'ie:' + isIE());
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#b1").bind("click",function(){
		$("#div").animate({
			marginLeft:'+=250px',
			opacity:'0.5',
		});
	});
	$("#b2").bind("click",function(){
		$("#div").animate({
			marginLeft:'-=250px',
			opacity:'1',
			height:'150px',
   			width:'150px'
		});
	});
});
</script>
</head>

<body>
<%
function ss()
	response.Write("fffff")
	ss="12"
	response.Write("gg")
end function
a=ss()
response.Write(a)
%>
<input name="" type="button" value="ssss" />
<button id="b1">Click me</button>
<button id="b2">Click me</button>
<div>
<p style="background:#f00;">This is a paragraph.</p>
<button>请点击这里</button>
</div>
<div class="bj">
abcdef
<!--[lt IE 9]>

IE6可见

<![endif]-->
</div>
<table width="600" border="1" cellspacing="1" cellpadding="0" id="bg">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<div id="div" style="height:800px; width:600px; background:#ddd;">123<br>123<br>123<br>123<br>123<br>123<br></div>
</body>
</html>
