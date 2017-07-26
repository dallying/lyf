var o ,ww, njxz = false, dong;
function li(w){
	document.getElementById(w).style.background = "#eee";
	document.getElementById("s" + w).style.color = "#f33";
	document.getElementById("s" + w).focus();
}
function an(w){
	document.getElementById(w).style.background = "#fff";
	document.getElementById("s" + w).style.color = "#000";
}
function ss(w){
	document.getElementById(w).style.background = "#fff";
	document.getElementById("s" + w).style.color = "#000";
}
function tj(){
	document.getElementById("pj").value = document.getElementById("pj").value.replace(/\s/g,"");;
	if(document.getElementById("rkjs").value == "no" || document.getElementById("tkbj").value == "no" || document.getElementById("kcmc").value == "no"){
		alert("请选择任课教师！");
		document.getElementById("rkjs").focus();
	}else if(document.getElementById("pj").value == ""){
		alert("请填写评价人！");
		document.getElementById("pj").focus();
	}else if(document.getElementById("hui").style.display != "block"){
		var i, sum = 0, ssum = 0;
		var str = "";
		document.getElementById("hui").style.display = "block";
		document.getElementById("bai").style.display = "block";
		str+="<div class='qrt'><span class='hw'><span class='hnb'>任课教师：</span>" + document.getElementById("rkjs").value;
		str+="</span><span class='hw'><span class='hnb'>课程名称：</span>" + document.getElementById("kcmc").value;
		if (document.getElementById("l12").value == "s" || document.getElementById("l12").value == "th") {
			str+="</span></p><p><span class='hw'><span class='hnb'>班级：</span>" + document.getElementById("tkbj").value;
		}else if (document.getElementById("l12").value == "t"){
			str+="</span></p><p><span class='hw'><span class='hnb'>听课班级：</span>" + document.getElementById("tkbj").value;
			str+="</span></p><p><span class='hw'><span class='hnb'>学科指导委员会：</span>" + document.getElementById("xkzdwyh").value;
		}
		str+="</span><span class='hw'><span class='hnb'>评价人：</span>";
		str+= document.getElementById("pj").value.replace(/\s/g,"");
		str+="</span></p></div>";
		if (document.getElementById("l12").value == "t"){
			j = 5;
		}else if (document.getElementById("l12").value == "s"){
			j = 4;
		}else if (document.getElementById("l12").value == "th"){
			j = 4;
		}
		for (i = 1; i <= j; i++){
			sum+= parseInt(document.getElementById("sa" + i.toString()).value);
		}
		if (document.getElementById("l12").value == "th"){
			str+="<div class='xf'>　　　　教学文件（40%）：" + sum.toString() + "分　　</div>";
		}else
			str+="<div class='xf'>教学态度（20%）：" + sum.toString() + "分</div>";
		ssum+=sum;
		sum = 0;
		if (document.getElementById("l12").value == "t"){
			j = 5;
		}else if (document.getElementById("l12").value == "s"){
			j = 3;
		}
		else if (document.getElementById("l12").value == "th"){
			j = 4;
		}
		for (i = 1; i <= j; i++){
			sum+= parseInt(document.getElementById("sb" + i.toString()).value);
		}
		if (document.getElementById("l12").value == "th"){
			str+="<div class='xf'>学生学业成绩评定（20%）：" + sum.toString() + "分　　</div>";
		}else
			str+="<div class='xf'>教学内容（30%）：" + sum.toString() + "分</div>";
		ssum+=sum;
		sum = 0;
		if (document.getElementById("l12").value == "t"){
			j = 5;
		}else if (document.getElementById("l12").value == "s"){
			j = 4;
		}else if (document.getElementById("l12").value == "th"){
			j = 4;
		}
		for (i = 1; i <= j; i++){
			sum+= parseInt(document.getElementById("sc" + i.toString()).value);
		}
		if (document.getElementById("l12").value == "th"){
			str+="<div class='xf'>　　教学工作态度（20%）：" + sum.toString() + "分　　</div>";
		}else
			str+="<div class='xf'>教学方法（20%）：" + sum.toString() + "分</div>";
		ssum+=sum;
		sum = 0;
		if (document.getElementById("l12").value == "t"){
			j = 5;
		}else if (document.getElementById("l12").value == "s"){
			j = 3;
		}else if (document.getElementById("l12").value == "th"){
			j = 4;
		}
		for (i = 1; i <= j; i++){
			sum+= parseInt(document.getElementById("sd" + i.toString()).value);
		}
		if (document.getElementById("l12").value == "th"){
			str+="<div class='xf'>日常课堂教学情况（20%）：" + sum.toString() + "分　　</div>";
		}else
			str+="<div class='xf'>教学效果（30%）：" + sum.toString() + "分</div>";
		ssum+=sum;
		str+="<div class='zf'>总分：" + ssum.toString() + "分</div>";
		str+="<div class='qr' onclick='qr()'>提交</div>";
		document.getElementById("bai").innerHTML = str;
		document.getElementById("ckjg").style.background = "#ccc";
	}
}
function fh(){
	document.getElementById("hui").style.display = "none";
	document.getElementById("bai").style.display = "none";
	document.getElementById("tiao").style.display = "none";
	document.getElementById("ckjg").style.background = "#F93";
}
function qr(){
	o = 0;
	ww = document.body.clientWidth;
	document.getElementById("tiao").style.display = "block";
	document.getElementById("bbai").style.display = "block";
	ks();
	document.b.submit();
}
function ppj(){
	document.getElementById("pj").value = document.getElementById("pj").value.replace(/\s/g,"");
}
/////////////////tiao
function tiao(){
	if (o > ww-700) o = 0;
	document.getElementById("tiao").style.left = (o+300).toString() + "px";
	o = o + 20;
}
function ks(){
	setInterval("tiao()",40);
}
function bk(z){
	document.getElementById(z).style.borderColor = "#FC9";
}
function bkw(z){
	document.getElementById(z).style.borderColor = "#999";
}
function kkc(z){
	document.getElementById(z).style.borderColor = "#999";
}