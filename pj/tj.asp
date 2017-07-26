<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交打印</title>
<STYLE>TABLE {
	FONT-SIZE: 12px; BORDER-COLLAPSE: collapse;
}
TABLE Thead TD {
	padding-bottom: 10px; text-align:left;
}
TABLE TBODY TD {
	BORDER-RIGHT: #000 1px solid; PADDING-RIGHT: 3px; BORDER-TOP: #000 1px solid; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; BORDER-LEFT: #000 1px solid; PADDING-TOP: 3px; BORDER-BOTTOM: #000 1px solid; TEXT-ALIGN: center;
}
.tdline {
	BORDER-RIGHT: #000 1px solid; PADDING-RIGHT: 3px; BORDER-TOP: #000 1px solid; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; BORDER-LEFT: #000 1px solid; PADDING:5px; BORDER-BOTTOM: #000 1px solid; TEXT-ALIGN: center; line-height:22px;
}
TABLE TH {
	FONT-WEIGHT: 400; FONT-SIZE: 15pt; HEIGHT: 50px; padding:15px; font-family:"黑体";
}
.pageEnd {
	PAGE-BREAK-AFTER: always;
}
.bg{text-align:center; }
.btnPrint{margin:30px; font-size:1.3em; font-family:"黑体"}
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
<style>
.aa{
	min-width:500px;
	width:100%;
	height:100px;
	margin:6em auto 3em;
	font-family:"微软雅黑";
	text-align:center;
	border-bottom:1px #ddd solid;
}
.aa a{
	padding:10px 16px;
	background:#F90;
	margin:0 1em;
	border-radius:4px;
	color:#FFF;
	text-decoration:none;
}
</style>
</head>

<body>

<div class="aa noprint">

<%
lx = request.Form("l12")
if lx<>"s" and lx<>"t" and lx<>"th" then
	from = false
else
	cf=false   '是否重复提交
	from =true
	kcmc=request.Form("kcmc")
	rkjs=request.Form("rkjs")
	tkbj=request.Form("tkbj")
	nj=left(tkbj,2)
	pj=replace(request.Form("pj")," ","")
	iid=request.Form("iid")
	if lx = "t" then xkzdwyh=replace(request.Form("xkzdwyh")," ","")
	if lx="t" then
		lj="jsyb"
	elseif lx="th" then
		lj="thyb"
	elseif lx="s" then
		lj="xsyb"
	end if
end if
if kcmc = "no" or kcmc = "" or rkjs = "no" or rkjs = "" or tkbj = "no" or tkbj = "" or pj = "" then from = false
%>

<%
'''''''''''''''''''''''''''''''''''''''''''''''''''''''判断是否已经评价
function jc(a, d, e, ts)
	Set conn=Server.CreateObject("ADODB.Connection")
	connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
	conn.open connstring
	set rss = server.CreateObject("ADODB.Recordset")
	cs = true
	if ts = "t" then
		strsql = "select * from jsyb where iid=" & a & " and xkzdwyh='" & d & "' and pj='" & e & "'"
	elseif ts = "s" then
		strsql = "select * from xsyb where iid=" & a & " and pj='" & e & "'"
	elseif ts = "th" then
		strsql = "select * from thyb where iid=" & a & " and pj='" & e & "'"
	else
		cs = false
	end if
	if cs then
		rss.open strsql, conn, 0 ,1
		if rss.eof then
			jc = true
		else
			jc = false
		end if
	end if
	rss.close
end function
%>

<%
'On Error Resume Next
dim sa(5),sb(5),sc(5),sd(5),pj
Set conn=Server.CreateObject("ADODB.Connection")
connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
conn.open connstring
set rs=server.CreateObject("ADODB.Recordset")
if from and lx = "t" then     '''''''''''''''''''''''''''''''''''''''''''''''''教师用表
	if jc(iid, xkzdwyh, pj, "t") then
		sum = 0
		for i= 1 to 5
			sa(i)=request.Form("sa" & i)
			sb(i)=request.Form("sb" & i)
			sc(i)=request.Form("sc" & i)
			sd(i)=request.Form("sd" & i)
		next
		rs.open "jsyb", conn, 1 ,3
		rs.addnew
		rs("iid").value = int(iid)
		rs("xkzdwyh").value = xkzdwyh
		for i=1 to 5
			rs("a" & i)=sa(i)
			rs("b" & i)=sb(i)
			rs("c" & i)=sc(i)
			rs("d" & i)=sd(i)
			sum = sum + sa(i) + sb(i) + sc(i) + sd(i)
		next
		rs("pj") = pj
		rs("zf") = sum
		rs("pjsj") = now
		rs.update
		rs.close

		
		''''''''''''''''''''''''''''保存到EXCEL文件...........................................
		
		'set fso=server.CreateObject("scripting.filesystemobject")
'		muban=server.MapPath("a.xlsx")
'		mubiao=server.MapPath("a")
'		if right(mubiao,1)<>"\" then mubiao=mubiao&"\"
'		mubiao=mubiao&"教师用表_"&kcmc&"_"&tkbj&"_"&rkjs&"_"&pj&".xlsx"
'		fso.copyfile muban,mubiao,true 
'		
'		Set xll=Server.CreateObject("Excel.Application")
'		set xl=xll.workbooks.open(mubiao)
'		xll.Visible = False
'		xll.windows.application.displayalerts=false
'		
'		Set xlsheet = xl.Worksheets("Sheet1")
'		xlsheet.Activate
'		xlsheet.Range("B3").value=kcmc
'		xlsheet.Range("E3").value=rkjs
'		xlsheet.Range("B4").value=tkbj
'		xlsheet.Range("B5").value=xkzdwyh
'		xlsheet.Range("B6").value=pj
'		
'		for i=1 to 5
'			xlsheet.Range("F" & 8+i).value=sa(i)
'			xlsheet.Range("F" & 13+i).value=sb(i)
'			xlsheet.Range("F" & 18+i).value=sc(i)
'			xlsheet.Range("F" & 23+i).value=sd(i)
'		next
'		
'		xl.save
'		xl.saved=true
'		xl.close
'		set fso = nothing
		
		response.Write("提交成功，点击<a href='#' onclick='Preview1()'>打印</a>或<a href='index.asp'>返回主页</a>")
	else
		cf=true
	end if
	
elseif from and lx = "s" then    '''''''''''''''''''''''''''''''学生用表
	if jc(iid, "no", pj, "s") then
		sum = 0
		for i= 1 to 5
			sa(i)=request.Form("sa" & i)
			if i <= 3 then
				sb(i)=request.Form("sb" & i)
				sd(i)=request.Form("sd" & i)
			end if
			if i<=4 then
				sc(i)=request.Form("sc" & i)
			end if
		next
		rs.open "xsyb", conn, 1 ,3
		rs.addnew
		rs("iid").value = int(iid)
		for i=1 to 5
			rs("a" & i)=sa(i)
			sum = sum + sa(i)
			if i <= 3 then
				rs("b" & i)=sb(i)
				rs("d" & i)=sd(i)
				sum = sum + sb(i) + sd(i)
			end if
			if i<=4 then
				rs("c" & i)=sc(i)
				sum = sum + sc(i)
			end if
		next
		rs("pj") = pj
		rs("zf") = sum
		rs("pjsj") = now
		rs.update
		rs.close
	
		'set fso=server.CreateObject("scripting.filesystemobject")
'		muban=server.MapPath("b.xlsx")
'		mubiao=server.MapPath("b")
'		if right(mubiao,1)<>"\" then mubiao=mubiao&"\"
'		mubiao=mubiao&"学生用表_"&kcmc&"_"&tkbj&"_"&rkjs&"_"&pj&".xlsx"
'		fso.copyfile muban,mubiao,true 
'		
'		Set xll=Server.CreateObject("Excel.Application")
'		set xl=xll.workbooks.open(mubiao)
'		xll.Visible = False
'		xll.windows.application.displayalerts=false
'		
'		Set xlsheet = xl.Worksheets("Sheet1")
'		xlsheet.Activate
'		xlsheet.Range("B3").value=kcmc
'		xlsheet.Range("E3").value=rkjs
'		xlsheet.Range("B4").value=tkbj
'		xlsheet.Range("E4").value=pj
'		
'		for i=1 to 5
'			xlsheet.Range("F" & 7+i).value=sa(i)
'			if i <= 3 then
'				xlsheet.Range("F" & 12+i).value=sb(i)
'				xlsheet.Range("F" & 19+i).value=sd(i)
'			end if
'			if i<=4 then
'				xlsheet.Range("F" & 15+i).value=sc(i)
'			end if
'		next
'		
'		xl.save
'		xl.saved=true
'		xl.close
'		set fso = nothing
		response.Write("提交成功，点击<a href='#' onclick='Preview1()'>打印</a>或<a href='index.asp'>返回主页</a>")
	else
		cf=true
	end if
	
elseif from and lx = "th" then    '''''''''''''''''''''''''''''''同行用表
	if jc(iid, "no", pj, "th") then
		sum = 0
		for i= 1 to 4
			sa(i)=request.Form("sa" & i)
			sb(i)=request.Form("sb" & i)
			sc(i)=request.Form("sd" & i)
			sd(i)=request.Form("sc" & i)
		next
		rs.open "thyb", conn, 1 ,3
		rs.addnew
		rs("iid").value = int(iid)
		for i=1 to 4
			rs("a" & i)=sa(i)
			rs("b" & i)=sb(i)
			rs("c" & i)=sc(i)
			rs("d" & i)=sd(i)
			sum = sum + sa(i) + sb(i) + sc(i) + sd(i)
		next
		rs("pj") = pj
		rs("zf") = sum
		rs("pjsj") = now
		rs.update
		rs.close
	
'		set fso=server.CreateObject("scripting.filesystemobject")
'		muban=server.MapPath("c.xlsx")
'		mubiao=server.MapPath("c")
'		if right(mubiao,1)<>"\" then mubiao=mubiao&"\"
'		mubiao=mubiao&"同行用表_"&kcmc&"_"&tkbj&"_"&rkjs&"_"&pj&".xlsx"
'		fso.copyfile muban,mubiao,true 
'		
'		Set xll=Server.CreateObject("Excel.Application")
'		set xl=xll.workbooks.open(mubiao)
'		xll.Visible = False
'		xll.windows.application.displayalerts=false
'		
'		Set xlsheet = xl.Worksheets("Sheet1")
'		xlsheet.Activate
'		xlsheet.Range("B3").value=kcmc
'		xlsheet.Range("E3").value=rkjs
'		xlsheet.Range("B4").value=tkbj
'		xlsheet.Range("E4").value=pj
'		
'		for i=1 to 4
'			xlsheet.Range("F" & 7+i).value=sa(i)
'			xlsheet.Range("F" & 11+i).value=sb(i)
'			xlsheet.Range("F" & 15+i).value=sc(i)
'			xlsheet.Range("F" & 19+i).value=sd(i)
'		next
'		
'		xl.save
'		xl.saved=true
'		xl.close
'		set fso = nothing
		response.Write("提交成功，点击<a href='#' onclick='Preview1()'>打印</a>或<a href='index.asp'>返回主页</a>")
	else
		cf=true
	end if
else
	response.Write("错误，点击<a href='index.asp'>返回主页</a>")
end if
conn.close
set conn = nothing
if cf then response.Write("请勿重复评价，点击<a href='index.asp'>返回主页</a>")
'response.Write("提交成功，点击<a href='a/教师用表_" & kcmc & "_" & tkbj & "_" & rkjs & "_" & pj & ".xlsx'>下载</a><a href='index.asp'>返回主页</a>")
%>

</div>

<!--------------------------------------------------------------------------------------------教师用表-------------->
<%
if lx="t" and not cf then 
	response.write("<div id='jsyb' class='bg'>")
	response.write("<TABLE width=640 align=center>")
	response.write("<THEAD>")
	response.write("<TR>")
	response.write("<TH colspan='6' align='middle'>普洱学院课堂教学评价表（教师用表）</TH>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD width='17%' style='text-align:right;'>课程名称：</TD>")
	response.write("<TD width='30%'>" & kcmc & "</TD>")
	response.write("<TD width='17%' style='text-align:right;'>任课教师：</TD>")
	response.write("<TD width='15'>" & rkjs & "</TD>")
	response.write("<TD width='8%'>&nbsp;</TD>")
	response.write("<TD width='13%'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD style='text-align:right;'>课程代码：</TD>")
	response.write("<TD>" & kcdm & "</TD>")
	response.write("<TD style='text-align:right;'>授课班级：</TD>")
	response.write("<TD colspan='3'>" & tkbj & "</TD>")
	response.write("</TR>")
	response.write("</THEAD>")
	response.write("<TBODY>")
	response.write("<TR>")
	response.write("<TD class='tdline'>一级指标</TD>")
	response.write("<TD colspan='3' class='tdline'>二级指标</TD>")
	response.write("<TD class='tdline'>分值</TD>")
	response.write("<TD class='tdline'>备注</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='5' class='tdline'>教学态度<br>")
	response.write("20%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>为人师表，治学严谨，教书育人。</TD>")
	response.write("<TD class='tdline'>" & sa(1) & "</TD>")
	response.write("<TD rowspan='5' class='tdline'>优秀4分<br>良好3分<br>合格2分<br>不合格1分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>教学大纲、教学计划、教案等教学文件齐全。</TD>")
	response.write("<TD class='tdline'>" & sa(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>严格课堂管理，落实考勤制度。</TD>")
	response.write("<TD class='tdline'>" & sa(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>提前到达教室，准时下课不拖堂，认真做开讲前准备和授课后整理。</TD>")
	response.write("<TD class='tdline'>" & sa(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>作业布置合理，及时评改，耐心辅导。</TD>")
	response.write("<TD class='tdline'>" & sa(5) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='5' class='tdline'>教学内容<br>")
	response.write("30%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>执行教学大纲和教学计划，进度与计划误差小。</TD>")
	response.write("<TD class='tdline'>" & sb(1) & "</TD>")
	response.write("<TD rowspan='5' class='tdline'>优秀6分<br>良好5分<br>合格4分<br>不合格2分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>合理选用优秀新版教材，注重开发本土教材、教辅、案例。</TD>")
	response.write("<TD class='tdline'>" & sb(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>根据课程特点突出职业能力培养。</TD>")
	response.write("<TD class='tdline'>" & sb(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>授课内容符合大纲要求。</TD>")
	response.write("<TD class='tdline'>" & sb(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>渗透前沿知识，知识讲解清楚，重点难点突出。</TD>")
	response.write("<TD class='tdline'>" & sb(5) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='5' class='tdline'>教学方法<br>")
	response.write("20%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>充分利用多媒体和其他教学手段，课件、板书设计合理，条理清晰。</TD>")
	response.write("<TD class='tdline'>" & sc(1) & "</TD>")
	response.write("<TD rowspan='5' class='tdline'>优秀4分<br>良好3分<br>合格2分<br>不合格1分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>语言表达清晰、准确，逻辑性强。</TD>")
	response.write("<TD class='tdline'>" & sc(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>理论联系实际，注重培养学生分析问题和解决问题的能力。</TD>")
	response.write("<TD class='tdline'>" & sc(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>根据课程特点设计教学组织流程，教学手段灵活。</TD>")
	response.write("<TD class='tdline'>" & sc(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>参加教研和教改活动、采用多样化教学方法。</TD>")
	response.write("<TD class='tdline'>" & sc(5) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='5' class='tdline'>教学效果<br>")
	response.write("30%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>学生到课率高，迟到率低。</TD>")
	response.write("<TD class='tdline'>" & sd(1) & "</TD>")
	response.write("<TD rowspan='5' class='tdline'>优秀6分<br>良好5分<br>合格4分<br>不合格2分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>课堂秩序良好，学生认真听课，记录完整。</TD>")
	response.write("<TD class='tdline'>" & sd(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>考试（查）课试卷设计合理，成绩呈正态分布。</TD>")
	response.write("<TD class='tdline'>" & sd(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>参加教学竞赛，成绩良好。</TD>")
	response.write("<TD class='tdline'>" & sd(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>指导学生参加竞赛，成绩良好。</TD>")
	response.write("<TD class='tdline'>" & sd(5) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD height='34' class='tdline'>总分</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>&nbsp;</TD>")
	response.write("<TD class='tdline'>" & sum & "</TD>")
	response.write("<TD class='tdline'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("</TBODY>")
	response.write("</TABLE>")
	response.write("<DIV class='noprint'><INPUT class='btnPrint' onclick='Preview1()'; type='button' value=' 打 印 '> </DIV>")
	response.write("</div>")
end if
%>

<!---------------------------------------------------------------------------------------------------同行-------------->

<%
if lx="th" and not cf then
	response.write("<div id='thyb' class='bg'>")
	response.write("<TABLE width=640 align=center>")
	response.write("<THEAD>")
	response.write("<TR>")
	response.write("<TH colspan='6' align='middle'>普洱学院课堂教学评价表（同行用表）</TH>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD width='17%' style='text-align:right;'>课程名称：</TD>")
	response.write("<TD width='30%'>" & kcmc & "</TD>")
	response.write("<TD width='17%' style='text-align:right;'>任课教师：</TD>")
	response.write("<TD width='15'>" & rkjs & "</TD>")
	response.write("<TD width='8%'>&nbsp;</TD>")
	response.write("<TD width='13%'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD style='text-align:right;'>课程代码：</TD>")
	response.write("<TD>" & kcdm & "</TD>")
	response.write("<TD style='text-align:right;'>授课班级：</TD>")
	response.write("<TD colspan='3'>" & tkbj & "</TD>")
	response.write("</TR>")
	response.write("</THEAD>")
	response.write("<TBODY>")
	response.write("<TR>")
	response.write("<TD class='tdline'>一级指标</TD>")
	response.write("<TD colspan='3' class='tdline'>二级指标</TD>")
	response.write("<TD class='tdline'>分值</TD>")
	response.write("<TD class='tdline'>备注</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='4' class='tdline'>教学文件<br>")
	response.write("40%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>按时提交教学大纲、教案和教学进度计划(10%)</TD>")
	response.write("<TD class='tdline'>" & sa(1) & "</TD>")
	response.write("<TD rowspan='4' class='tdline'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>有完整、规范的教学大纲；教学大纲体现教学目的、任务、内容和要求，符合专业培养方案精神(10%)</TD>")
	response.write("<TD class='tdline'>" & sa(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>教案准确说明每部分的教学目的、要求、内容、重点、难点，内容清晰、详实，经常补充更新教案内容(15%)</TD>")
	response.write("<TD class='tdline'>" & sa(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>教学进度安排完整、科学、合理，符合教学大纲要求(5%)</TD>")
	response.write("<TD class='tdline'>" & sa(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='4' class='tdline'>学生学业<br />")
	response.write("成绩评定<br>")
	response.write("20%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>能按学校要求命题和评卷，按时提交试卷（考技能的学科提交考试方案）、参考答案、评分标准、学生成绩单和试卷分析报告(8%)</TD>")
	response.write("<TD class='tdline'>" & sb(1) & "</TD>")
	response.write("<TD rowspan='4' class='tdline'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>按教学大纲要求确定成绩构成，平时成绩构成多样，评定符合规范(3%)</TD>")
	response.write("<TD class='tdline'>" & sb(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>试卷总分统计准确无误，成绩分析认真、全面、科学(5%)</TD>")
	response.write("<TD class='tdline'>" & sb(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>根据学科特点布置作业，批改反馈及时(4%)</TD>")
	response.write("<TD class='tdline'>" & sb(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='4' class='tdline'>教学工作态度<br>")
	response.write("20%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>授课认真，精神饱满有激情；尊重学生人格，严格要求，经常与学生交流(5%)</TD>")
	response.write("<TD class='tdline'>" & sc(1) & "</TD>")
	response.write("<TD rowspan='4' class='tdline'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>虚心听取各方意见，及时改进教学方法(4%)</TD>")
	response.write("<TD class='tdline'>" & sc(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>服从院系的工作安排，不推诿，不懈怠(8%)</TD>")
	response.write("<TD class='tdline'>" & sc(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>积极主持或参与教研项目(3%)</TD>")
	response.write("<TD class='tdline'>" & sc(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='4' class='tdline'>日常课堂<br />")
	response.write("教学情况<br>")
	response.write("20%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>根据学科特点布置作业及阅读文献，引导学生自主学习(5%)</TD>")
	response.write("<TD class='tdline'>" & sd(1) & "</TD>")
	response.write("<TD rowspan='4' class='tdline'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>严格课堂管理，落实考勤制度，学生上课积极性高，教学秩序好，课堂气氛活跃(5%)</TD>")
	response.write("<TD class='tdline'>" & sd(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>上课前检查相关的教学设备和仪器，并严格按要求操作(5%)</TD>")
	response.write("<TD class='tdline'>" & sd(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>提前到达教室，准时下课不拖堂，认真做开讲前准备和授课后整理(5%)</TD>")
	response.write("<TD class='tdline'>" & sd(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD height='34' class='tdline'>总分</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>&nbsp;</TD>")
	response.write("<TD class='tdline'>" & sum & "</TD>")
	response.write("<TD class='tdline'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("</TBODY>")
	response.write("</TABLE>")
	response.write("<DIV class='noprint'><INPUT class='btnPrint' onclick='Preview1()'; type='button' value=' 打 印 '> </DIV>")
	response.write("</div>")
end if
%>

<!-------------------------------------------------------------------------------------------学生------------------>
<%
if lx="s" and not cf then
	response.write("<div id='thyb' class='bg'>")
	response.write("<TABLE width=640 align=center>")
	response.write("<THEAD>")
	response.write("<TR>")
	response.write("<TH colspan='6' align='middle'>普洱学院课堂教学评价表（学生用表）</TH>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD width='17%' style='text-align:right;'>课程名称：</TD>")
	response.write("<TD width='30%'>" & kcmc & "</TD>")
	response.write("<TD width='17%' style='text-align:right;'>任课教师：</TD>")
	response.write("<TD width='15'>" & rkjs & "</TD>")
	response.write("<TD width='8%'>&nbsp;</TD>")
	response.write("<TD width='13%'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD style='text-align:right;'>课程代码：</TD>")
	response.write("<TD>" & kcdm & "</TD>")
	response.write("<TD style='text-align:right;'>授课班级：</TD>")
	response.write("<TD colspan='3'>" & tkbj & "</TD>")
	response.write("</TR>")
	response.write("</THEAD>")
	response.write("<TBODY>")
	response.write("<TR>")
	response.write("<TD class='tdline'>一级指标</TD>")
	response.write("<TD colspan='3' class='tdline'>二级指标</TD>")
	response.write("<TD class='tdline'>分值</TD>")
	response.write("<TD class='tdline'>备注</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='5' class='tdline'>教学态度<br>")
	response.write("20%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>责任心强，按时上下课，不随意调课停课。</TD>")
	response.write("<TD class='tdline'>" & sa(1) & "</TD>")
	response.write("<TD rowspan='5' class='tdline'>优秀4分<br />")
	response.write("良好3分<br />")
	response.write("合格2分<br />")
	response.write("不合格1分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>重视课堂纪律，严格要求学生，以理服人。</TD>")
	response.write("<TD class='tdline'>" & sa(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>对同学友善、真诚关心学生。</TD>")
	response.write("<TD class='tdline'>" & sa(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>为学生提供教学大纲。</TD>")
	response.write("<TD class='tdline'>" & sa(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>举止大方，穿着得体，仪表端庄，为人师表。</TD>")
	response.write("<TD class='tdline'>" & sa(5) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='3' class='tdline'>教学内容<br>")
	response.write("30%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>任务明确，进度适宜。</TD>")
	response.write("<TD class='tdline'>" & sb(1) & "</TD>")
	response.write("<TD rowspan='3' class='tdline'>优秀10分<br />良好8分<br />合格6分<br />不合格3分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>观点正确，表达清楚，内容充实，重点突出。</TD>")
	response.write("<TD class='tdline'>" & sb(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>注意介绍本学科研究和发展动态。</TD>")
	response.write("<TD class='tdline'>" & sb(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='4' class='tdline'>教学方法<br>")
	response.write("20%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>了解学生，灵活采用教学方法。</TD>")
	response.write("<TD class='tdline'>" & sc(1) & "</TD>")
	response.write("<TD rowspan='4' class='tdline'>优秀5分<br />")
	response.write("良好4分<br />")
	response.write("合格3分<br />")
	response.write("不合格1分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>理论联系实际，善于启发学生思维。</TD>")
	response.write("<TD class='tdline'>" & sc(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>课堂气氛活跃，师生互动良好。</TD>")
	response.write("<TD class='tdline'>" & sc(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>根据教学需要适当选用多媒体教学。</TD>")
	response.write("<TD class='tdline'>" & sc(4) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD rowspan='3' class='tdline'>教学效果<br>")
	response.write("30%</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>学生理解并掌握了该课程的主要教学内容。</TD>")
	response.write("<TD class='tdline'>" & sd(1) & "</TD>")
	response.write("<TD rowspan='3' class='tdline'>优秀10分<br />")
	response.write("良好8分<br />")
	response.write("合格6分<br />")
	response.write("不合格3分</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>学生分析问题和解决问题的能力得到增强。</TD>")
	response.write("<TD class='tdline'>" & sd(2) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>教学有助于陶冶学生的修养品格，有自己的教学风格和特点。</TD>")
	response.write("<TD class='tdline'>" & sd(3) & "</TD>")
	response.write("</TR>")
	response.write("<TR>")
	response.write("<TD height='34' class='tdline'>总分</TD>")
	response.write("<TD colspan='3' class='tdline' style='text-align:left;'>&nbsp;</TD>")
	response.write("<TD class='tdline'>" & sum & "</TD>")
	response.write("<TD class='tdline'>&nbsp;</TD>")
	response.write("</TR>")
	response.write("</TBODY>")
	response.write("</TABLE>")
	response.write("<DIV class='noprint'><INPUT class='btnPrint' onclick='Preview1()'; type='button' value=' 打 印 '></DIV>")
	response.write("</div>")
end if
%>
</body>
</html>
