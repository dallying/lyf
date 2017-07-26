<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课表</title>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<style type="text/css">
body{font-family:"微软雅黑";color:#333; font-size:12px;}
.zd{width:618px; margin:auto;}
.mt{float:left; width:70px; text-align:center; height:24px; padding-top:9px; border:1px solid #efefef;}
.mtw{background:#ccc; color:#aaa;}
.mz{height:35px; border:#FFF solid 1px;}
.mz:hover{border-color:#b88; cursor:pointer;}
.djz{width:100px; float:left;height:24px; padding-top:9px; border:1px solid #efefef; background:#c85; text-align:center; color:#eee; margin-right:10px;}
.kb{width:960px; text-align:center; height:451px; margin:auto; display:none;}
.kbbt{font-size:20px; padding:14px; margin:10px 0 0; border-top:1px solid #ccc;}
.zkb{width:116px; float:left; height:30px; border:#ccc 1px solid; padding-top:15px; font-size:12px; margin:1px; color:#f7f7f7}
.zkbjie{width:118px; float:left; height:32px; padding-top:15px; font-size:12px; margin:1px; background:#8ab;}
.yk{background:#3a7; cursor:pointer;}
.ykno{background:#ccc;}
.tj{width:200px; background:#962; font-size:18px; padding-top:20px; height:40px; float:left; margin:20px 0 0 380px; color:#eee;}
.tj:hover{background:#740; cursor:pointer;}
</style>
</head>

<body>
<form action="tj.asp" method="post" name="b" id="b">
<div class="zd">
<%
dim kb1(7,7)
dim kb2(7,7)
dim zxs1(7,7)
dim zxs2(7,7)
dim kb()
ks="2016-8-28"
yf=array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月")
jie=array("1&nbsp;2","3&nbsp;4","5&nbsp;6","7&nbsp;8","9&nbsp;10","11&nbsp;12","13&nbsp;14")
xm=request.Form("xm")
d1=request.Form("date1")
d2=request.Form("date2")
k1=weekday(d1)
k2=weekday(d2)
Set conn=Server.CreateObject("ADODB.Connection")
connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("database/ks.mdb")
conn.open connstring
set rs=server.CreateObject("ADODB.Recordset")
strsql = "SELECT zkc.姓名, zkc.星期, zkc.节, zkc.单双, zkc.课程名称, kcxs.总系数, ksf.课时费, jfjs.积分合计 FROM ((kcxs INNER JOIN bjmc ON kcxs.班级 = bjmc.全) INNER JOIN (ksf INNER JOIN (kcxxb INNER JOIN zkc ON kcxxb.姓名 = zkc.姓名) ON ksf.职称 = kcxxb.职称) ON bjmc.缩写 = zkc.班级) INNER JOIN jfjs ON (zkc.姓名 = jfjs.姓名) AND (kcxxb.姓名 = jfjs.姓名) WHERE (((zkc.姓名)='" & xm & "')) ORDER BY zkc.星期, zkc.节, zkc.单双;"
rs.open strsql, conn, 0 ,1
djz=DateDiff("w", ks, d1)+1
js=DateDiff("w", d1, d2)
if weekday(d2)<weekday(d1) then js=js+1
ksf=0
jfjs=0
do until rs.eof
	if(rs(3)=1 or rs(3)=3) then
		kb1(rs(1),rs(2))=rs(4)
		zxs1(rs(1),rs(2))=rs(5)
	end if
	if(rs(3)=2 or rs(3)=3) then
		kb2(rs(1),rs(2))=rs(4)
		zxs2(rs(1),rs(2))=rs(5)
	end if
	if ksf=0 then ksf=rs(6)
	if jfjs=0 then jfjs=rs(7)
	rs.movenext
loop
rs.close
set conn = nothing
for i=djz to js+djz
	ReDim Preserve kb(i-djz+1)
	kb(i-djz+1)="<div class='kb' id='z" & i & "'>"
	kb(i-djz+1)=kb(i-djz+1) & "<div class='kbbt'>第" & i & "周</div>"
	kb(i-djz+1)=kb(i-djz+1) & "<div class='zkbjie'>&nbsp;</div><div class='zkbjie'>周一</div><div class='zkbjie'>周二</div><div class='zkbjie'>周三</div><div class='zkbjie'>周四</div><div class='zkbjie'>周五</div><div class='zkbjie'>周六</div><div class='zkbjie'>周日</div>"
	if(i mod 2=1) then
		for k=1 to 7
			kb(i-djz+1)=kb(i-djz+1) & "<div class='zkbjie'>第" & jie(k-1) & "节</div>" 
			for j=1 to 7
				if i=djz and k1>j+1 then
					if (kb1(j,k)="") then
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb'>&nbsp;</div>"
					else
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb ykno' >" & kb1(j,k) & "</div>"
					end if
				elseif i=djz+js and j>=k2 then
					if (kb1(j,k)="") then
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb'>&nbsp;</div>"
					else
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb ykno' >" & kb1(j,k) & "</div>"
					end if
				else
					if (kb1(j,k)="") then
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb'>&nbsp;</div>"
					else
						bh="kb" & i & j & k
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb yk' id='" & bh & "' onclick=""xz('" & i & j & k & "')"">" & kb1(j,k) & "</div>"
						bz=bz & "<input name='b" & bh & "' id='b" & bh & "' type='checkbox' value='" & zxs1(j,k) & "' checked='checked' />"
					end if
				end if
			next
		next
	else
		for k=1 to 7
			kb(i-djz+1)=kb(i-djz+1) & "<div class='zkbjie'>第" & jie(k-1) & "节</div>" 
			for j=1 to 7
				if i=djz and k1>j+1 then
					if (kb2(j,k)="") then
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb'>&nbsp;</div>"
					else
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb ykno' >" & kb2(j,k) & "</div>"
					end if
				elseif i=djz+js and j>=k2 then
					if (kb2(j,k)="") then
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb'>&nbsp;</div>"
					else
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb ykno' >" & kb2(j,k) & "</div>"
					end if
				else
					if (kb2(j,k)="") then
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb'>&nbsp;</div>"
					else
						bh="kb" & i & j & k
						kb(i-djz+1)=kb(i-djz+1) & "<div class='zkb yk' id='" & bh & "' onclick=""xz('" & i & j & k & "')"">" & kb2(j,k) & "</div>"
						bz=bz & "<input name='b" & bh & "' id='b" & bh & "' type='checkbox' value='" & zxs2(j,k) & "' checked='checked' />"
					end if
				end if
			next
		next
	end if
	kb(i-djz+1)=kb(i-djz+1) & "<div class='tj' onclick='tj()'>确认</div></div>"
next
response.Write("<div class='mz' onclick=""djz('z" & djz &"')""><div class='djz'>第" & djz & "周</div>")
for k=1 to k1-1
	dd= day(dateadd("d", k-k1, d1))
	if dd=1 then dd=yf(month(dateadd("d", k-k1, d1))-1)
	response.Write("<div class='mt mtw'>" & dd & "</div>")
	if weekday(dateadd("d", k-k1, d1))=7 then response.Write("</div>" & "<div class='mz'>")
next
for i=0 to DateDiff("d",d1,d2)
	dd= day(dateadd("d", i, d1)) 
	if dd=1 then dd=yf(month(dateadd("d", i, d1))-1)
	response.Write("<div class='mt'>" & dd & "</div>")
	if weekday(dateadd("d", i, d1))=7 then
		if js>0 then
			js=js-1
			djz=djz+1
			response.Write("</div><div class='mz' onclick=""djz('z" & djz &"')""><div class='djz'>第" & djz & "周</div>")
		else
			response.Write("</div>")
		end if
	end if
next
for k=k2+1 to 7
	dd= day(dateadd("d", k-k2, d2)) 
	if dd=1 then dd=yf(month(dateadd("d", k-k2, d2))-1)
	response.Write("<div class='mt mtw'>" & dd & "</div>")
next
response.Write("</div></div>")
djz=DateDiff("w", ks, d1)+1
js=DateDiff("w", d1, d2)
for each i in kb
	response.Write(i)
next
response.Write("<div style='display:none'>" & bz)
response.Write("<input name='jfjs' type='text' id='jfjs' value='" & jfjs & "' />")
response.Write("<input name='ksf' type='text' id='ksf' value='" & ksf & "' />")
response.Write("</div>")
%>
</form>
</body>
<script type="text/javascript">
function djz(a){
	$(".kb").css({"display":"none"});
	$("#" + a).css({"display":"block"});
}
function xz(a){
	if(!document.getElementById("bkb"+a).checked){
		document.getElementById("bkb"+a).checked=true;
		$("#kb" + a).css({"background-color":"#3a7"});
	}
	else{
		document.getElementById("bkb"+a).checked=false;
		$("#kb" + a).css({"background-color":"#900"});
	}
}
function tj(){
	document.getElementById("b").submit();
}
</script>
</html>