<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>选择时间</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" href="css/dcalendar.picker.css"/>
<style type="text/css">
.xm {font-size: 14px; background:#e82; margin:8px; padding:10px 10px; float:left; width:200px; text-align:center; color:#eee;}
.xm:hover{cursor:pointer;}
.xm:hover{background:#990000}
</style>
</head>

<body>
<form action="jg.asp" method="post" name="b">
<input name="xm" type="text" style="display:none" id="xm" value="<%response.Write(request.Form("xm"))%>" />
<div class='xmdiv'>
<div class="bt">选择时间：</div>
<div class="bq">开始时间：
<input id='date1' type='text' name="date1"/></div>
<div class="bq">结束时间：
<input id='date2' type='text' name="date2"/></div>
<div class="xm" onclick="tj()">确定</div>
</div>
</form>
</body>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
<script type="text/javascript" src="js/dcalendar.picker.js"></script>
<script type="text/javascript">
$('#date1').dcalendarpicker(); 
$('#date2').dcalendarpicker({
	format:'yyyy-mm-dd'
}); 
$('#mycalendar').dcalendar();
function tj(){
	t1=document.getElementById("date1").value
	t2=document.getElementById("date2").value
	if(t1=="" || t2=="")
		alert("请选择日期")
	else{
		if(comptime(t1,t2))document.b.submit()
	}
	//document.b.submit();
}
function comptime(beginTime,endTime) {
    var beginTimes = beginTime.substring(0, 10).split('-');
    var endTimes = endTime.substring(0, 10).split('-');
    beginTime = beginTimes[1] + '-' + beginTimes[2] + '-' + beginTimes[0] + ' ' + beginTime.substring(10, 19);
    endTime = endTimes[1] + '-' + endTimes[2] + '-' + endTimes[0] + ' ' + endTime.substring(10, 19);
    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
    if (a < 0 || a == 0) {
        alert("结束日期必须大于开始日期!");
    } else {
        return true
    }
}
</script>
</html>
