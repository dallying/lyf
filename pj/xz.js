var jsxmno = new Array();
var kcdmno = new Array();
var kcmcno = new Array();
var bjno = new Array();
var dong, qd;
var qp = false;
window.onload = function(){
	var x, y, jg = true, i = 0;
	for(x in jsxm){
		jg = true;
		for(y in jsxmno){
			if(jsxm[x] == jsxmno[y]){
				jg = false;
				break;
			}
		}
		if(jg) jsxmno[i++] = jsxm[x];
	}
	i = 0;
	for(x in kcdm){
		jg = true;
		for(y in kcdmno){
			if(kcdm[x] == kcdmno[y]){
				jg = false;
				break;
			}
		}
		if(jg)kcdmno[i++] = kcdm[x];
	}
	i = 0;
	for(x in kcmc){
		jg = true;
		for(y in kcmcno){
			if(kcmc[x] == kcmcno[y]){
				jg = false;
				break;
			}
		}
		if(jg) kcmcno[i++] = kcmc[x];
	}
	i = 0;
	for(x in bj){
		jg = true;
		for(y in bjno){
			if(bj[x] == bjno[y]){
				jg = false;
				break;
			}
		}
		if(jg) bjno[i++] = bj[x];
	}
	jsxmno.sort(function(a,b){return a.localeCompare(b)});
	kcdmno.sort();
	kcmcno.sort(function(a,b){return a.localeCompare(b)});
	bjno.sort(function(a,b){return a.localeCompare(b)});
	cxz("js");
	cxz("dm");
	cxz("kc");
	cxz("bj");
}
function cxz(w){                //重选择。m：选择项目；n：选择条目
	var x, y, m, jg = false;
	a = document.getElementById("jjs").value;
	b = document.getElementById("ddm").value;
	c = document.getElementById("kkc").value;
	d = document.getElementById("bbj").value;
	y = "";
	if(w == "js"){
		for(x in jsxmno){
			jg = false;
			for(m in kcdm){
				if(jsxm[m]==jsxmno[x] && (kcdm[m] == b || b == "all")){
					if(kcmc[m] == c || c == "all"){
						if(bj[m]==d || d == "all"){
							jg = true;
							break;
						}
					}
				}
			}
			if(jg)
				y = y + "<div class='xztctm_ky' onclick=\"xznr('a','" + jsxmno[x] + "')\">" + jsxmno[x] + "</div>";
			else
				y = y + "<div class='xztctm_bky'>" + jsxmno[x] + "</div>";
		}
		document.getElementById("xzjs").innerHTML = y;
	}else if(w == "dm"){
		for(x in kcdmno){
			jg = false;
			for(m in jsxm){
				if(kcdmno[x]==kcdm[m] && (jsxm[m] == a || a == "all")){
					if(kcmc[m] == c || c == "all"){
						if(bj[m]==d || d=="all"){
							jg = true;
							break;
						}
					}
				}
			}
			if(jg)
				y = y + "<div class='xztctm_ky' onclick=\"xznr('b','" + kcdmno[x] + "')\">" + kcdmno[x] + "</div>";
			else
				y = y + "<div class='xztctm_bky'>" + kcdmno[x] + "</div>";
		}
		document.getElementById("xzdm").innerHTML = y;
	}else if(w == "kc"){
		for(x in kcmcno){
			jg = false;
			for(m in kcmc){
				if(kcmcno[x]==kcmc[m] && (jsxm[m] == a || a == "all")){
					if(kcdm[m] == b || b == "all"){
						if(bj[m]==d || d == "all"){
							jg = true;
							break;
						}
					}
				}
			}
			if(jg)
				y = y + "<div class='xztctm_c_ky' onclick=\"xznr('c','" + kcmcno[x] + "')\">" + kcmcno[x] + "</div>";
			else
				y = y + "<div class='xztctm_c_bky'>" + kcmcno[x] + "</div>";
		}
		document.getElementById("xzkc").innerHTML = y;
	}else if(w == "bj"){
		for(x in bjno){
			jg = false;
			for(m in jsxm){
				if(bjno[x]==bj[m] && (jsxm[m] == a || a == "all")){
					if(kcdm[m] == b || b == "all"){
						if(kcmc[m]==c || c=="all"){
							jg = true;
							break;
						}
					}
				}
			}
			if(jg)
				y = y + "<div class='xztctm_c_ky' onclick=\"xznr('d','" + bjno[x] + "')\">" + bjno[x] + "</div>";
			else
				y = y + "<div class='xztctm_c_bky'>" + bjno[x] + "</div>";
		}
		document.getElementById("xzbj").innerHTML = y;
	}else
		alert("错误！");
}
/*function csh(){
	jsxmno = [];
	kcdmno = [];
	kcmcno = [];
	var obj = document.getElementById("jsxm");
	obj.innerHTML = "";
	obj.options.add(new Option("全部","all"));
	var x, y, jg = true, i = 0;
	for(x in jsxm){
		jg = true;
		for(y in jsxmno){
			if(jsxm[x] == jsxmno[y]){
				jg = false;
				break;
			}
		}
		if(jg){
			obj.options.add(new Option(jsxm[x],jsxm[x]));
			jsxmno[i++] = jsxm[x];
		}
	}
	obj = document.getElementById("kcdm");
	obj.innerHTML = "";
	obj.options.add(new Option("全部","all"));
	i = 0;
	for(x in kcdm){
		jg = true;
		for(y in kcdmno){
			if(kcdm[x] == kcdmno[y]){
				jg = false;
				break;
			}
		}
		if(jg){
			obj.options.add(new Option(kcdm[x],kcdm[x]));
			kcdmno[i++] = kcdm[x];
		}
	}
	obj = document.getElementById("kcmc");
	obj.innerHTML = "";
	obj.options.add(new Option("全部","all"));
	i = 0;
	for(x in kcmc){
		jg = true;
		for(y in kcmcno){
			if(kcmc[x] == kcmcno[y]){
				jg = false;
				break;
			}
		}
		if(jg){
			obj.options.add(new Option(kcmc[x],kcmc[x]));
			kcmcno[i++] = kcmc[x];
		}
	}
}*/
function _xz(w){
	document.getElementById("xzjs").style.display = "none";
	document.getElementById("xzdm").style.display = "none";
	document.getElementById("xzkc").style.display = "none";
	document.getElementById("xzbj").style.display = "none";
	qp=false;
	document.getElementById("xz" + w).style.display = "block";
	cxz(w);
}
function _qx(w){
	document.getElementById("xzjs").style.display = "none";
	document.getElementById("xzdm").style.display = "none";
	document.getElementById("xzkc").style.display = "none";
	document.getElementById("xzbj").style.display = "none";
	qp=!qp;
}
function _qxx(w){
	document.getElementById("xzjs").style.display = "none";
	document.getElementById("xzdm").style.display = "none";
	document.getElementById("xzkc").style.display = "none";
	document.getElementById("xzbj").style.display = "none";
	qp=!qp;
	document.getElementById(w.substr(0,1) + w).value = "all";
	if(w == "js"){
		document.getElementById("js").innerHTML = "选择教师";
		document.getElementById("js").style.borderColor = "#ddd";
	}
	else if(w == "dm"){
		document.getElementById("dm").innerHTML = "选择课程代码";
		document.getElementById("dm").style.borderColor = "#ddd";
	}
	else if(w == "kc"){
		document.getElementById("kc").innerHTML = "选择课程名称";
		document.getElementById("kc").style.borderColor = "#ddd";
	}
	else if(w == "bj"){
		document.getElementById("bj").innerHTML = "选择班级名称";
		document.getElementById("bj").style.borderColor = "#ddd";
	}
	document.getElementById("qx" + w).style.display = "none";
	document.getElementById("nr").innerHTML = "请选择！";
	xznr("", "");
}
function xznr(l, w){
	var y = "";
	var x;
	var a, b, c, d;
	if(l == "a"){
		document.getElementById("jjs").value = w;
		document.getElementById("js").innerHTML = w;
		document.getElementById("js").style.borderColor = "#F93";
		document.getElementById("xzjs").style.display = "none";
		document.getElementById("qxjs").style.display = "block";
	}else if(l == "b"){
		document.getElementById("ddm").value = w;
		if(w=="") w="&nbsp;";
		document.getElementById("dm").innerHTML = w;
		document.getElementById("dm").style.borderColor = "#F93";
		document.getElementById("xzdm").style.display = "none";
		document.getElementById("qxdm").style.display = "block";
	}else if(l == "c"){
		document.getElementById("kkc").value = w;
		document.getElementById("kc").innerHTML = w;
		document.getElementById("kc").style.borderColor = "#F93";
		document.getElementById("xzkc").style.display = "none";
		document.getElementById("qxkc").style.display = "block";
	}else if(l == "d"){
		document.getElementById("bbj").value = w;
		document.getElementById("bj").innerHTML = w;
		document.getElementById("bj").style.borderColor = "#F93";
		document.getElementById("xzbj").style.display = "none";
		document.getElementById("qxbj").style.display = "block";
	}
	a = document.getElementById("jjs").value;
	b = document.getElementById("ddm").value;
	c = document.getElementById("kkc").value;
	d = document.getElementById("bbj").value;
	if(a=="all" && b=="all" && c=="all" && d=="all"){
		document.getElementById("nr").innerHTML = "<div class='qxz'>请选择！</div>";
	}else{
		for(x in jsxm){
			jg = false;
			if(jsxm[x] == a || a == "all"){
				if(kcdm[x] == b || b == "all"){
					if(kcmc[x] == c || c == "all"){
						if(bj[x]==d || d=="all"){
							jg = true;
						}
					}
				}
			}
			if(jg) y+= "<div class='yy' onclick=\"_yxz('" + id[x] + "','" + jsxm[x] + "','" + kcdm[x] + "','" + kcmc[x] + "','" + bj[x] + "')\"><span class='y1'>" + jsxm[x] + "</span><span class='y2'>" + kcdm[x] + "</span><span class='y3'>" + kcmc[x] + "</span><span class='y4'>" + bj[x] + "</span></div>";
		}
		y = "<div class='yy y0'><span class='y1'>教师姓名</span><span class='y2'>课程代码</span><span class='y3'>课程名称</span><span class='y4'>班级</span></div>" + y;
		document.getElementById("nr").innerHTML = y;
	}
}

function _yxz(w,a,b,c,d){
	document.getElementById("xjs").value = a;
	document.getElementById("xdm").value = b;
	document.getElementById("xkc").value = c;
	document.getElementById("xbj").value = d;
	document.getElementById("xid").value = w;
	document.getElementById("hui").style.display = "block";
	document.getElementById("bai").style.display = "block";
	document.getElementById("yxz").style.display = "block";
	document.getElementById("yxz_x").style.display = "block";
	document.getElementById("yxz_n").style.display = "block";
	if(document.getElementById("ck").value == "yes")
		document.getElementById("yxz_d1").style.display = "block";
	else
		document.getElementById("yxz_d").style.display = "block";
	document.getElementById("yxjs").innerHTML = a;
	document.getElementById("yxdm").innerHTML = b;
	document.getElementById("yxkc").innerHTML = c;
	document.getElementById("yxbj").innerHTML = d;
	document.getElementById("bai").style.top = "-500px";
	document.getElementById("yxz").style.top = "-455px";
	document.getElementById("yxz_n").style.top = "-390px";
	if(document.getElementById("ck").value == "yes")
		document.getElementById("yxz_d1").style.top = "-90px";
	else
		document.getElementById("yxz_d").style.top = "-90px";
	document.getElementById("yxz_x").style.top = "-190px";
	document.getElementById("yxz_n").style.left = (document.body.offsetWidth- document.getElementById("yxz_n").offsetWidth)/2 + "px";
	ks();
}

function fh(){
	document.getElementById("hui").style.display = "none";
	document.getElementById("bai").style.display = "none";
	document.getElementById("yxz").style.display = "none";
	document.getElementById("yxz_x").style.display = "none";
	document.getElementById("yxz_n").style.display = "none";
	document.getElementById("yxz_d").style.display = "none";
	document.getElementById("yxz_d1").style.display = "none";
}
function tj(w){
	document.gopj.action = w;
	window.name = "tjle";
	document.gopj.submit();
}
function chux(){
	if (qd <= 560){
		var i = 0;
		document.getElementById("bai").style.top = -500 + qd + "px";
		document.getElementById("yxz").style.top = -455 + qd + "px";
		document.getElementById("yxz_x").style.top = -190 + qd + "px";
		document.getElementById("yxz_n").style.top = -400 + qd + "px";
		if(document.getElementById("ck").value == "yes")
			document.getElementById("yxz_d1").style.top = -100 + qd + "px";
		else
			document.getElementById("yxz_d").style.top = -100 + qd + "px";
		i+=10;
		qd+=i*2;
	}else
		clearInterval(dong);
}
var isIE = function(){
	var b = document.createElement('b');
	b.innerHTML = '<!--[if lt IE 9]><i></i><![endif]-->';
	return b.getElementsByTagName('i').length === 1;
}
function ks(){
	qd = 0;
	if(isIE)
		n=2;
	else
		n=5;
	dong = setInterval("chux()",n);
}
function ss1(){
	clearInterval(dong);
	//w.style.top = (-w.offsetHeight+10) + "px";
}
function ss2(){
	if(qp){
		document.getElementById("xzjs").style.display = "none";
		document.getElementById("xzdm").style.display = "none";
		document.getElementById("xzkc").style.display = "none";
		document.getElementById("xzbj").style.display = "none";
	}else
		qp=!qp;
}