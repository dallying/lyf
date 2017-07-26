var o ,ww,njxz = false;
function li(w){
	document.getElementById(w).style.background = "#eee";
	document.getElementById("s" + w).style.color = "#f33";
}
function an(w){
	document.getElementById(w).style.background = "#fff";
	document.getElementById("s" + w).style.color = "#000";
}
function de(w){
	document.getElementById("s" + w).focus();
}
function tj(){
	if(document.getElementById("hui").style.display != "block"){
		var i, sum = 0, ssum = 0;
		var str = "";
		document.getElementById("hui").style.display = "block";
		document.getElementById("bai").style.display = "block";
		str+="<div class='qrt'><span class='hw'><span class='hnb'>任课教师：</span>" + document.getElementById("rkjs").value;
		str+="</span></p><p><span class='hw'><span class='hnb'>课程名称：</span>" + document.getElementById("kcmc").value;
		str+="</span><span class='hw'><span class='hnb'>听课班级：</span>" + document.getElementById("tkbj").value;
		str+="</span></p><p><span class='hw'><span class='hnb'>学科指导委员会：</span>" + document.getElementById("xkzdwyh").value;
		str+="</span><span class='hw'><span class='hnb'>评价组成人员：</span>";
		//for (i=1; i<=5; i++){
//			if(document.getElementById("pj" + i.toString()).value.replace(/\s/g,"")!=""){
//				str+= document.getElementById("pj" + i.toString()).value.replace(/\s/g,"") + "，";
//			}
//		}
		str+= document.getElementById("pj").value.replace(/\s/g,"")
		//if(str.substr(str.length-1,1)!="：") str=str.substr(0,str.length-1);
		str+="</p></div>";
		for (i = 1; i <= 5; i++){
			sum+= parseInt(document.getElementById("sa" + i.toString()).value);
		}
		str+="<div class='xf'>教学态度（20%）：" + sum.toString() + "</div>";
		ssum+=sum;
		sum = 0;
		for (i = 1; i <= 5; i++){
			sum+= parseInt(document.getElementById("sb" + i.toString()).value);
		}
		str+="<div class='xf'>教学内容（30%）：" + sum.toString() + "</div>";
		ssum+=sum;
		sum = 0;
		for (i = 1; i <= 5; i++){
			sum+= parseInt(document.getElementById("sc" + i.toString()).value);
		}
		str+="<div class='xf'>教学方法（20%）：" + sum.toString() + "</div>";
		ssum+=sum;
		sum = 0;
		for (i = 1; i <= 5; i++){
			sum+= parseInt(document.getElementById("sd" + i.toString()).value);
		}
		str+="<div class='xf'>教学效果（30%）：" + sum.toString() + "</div>";
		ssum+=sum;
		str+="<div class='zf'>总分：" + ssum.toString() + "分</div>";
		str+="<div><span class='qr' onclick='qr()'>&nbsp;&nbsp;提交&nbsp;&nbsp;</span><a href='#' onclick='fh()'>返回</a></div>";
		document.getElementById("bai").innerHTML = str;
	}
}
function fh(){
	document.getElementById("hui").style.display = "none";
	document.getElementById("bai").style.display = "none";
	document.getElementById("tiao").style.display = "none";
	document.getElementById("bbai").style.display = "none";
}
function qr(){
	o = 0;
	ww = document.body.clientWidth;
	document.getElementById("bbai").style.display = "block";
	document.getElementById("tiao").style.display = "block";
	ks();
	document.b.submit();
}
function pj(){
	document.getElementById("pj").value = document.getElementById("pj").value.replace(/\s/g,"");
}
/////////////////tiao
function tiao(){
	if (o > ww-700) o = 0;
	document.getElementById("tiao").style.left = (o+300).toString() + "px";
	o = o + 20;
}
function ks(){
	setInterval("tiao()",30);
}

/////////年级
function nnj(){
	if (document.getElementById("nj").value == "12"){
		document.getElementById("tkbj").innerHTML = "<option value='12级物理班（本）'>12级物理班（本）</option><option value='12级中文4班（本）'>12级中文4班（本）</option><option value='12级中文5班（本）'>12级中文5班（本）</option><option value='12级中文3班（本）'>12级中文3班（本）</option><option value='12级美术1班（本）'>12级美术1班（本）</option><option value='12级中文1班（本）'>12级中文1班（本）</option><option value='12级美术2班（本）'>12级美术2班（本）</option><option value='12级数学班（本）'>12级数学班（本）</option><option value='12级历史班（本）'>12级历史班（本）</option><option value='12级中文2班（本）'>12级中文2班（本）</option>";
	}else if (document.getElementById("nj").value == "13"){
		document.getElementById("tkbj").innerHTML = "<option value='13级数学1班（本）'>13级数学1班（本）</option><option value='13级历史班（专）'>13级历史班（专）</option><option value='13级数学2班（本）'>13级数学2班（本）</option><option value='13级数学3班（本）'>13级数学3班（本）</option><option value='13级物理班（本）'>13级物理班（本）</option><option value='13级生物1班（本）'>13级生物1班（本）</option><option value='13级英语3班（本）'>13级英语3班（本）</option><option value='13级英语2班（本）'>13级英语2班（本）</option><option value='13级英语1班（本）'>13级英语1班（本）</option><option value='13级政治班（专）'>13级政治班（专）</option><option value='13级历史班（本）'>13级历史班（本）</option><option value='13级体育2班（本）'>13级体育2班（本）</option><option value='13级酒店班（专）'>13级酒店班（专）</option><option value='13级生物2班（本）'>13级生物2班（本）</option><option value='13级园林2班（本）'>13级园林2班（本）</option><option value='13级美术2班（本）'>13级美术2班（本）</option><option value='13级语文1班（专）'>13级语文1班（专）</option><option value='13级语文2班（专）'>13级语文2班（专）</option><option value='13级化学班（本）'>13级化学班（本）</option><option value='13级旅游班（专）'>13级旅游班（专）</option><option value='13级初文1班（专）'>13级初文1班（专）</option><option value='13级初文2班（专）'>13级初文2班（专）</option><option value='13级体育1班（本）'>13级体育1班（本）</option><option value='13级美术1班（本）'>13级美术1班（本）</option><option value='13级园林1班（本）'>13级园林1班（本）</option><option value='13级中文4班（本）'>13级中文4班（本）</option><option value='13级体育1班（专）'>13级体育1班（专）</option><option value='13级化学班（专）'>13级化学班（专）</option><option value='13级园林班（专）'>13级园林班（专）</option><option value='13级物理班（专）'>13级物理班（专）</option><option value='13级教技班（专）'>13级教技班（专）</option><option value='13级计科班（专）'>13级计科班（专）</option><option value='13级信管班（专）'>13级信管班（专）</option><option value='13级生技班（专）'>13级生技班（专）</option><option value='13级体育2班（专）'>13级体育2班（专）</option><option value='13级美术班（专）'>13级美术班（专）</option><option value='13级设计班（专）'>13级设计班（专）</option><option value='13级音乐班（专）'>13级音乐班（专）</option><option value='13级学前1班（专）'>13级学前1班（专）</option><option value='13级学前2班（专）'>13级学前2班（专）</option><option value='13级学前3班（专）'>13级学前3班（专）</option><option value='13级中文5班（本）'>13级中文5班（本）</option><option value='13级统计班（专）'>13级统计班（专）</option><option value='13级中文3班（本）'>13级中文3班（本）</option><option value='13级中文2班（本）'>13级中文2班（本）</option><option value='13级中文1班（本）'>13级中文1班（本）</option><option value='13级法律班（专）'>13级法律班（专）</option><option value='13级数学1班（专）'>13级数学1班（专）</option><option value='13级数学2班（专）'>13级数学2班（专）</option><option value='13级园艺班（专）'>13级园艺班（专）</option><option value='13级初理1班（专）'>13级初理1班（专）</option><option value='13级初理2班（专）'>13级初理2班（专）</option><option value='13级英语1班（专）'>13级英语1班（专）</option><option value='13级英语2班（专）'>13级英语2班（专）</option><option value='13级英泰班（专）'>13级英泰班（专）</option><option value='13级生物班（专）'>13级生物班（专）</option><option value='13级茶技班（专）'>13级茶技班（专）</option>";
	}else if (document.getElementById("nj").value == "14"){
		document.getElementById("tkbj").innerHTML = "<option value='14级计科班（专）'>14级计科班（专）</option><option value='14级信管班（专）'>14级信管班（专）</option><option value='14级教技班（专）'>14级教技班（专）</option><option value='14级体育班（专）'>14级体育班（专）</option><option value='14级美术班（专）'>14级美术班（专）</option><option value='14级设计班（专）'>14级设计班（专）</option><option value='14级物理班（专）'>14级物理班（专）</option><option value='14级园林班（专）'>14级园林班（专）</option><option value='14级化学班（专）'>14级化学班（专）</option><option value='14级生技班（专）'>14级生技班（专）</option><option value='14级园艺班（专）'>14级园艺班（专）</option><option value='14级茶技班（专）'>14级茶技班（专）</option><option value='14级音乐班（专）'>14级音乐班（专）</option><option value='14级学前1班（专）'>14级学前1班（专）</option><option value='14级学前2班（专）'>14级学前2班（专）</option><option value='14级信管2班（本）'>14级信管2班（本）</option><option value='14级政治2班（专）'>14级政治2班（专）</option><option value='14级烹饪中餐班（专）'>14级烹饪中餐班（专）</option><option value='14级法律2班（专）'>14级法律2班（专）</option><option value='14级燃气班（专）'>14级燃气班（专）</option><option value='14级烹饪西餐班（专）'>14级烹饪西餐班（专）</option><option value='14级英语3班（本）'>14级英语3班（本）</option><option value='14级小文2班（本）'>14级小文2班（本）</option><option value='14级数学2班（本）'>14级数学2班（本）</option><option value='14级生物班（专）'>14级生物班（专）</option><option value='14级美术2班（本）'>14级美术2班（本）</option><option value='14级美术1班（本）'>14级美术1班（本）</option><option value='14级园林2班（本）'>14级园林2班（本）</option><option value='14级园林1班（本）'>14级园林1班（本）</option><option value='14级化学班（本）'>14级化学班（本）</option><option value='14级生物1班（本）'>14级生物1班（本）</option><option value='14级信管1班（本）'>14级信管1班（本）</option><option value='14级物理班（本）'>14级物理班（本）</option><option value='14级体育1班（本）'>14级体育1班（本）</option><option value='14级数学1班（本）'>14级数学1班（本）</option><option value='14级英语2班（本）'>14级英语2班（本）</option><option value='14级英语1班（本）'>14级英语1班（本）</option><option value='14级小理班（本）'>14级小理班（本）</option><option value='14级小文1班（本）'>14级小文1班（本）</option><option value='14级历史班（本）'>14级历史班（本）</option><option value='14级汉语班（本）'>14级汉语班（本）</option><option value='14级中文3班（本）'>14级中文3班（本）</option><option value='14级中文2班（本）'>14级中文2班（本）</option><option value='14级中文1班（本）'>14级中文1班（本）</option><option value='14级生物2班（本）'>14级生物2班（本）</option><option value='14级政治1班（专）'>14级政治1班（专）</option><option value='14级体育2班（本）'>14级体育2班（本）</option><option value='14级语文1班（专）'>14级语文1班（专）</option><option value='14级语文2班（专）'>14级语文2班（专）</option><option value='14级文秘班（专）'>14级文秘班（专）</option><option value='14级酒店班（专）'>14级酒店班（专）</option><option value='14级旅游班（专）'>14级旅游班（专）</option><option value='14级初文1班（专）'>14级初文1班（专）</option><option value='14级初文2班（专）'>14级初文2班（专）</option><option value='14级历史班（专）'>14级历史班（专）</option><option value='14级英老班（专）'>14级英老班（专）</option><option value='14级初理班（专）'>14级初理班（专）</option><option value='14级英泰班（专）'>14级英泰班（专）</option><option value='14级英语2班（专）'>14级英语2班（专）</option><option value='14级英语1班（专）'>14级英语1班（专）</option><option value='14级法律1班（专）'>14级法律1班（专）</option><option value='14级统计班（专）'>14级统计班（专）</option><option value='14级数学2班（专）'>14级数学2班（专）</option><option value='14级数学1班（专）'>14级数学1班（专）</option>";
	}else if (document.getElementById("nj").value == "15"){
		document.getElementById("tkbj").innerHTML = "<option value='15级小文班（本）'>15级小文班（本）</option><option value='15级体育2班（本）'>15级体育2班（本）</option><option value='15级小理班（本）'>15级小理班（本）</option><option value='15级体育1班（本）'>15级体育1班（本）</option><option value='15级美术班（本）'>15级美术班（本）</option><option value='15级农学班（本）'>15级农学班（本）</option><option value='15级语文1班（专）'>15级语文1班（专）</option><option value='15级历史班（本）'>15级历史班（本）</option><option value='15级历史班（专）'>15级历史班（专）</option><option value='15级文秘班（专）'>15级文秘班（专）</option><option value='15级语文2班（专）'>15级语文2班（专）</option><option value='15级政治班（专）'>15级政治班（专）</option><option value='15级汉语班（本）'>15级汉语班（本）</option><option value='15级中文3班（本）'>15级中文3班（本）</option><option value='15级中文2班（本）'>15级中文2班（本）</option><option value='15级中文1班（本）'>15级中文1班（本）</option><option value='15级餐饮班（专）'>15级餐饮班（专）</option><option value='15级园林班（本）'>15级园林班（本）</option><option value='15级法律班（专）'>15级法律班（专）</option><option value='15级英语1班（本）'>15级英语1班（本）</option><option value='15级英语2班（本）'>15级英语2班（本）</option><option value='15级数学1班（本）'>15级数学1班（本）</option><option value='15级数学2班（本）'>15级数学2班（本）</option><option value='15级物理班（本）'>15级物理班（本）</option><option value='15级信管班（本）'>15级信管班（本）</option><option value='15级生物班（本）'>15级生物班（本）</option><option value='15级化学班（本）'>15级化学班（本）</option><option value='15级食安班（本）'>15级食安班（本）</option><option value='15级数学2班（专）'>15级数学2班（专）</option><option value='15级化学班（专）'>15级化学班（专）</option><option value='15级教技班（专）'>15级教技班（专）</option><option value='15级物理班（专）'>15级物理班（专）</option><option value='15级茶技班（专）'>15级茶技班（专）</option><option value='15级园艺班（专）'>15级园艺班（专）</option><option value='15级园林班（专）'>15级园林班（专）</option><option value='15级计科班（专）'>15级计科班（专）</option><option value='15级生技班（专）'>15级生技班（专）</option><option value='15级生物班（专）'>15级生物班（专）</option><option value='15级应英班（专）'>15级应英班（专）</option><option value='15级英语2班（专）'>15级英语2班（专）</option><option value='15级英语1班（专）'>15级英语1班（专）</option><option value='15级统计班（专）'>15级统计班（专）</option><option value='15级数学1班（专）'>15级数学1班（专）</option><option value='15级初理班（专）'>15级初理班（专）</option><option value='15级烹饪班（专）'>15级烹饪班（专）</option><option value='15级旅游班（专）'>15级旅游班（专）</option><option value='15级酒店班（专）'>15级酒店班（专）</option><option value='15级学前2班（专）'>15级学前2班（专）</option><option value='15级学前1班（专）'>15级学前1班（专）</option><option value='15级信管班（专）'>15级信管班（专）</option><option value='15级初文1班（专）'>15级初文1班（专）</option><option value='15级音乐班（专）'>15级音乐班（专）</option><option value='15级设计班（专）'>15级设计班（专）</option><option value='15级美术班（专）'>15级美术班（专）</option><option value='15级体育班（专）'>15级体育班（专）</option><option value='15级燃气班（专）'>15级燃气班（专）</option>";
	}else{
		document.getElementById("tkbj").innerHTML = "";
	}
}