<%
if request.QueryString("from")<>"w" then
	response.Redirect("index.asp")
else
	if request.Form("mm")<>"123" then
		response.Redirect("error.asp?r=mm")
	else
		session("can")="y"
		response.Redirect("xz.asp?from=ck")
	end if
end if
%>