<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<%
response.Write("var id = new Array(); var kcdm = new Array(); var kcmc = new Array(); var bj = new Array(); var jsxm = new Array();")
Set conn=Server.CreateObject("ADODB.Connection")
connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
conn.open connstring
set rs=server.CreateObject("ADODB.Recordset")
rs.open "kb", conn, 0 ,1
i = 0
do until rs.eof
	response.Write("id[" & i & "]='" & rs(0) & "';")
	response.Write("kcdm[" & i & "]='" & rs(1) & "';")
	response.Write("kcmc[" & i & "]='" & rs(2) & "';")
	response.Write("bj[" & i & "]='" & rs(4) & "';")
	response.Write("jsxm[" & i & "]='" & rs(5) & "';")
	rs.movenext
	i = i + 1
loop
rs.close
set conn = nothing
%>