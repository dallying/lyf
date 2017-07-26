<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<%
if session("can")<>"y" then
	response.Write("无权限！")
else
	lx=request.QueryString("lx")
	id=request.QueryString("id")
	if lx<>"jsyb" and lx<>"xsyb" and lx<>"thyb" then
		response.Write("类型错误")
	else
		Set conn=Server.CreateObject("ADODB.Connection")
		connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
		conn.open connstring
		set rs = server.CreateObject("ADODB.Recordset")
		strsql = "select * from " & lx &" where id=" & id
		rs.open strsql, conn, 0 ,1
		if rs.eof then
			response.Write("无数据!")
		else
			a1=rs("a1"):a2=rs("a2"):a3=rs("a3"):a4=rs("a4"):az=a1+a2+a3+a4
			b1=rs("b1"):b2=rs("b2"):b3=rs("b3"):bz=b1+b2+b3
			c1=rs("c1"):c2=rs("c2"):c3=rs("c3"):c4=rs("c4"):cz=c1+c2+c3+c4
			d1=rs("d1"):d2=rs("d2"):d3=rs("d3"):dz=d1+d2+d3
			if lx="jsyb" then
				a5=rs("a5"):az=az+a5
				b4=rs("b4"):b5=rs("b5"):bz=bz+b4+b5
				c5=rs("c5"):cz=cz+c5
				d4=rs("d4"):d5=rs("d5"):dz=dz+d4+d5
			elseif lx="xsyb" then
				a5=rs("a5"):az=az+a5
				b4="&nbsp;":b5="&nbsp;"
				c5="&nbsp;"
				d4="&nbsp;":d5="&nbsp;"
			elseif lx="thyb" then
				a5="&nbsp;"
				b4=rs("b4"):b5="&nbsp;":bz=bz+b4
				c5="&nbsp;"
				d4=rs("d4"):d5="&nbsp;":dz=dz+d4
			end if
			response.Write("<table cellspacing='3' cellpadding='6' align='center'><tr align='center'><td width='100' height='40'>项目</td><td colspan='5'>得分</td><td width='50'>合计</td></tr><tr align='center'><td>教学态度&nbsp;(20%)</td><td width='50'>" & a1 & "</td><td width='50'>" & a2 & "</td><td width='50'>" & a3 & "</td><td width='50'>" & a4 & "</td><td width='50'>" & a5 & "</td><td>" & az & "</td></tr><tr align='center'><td>教学内容&nbsp;(30%)</td><td width='50'>" & b1 & "</td><td width='50'>" & b2 & "</td><td width='50'>" & b3 & "</td><td width='50'>" & b4 & "</td><td width='50'>" & b5 & "</td><td>" & bz & "</td></tr><tr align='center'><td>教学方法&nbsp;(20%)</td><td width='50'>" & c1 & "</td><td width='50'>" & c2 & "</td><td width='50'>" & c3 & "</td><td width='50'>" & c4 & "</td><td width='50'>" & c5 & "</td><td>" & cz & "</td></tr><tr align='center'><td>教学效果&nbsp;(30%)</td><td width='50'>" & d1 & "</td><td width='50'>" & d2 & "</td><td width='50'>" & d3 & "</td><td width='50'>" & d4 & "</td><td width='50'>" & d5 & "</td><td>" & dz & "</td></tr><tr align='center' height='40'><td colspan='6'>总分</td><td>" & az+bz+cz+dz & "</td></tr></table><div class='sj'>评价时间：" & rs("pjsj") & "</div>")
		end if
		rs.close
		conn.close
	end if
end if
%>