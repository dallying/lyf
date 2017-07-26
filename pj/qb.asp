<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看汇总</title>
<%
if session("can")<>"y" then response.Redirect("error.asp?r=qx")
lx=request.QueryString("lx")
iid=request.QueryString("id")
if lx<>"jsyb" and lx<>"thyb" and lx<>"xsyb" then response.Redirect("error.asp?r=cs")
%>
</head>
<STYLE>
TABLE {
	FONT-SIZE: 12px; BORDER-COLLAPSE: collapse;
}
TABLE TBODY TD {
	BORDER-RIGHT: #000 1px solid; BORDER-TOP: #000 1px solid; PADDING-BOTTOM: 3px; BORDER-LEFT: #000 1px solid; PADDING-TOP: 3px; BORDER-BOTTOM: #000 1px solid; TEXT-ALIGN: center;
}
table tfoot th{
	font-size:12px; text-align:left; padding-left:12%; padding-top:20px; font-family:"黑体";
}
table tfoot th span{
	PADDING:4px 3% 4px 0; BORDER-RIGHT: #000 1px solid; margin-right:3%;
}
.tdline {
	BORDER-RIGHT: #000 1px solid; BORDER-TOP: #000 1px solid; PADDING-BOTTOM: 3px; BORDER-LEFT: #000 1px solid; PADDING-TOP: 3px; BORDER-BOTTOM: #000 1px solid; TEXT-ALIGN: center;
}
TABLE TH {
	FONT-WEIGHT: 400; FONT-SIZE: 15pt; HEIGHT: 50px; padding-top:20px; font-family:"黑体"; 
}
.pageEnd {
	PAGE-BREAK-AFTER: always;
}
.aa{
	min-width:500px;
	width:100%;
	height:100px;
	margin:auto;
	font-family:"微软雅黑";
	text-align:center;
	border-top:1px #ddd solid;
	padding-top:30px;
}
.aa span{
	padding:10px 36px;
	background:#F90;
	margin:0 1em;
	border-radius:4px;
	color:#FFF;
	text-decoration:none;
}
.aa span:hover{
	background:#e80;
	cursor:pointer;
}
</STYLE>

<STYLE>
@media Print 
{
.bgnoprint {
	BACKGROUND: none transparent scroll repeat 0% 0%;
}
.noprint {
	DISPLAY: none;
}
.yesprint {
	DISPLAY: block;
}

}
</STYLE>

<SCRIPT language=JavaScript>   
			
function PageSetup_del(){ 
	var HKEY_Root,HKEY_Path,HKEY_Key; 
	HKEY_Root="HKEY_CURRENT_USER"; 
	HKEY_Path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
	var Wsh=new ActiveXObject("WScript.Shell");   
	HKEY_Key="header"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
	HKEY_Key="footer"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,""); 
	HKEY_Key="margin_left"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"0.39370"); 
	HKEY_Key="margin_right"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"0.39370"); 
	HKEY_Key="margin_bottom"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"0.49370"); 
	HKEY_Key="margin_top"; 
	Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"0.49370"); 
}
	
function Preview1(){
	try{
		PageSetup_del();
		window.print();
	}catch(e){window.print();}
}
</SCRIPT>

<SCRIPT defer>   
function  PutSettings(){     
	factory.printing.header="";   
	factory.printing.footer="";  
	factory.printing.leftMargin="13";  
	factory.printing.rightMargin="10";  
	factory.printing.topMargin="10";   			 
	factory.printing.bottomMargin="0.1"; 	
}
function Print(){
	PutSettings();
	factory.printing.Print(true);
}

function Preview(){
	try{
		PutSettings();
		factory.printing.Preview();
	}catch(e){}
}
</SCRIPT>

<body>
<%
if session("can")="y" and session("js")<>"" then
	if lx<>"jsyb" and lx<>"thyb" and lx<>"xsyb" then
		response.Redirect("error.asp?r=cs")
	else
		Set conn=Server.CreateObject("ADODB.Connection")
		connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
		conn.open connstring
		set rs = server.CreateObject("ADODB.Recordset")
		strsql = "select * from " & lx & " where iid=" & iid
		rs.open strsql, conn, 0 ,1
		if rs.eof then
			response.Redirect("error.asp?r=nodata")
		else
			dim a(5),b(5),c(5),d(5)
			if lx="jsyb" then
				dylx="学科委员会评价" : dyxm="委员会成员" : h1=22 : kd=4 : cy=false
			elseif lx="thyb" then
				dylx="同行评价" : dyxm="同行" : h1=18 : kd=5 : cy=true
			elseif lx="xsyb" then
				dylx="学生评价" : dyxm="学生" : h1=17 : kd=5 : cy=false
			end if
			response.Write("<TABLE width=960 align=center>")
			response.Write("<THEAD>")
			response.Write("<TR>")
			response.Write("<TH colspan='" & h1 & "' align=middle>普洱学院课堂教学评价表（" & dylx & "）</TH>")
			response.Write("</TR>")
			response.Write("<TR>")
			response.Write("<TD colspan='" & h1 & "'>&nbsp;</TD>")
			response.Write("</TR>")
			response.Write("<TR>")
			response.Write("<TD width='12%' style='text-align:right;'>任课教师：</TD>")
			response.Write("<TD colspan='" & h1-1 & "'>" & session("js") & "</TD>")
			response.Write("</TR>")
'			if cy then
'				response.Write("<TR>")
'				response.Write("<TD style='text-align:right;'>评价成员：</TD>")
'				response.Write("<TD colspan='" & h1-1 & "'>&nbsp;</TD>")
'				response.Write("</TR>")
'			end if
			response.Write("<TR>")
			response.Write("<TD style='text-align:right;'>&nbsp;</TD>")
			response.Write("<TD colspan='" & h1-1 & "'>&nbsp;</TD>")
			response.Write("</TR>")
			response.Write("</THEAD>")
			response.Write("<TBODY>")
			response.Write("<TR>")
			response.Write("<TD width='12%' rowspan='3' class='tdline'>评价人员</TD>")
			response.Write("<TD height='40' colspan='" & h1-2 & "' class='tdline'>指标得分</TD>")
			response.Write("<TD rowspan='3' class='tdline'>合计</TD>")
			response.Write("</TR>")
			response.Write("<TR>")
			if lx="jsyb" then
				response.Write("<TD height='33' colspan='5' class='tdline'>教学态度（20%）</TD>")
				response.Write("<TD colspan='5' class='tdline'>教学内容（30%）</TD>")
				response.Write("<TD colspan='5' class='tdline'>教学方法（20%）</TD>")
				response.Write("<TD colspan='5' class='tdline'>教学效果（30%）</TD>")
			elseif lx="thyb" then
				response.Write("<TD height='33' colspan='4' class='tdline'>教学文件（40%）</TD>")
				response.Write("<TD colspan='4' class='tdline'>学生学业成绩评定（20%）</TD>")
				response.Write("<TD colspan='4' class='tdline'>教学工作态度（20%）</TD>")
				response.Write("<TD colspan='4' class='tdline'>日常课堂教学情况（20%）</TD>")
			elseif lx="xsyb" then
				response.Write("<TD height='33' colspan='5' class='tdline'>教学态度（20%）</TD>")
				response.Write("<TD colspan='3' class='tdline'>教学内容（30%）</TD>")
				response.Write("<TD colspan='4' class='tdline'>教学方法（20%）</TD>")
				response.Write("<TD colspan='3' class='tdline'>教学效果（30%）</TD>")
			end if
			response.Write("</TR>")
			response.Write("<TR>")
			response.Write("<TD width='" & kd & "%' height='30' class='tdline'>1</TD>")
			for i =2 to h1-2
				response.Write("<TD width='" & kd & "%' class='tdline'>" & i & "</TD>")
			next
			response.Write("</TR>")
			i=0
			zz=0
			summ=0
			while not rs.eof
				i=i+1
				sum=0
				for j=1 to 3
					a(j)=rs("a" & j)
					b(j)=rs("b" & j)
					c(j)=rs("c" & j)
					d(j)=rs("d" & j)
					sum=sum+a(j)+b(j)+c(j)+d(j)
				next
				if lx="jsyb" then
					for j=4 to 5
						a(j)=rs("a" & j)
						b(j)=rs("b" & j)
						c(j)=rs("c" & j)
						d(j)=rs("d" & j)
						sum=sum+a(j)+b(j)+c(j)+d(j)
					next
				elseif lx="thyb" then
					a(4)=rs("a4")
					b(4)=rs("b4")
					c(4)=rs("c4")
					d(4)=rs("d4")
					sum=sum+a(4)+b(4)+c(4)+d(4)
				elseif lx="xsyb" then
					a(4)=rs("a4") : a(5)=rs("a5")
					c(4)=rs("c4")
					sum=sum+a(4)+a(5)+c(4)
				end if
				response.Write("<TR>")
				if cy then
					response.Write("<TD height='30' class='tdline'>" & rs("pj") & "</TD>")
				else
					response.Write("<TD height='30' class='tdline'>" & dyxm & i & "</TD>")
				end if
				if lx="jsyb" then
					for j=1 to 5
						response.Write("<TD class='tdline'>" & a(j) & "</TD>")
					next
					for j=1 to 5
						response.Write("<TD class='tdline'>" & b(j) & "</TD>")
					next
					for j=1 to 5
						response.Write("<TD class='tdline'>" & c(j) & "</TD>")
					next
					for j=1 to 5
						response.Write("<TD class='tdline'>" & d(j) & "</TD>")
					next
				elseif lx="thyb" then
					for j=1 to 4
						response.Write("<TD class='tdline'>" & a(j) & "</TD>")
					next
					for j=1 to 4
						response.Write("<TD class='tdline'>" & b(j) & "</TD>")
					next
					for j=1 to 4
						response.Write("<TD class='tdline'>" & c(j) & "</TD>")
					next
					for j=1 to 4
						response.Write("<TD class='tdline'>" & d(j) & "</TD>")
					next
				elseif lx="xsyb" then
					for j=1 to 5
						response.Write("<TD class='tdline'>" & a(j) & "</TD>")
					next
					for j=1 to 3
						response.Write("<TD class='tdline'>" & b(j) & "</TD>")
					next
					for j=1 to 4
						response.Write("<TD class='tdline'>" & c(j) & "</TD>")
					next
					for j=1 to 3
						response.Write("<TD class='tdline'>" & d(j) & "</TD>")
					next
				end if
				response.Write("<TD class='tdline'>" & sum & "</TD>")
				response.Write("</TR>")
				summ=summ+sum
				zz=zz+1
				rs.movenext
				if zz=10 then
					response.Write("</TBODY>")
					response.Write("</TABLE>")
					response.Write("<TABLE width=960 align=center>")
					response.Write("<THEAD>")
					response.Write("<TR>")
					response.Write("<TH colspan='" & h1 & "' align=middle>普洱学院课堂教学评价表（" & dylx & "）</TH>")
					response.Write("</TR>")
					response.Write("<TR>")
					response.Write("<TD colspan='" & h1 & "'>&nbsp;</TD>")
					response.Write("</TR>")
					response.Write("<TR>")
					response.Write("<TD width='12%' style='text-align:right;'>任课教师：</TD>")
					response.Write("<TD colspan='" & h1-1 & "'>" & session("js") & "</TD>")
					response.Write("</TR>")
'					if cy then
'						response.Write("<TR>")
'						response.Write("<TD style='text-align:right;'>评价成员：</TD>")
'						response.Write("<TD colspan='" & h1-1 & "'>&nbsp;</TD>")
'						response.Write("</TR>")
'					end if
					response.Write("<TR>")
					response.Write("<TD style='text-align:right;'>&nbsp;</TD>")
					response.Write("<TD colspan='" & h1-1 & "'>&nbsp;</TD>")
					response.Write("</TR>")
					response.Write("</THEAD>")
					response.Write("<TBODY>")
					response.Write("<TR>")
					response.Write("<TD width='12%' rowspan='3' class='tdline'>评价人员</TD>")
					response.Write("<TD height='40' colspan='" & h1-2 & "' class='tdline'>指标得分</TD>")
					response.Write("<TD rowspan='3' class='tdline'>合计</TD>")
					response.Write("</TR>")
					response.Write("<TR>")
					if lx="jsyb" then
						response.Write("<TD height='33' colspan='5' class='tdline'>教学态度（20%）</TD>")
						response.Write("<TD colspan='5' class='tdline'>教学内容（30%）</TD>")
						response.Write("<TD colspan='5' class='tdline'>教学方法（20%）</TD>")
						response.Write("<TD colspan='5' class='tdline'>教学效果（30%）</TD>")
					elseif lx="thyb" then
						response.Write("<TD height='33' colspan='4' class='tdline'>教学文件（40%）</TD>")
						response.Write("<TD colspan='4' class='tdline'>学生学业成绩评定（20%）</TD>")
						response.Write("<TD colspan='4' class='tdline'>教学工作态度（20%）</TD>")
						response.Write("<TD colspan='4' class='tdline'>日常课堂教学情况（20%）</TD>")
					elseif lx="xsyb" then
						response.Write("<TD height='33' colspan='5' class='tdline'>教学态度（20%）</TD>")
						response.Write("<TD colspan='3' class='tdline'>教学内容（30%）</TD>")
						response.Write("<TD colspan='4' class='tdline'>教学方法（20%）</TD>")
						response.Write("<TD colspan='3' class='tdline'>教学效果（30%）</TD>")
					end if
					response.Write("</TR>")
					response.Write("<TR>")
					response.Write("<TD width='" & kd & "%' height='30' class='tdline'>1</TD>")
					for j =2 to h1-2
						response.Write("<TD width='" & kd & "%' class='tdline'>" & j & "</TD>")
					next
					response.Write("</TR>")
					response.Write("<DIV class='pageEnd'>&nbsp;</DIV>")
					zz=0
				end if
			wend
			response.Write("</TBODY>")
			response.Write("<tfoot>")
			response.Write("<TR>")
			response.Write("<TH colspan='" & h1 & "'><span>总分：" & summ & "</span><span>调查人数：" & i & "</span>平均分：" &  Round(summ/i, 3) & "</TH>")
			response.Write("</TR>")
			response.Write("</tfoot>")
			response.Write("</TABLE>")
			response.Write("<div class='aa noprint'><span onclick='Preview1()'>打印</span></div>")
		end if
		rs.close
	end if
else
	response.Redirect("error.asp?r=qx")
end if
%>
</body>
</html>
