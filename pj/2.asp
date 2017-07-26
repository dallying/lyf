<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>理工学院课堂教学评价——学生用表</title>
<script src="js1.js" type="text/javascript"></script>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
rkjs = request.Form("xjs")
tkbj = request.Form("xbj")
kcmc = request.Form("xkc")
kcdm = request.Form("xdm")
iid = request.Form("xid")
if rkjs = "" or tkbj = "" or kcmc = "" or iid = "" then response.Redirect("error.asp?r=xz")
%>
<div class="bj"></div>
<form name="b" action="tj.asp" method="post">
<input type="hidden" value="<%response.Write(iid)%>" id="iid" name="iid" />
<input type="hidden" value="s" id="l12" name="l12" />
<div class="z dh" style="text-align:left;"><a href="index.asp"><span>返回主页</span></a>|<a href="xz.asp"><span>重新选择</span></a>|<span>当前位置：</span><span>学生评价</span>/<span>打分</span></div>
<div class="z0">
	<div class="hang">
        <div class="a23" onmousemove="bk('rkjs')" onmouseout="bkw('rkjs')">
            任课教师：
            <input id="rkjs" name="rkjs" type="text" value="<%response.Write(rkjs)%>" readonly="readonly" />
        </div>
        <div class="a23" onmousemove="bk('tkbj')" onmouseout="bkw('tkbj')">
            班级名称：
            <input id="tkbj" name="tkbj" type="text" value="<%response.Write(tkbj)%>" readonly="readonly" />
        </div>
    </div>
    <div class="hang">
        <div class="a23" onmousemove="bk('kcdm')" onmouseout="bkw('kcdm')">
            课程代码：
            <input id="kcdm" name="kcdm" type="text" readonly="readonly" value="<%response.Write(kcdm)%>" />
        </div>
        <div class="a23" onmousemove="bk('kcmc')" onmouseout="bkw('kcmc')">
            课程名称：
            <input id="kcmc" name="kcmc" type="text" value="<%response.Write(kcmc)%>" readonly="readonly" />
        </div>
    </div>
    <div class="hang">
        <div class="a23" onmousemove="bk('pj')" onmouseout="bkw('pj')">
            评价人：
            <input id="pj" name="pj" type="text" onchange="ppj()" style="background:#fff; color:#000;"/>
        </div>
    </div>
</div>
<div class="z z2">
	<!-- 1111111111111 -->
	<div class="a a0">
        <div class="a1 a">一级指标</div>
        <div class="a2 a">二级指标（指标内涵）</div>
        <div class="a3 a">分值</div>
        <div class="a4 a">备注</div>
    </div>
    <!-- 22222222222222 -->
    <div class="b">
        <div class="a1 b">教学态度20%</div>
        <div class="a2 c">
			<p id="a1" onmouseover="li('a1')" onmouseout="an('a1')">责任心强，按时上下课，不随意调课停课。</p>
            <p id="a2" onmouseover="li('a2')" onmouseout="an('a2')">重视课堂纪律，严格要求学生，以理服人。</p>
            <p id="a3" onmouseover="li('a3')" onmouseout="an('a3')">对同学友善、真诚关心学生。</p>
            <p id="a4" onmouseover="li('a4')" onmouseout="an('a4')">为学生提供教学大纲。</p>
            <p id="a5" onmouseover="li('a5')" onmouseout="an('a5')">举止大方，穿着得体，仪表端庄，为人师表。</p>
        </div>
      <div class="a3 b">
        <p onmouseover="li('a1')" onmouseout="an('a1')">
            <select id="sa1" name="sa1" class="xz" onblur="ss('a1')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('a2')" onmouseout="an('a2')">
        	<select id="sa2" name="sa2" class="xz" onblur="ss('a2')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('a3')" onmouseout="an('a3')">
        	<select id="sa3" name="sa3" class="xz" onblur="ss('a3')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('a4')" onmouseout="an('a4')">
        	<select id="sa4" name="sa4" class="xz" onblur="ss('a4')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('a5')" onmouseout="an('a5')">
        	<select id="sa5" name="sa5" class="xz" onblur="ss('a5')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
      </div>
      <div class="a4 d">优秀4分<br>良好3分<br>合格2分<br>不合格1分</div>
    </div>
    <!-- 333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333 -->
    <div class="b3">
        <div class="a1 b3">教学内容30%</div>
        <div class="a2 c3">
			<p id="b1" onmouseover="li('b1')" onmouseout="an('b1')">任务明确，进度适宜。</p>
            <p id="b2" onmouseover="li('b2')" onmouseout="an('b2')">观点正确，表达清楚，内容充实，重点突出。</p>
            <p id="b3" onmouseover="li('b3')" onmouseout="an('b3')">注意介绍本学科研究和发展动态。</p>
        </div>
      <div class="a3 b3">
        <p onmouseover="li('b1')" onmouseout="an('b1')">
            <select id="sb1" name="sb1" class="xz" onblur="ss('b1')">
              <option value="10">10</option>
              <option value="8">8</option>
              <option value="6">6</option>
              <option value="3">3</option>
            </select>
        </p>
        <p onmouseover="li('b2')" onmouseout="an('b2')">
        	<select id="sb2" name="sb2" class="xz" onblur="ss('b2')">
              <option value="10">10</option>
              <option value="8">8</option>
              <option value="6">6</option>
              <option value="3">3</option>
            </select>
        </p>
        <p onmouseover="li('b3')" onmouseout="an('b3')">
        	<select id="sb3" name="sb3" class="xz" onblur="ss('b3')">
              <option value="10">10</option>
              <option value="8">8</option>
              <option value="6">6</option>
              <option value="3">3</option>
            </select>
        </p>
      </div>
      <div class="a4 d3">优秀10分<br>良好8分<br>合格6分<br>不合格3分</div>
    </div>
    <!-- 4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444 -->
    <div class="b4">
        <div class="a1 b4">教学方法20%</div>
        <div class="a2 c4">
			<p id="c1" onmouseover="li('c1')" onmouseout="an('c1')">了解学生，灵活采用教学方法。</p>
            <p id="c2" onmouseover="li('c2')" onmouseout="an('c2')">理论联系实际，善于启发学生思维。</p>
            <p id="c3" onmouseover="li('c3')" onmouseout="an('c3')">课堂气氛活跃，师生互动良好。</p>
            <p id="c4" onmouseover="li('c4')" onmouseout="an('c4')">根据教学需要适当选用多媒体教学。</p>
        </div>
      <div class="a3 b4">
        <p onmouseover="li('c1')" onmouseout="an('c1')">
            <select id="sc1" name="sc1" class="xz" onblur="ss('c1')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c2')" onmouseout="an('c2')">
        	<select id="sc2" name="sc2" class="xz" onblur="ss('c2')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c3')" onmouseout="an('c3')">
        	<select id="sc3" name="sc3" class="xz" onblur="ss('c3')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c4')" onmouseout="an('c4')">
        	<select id="sc4" name="sc4" class="xz" onblur="ss('c4')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="1">1</option>
            </select>
        </p>
      </div>
      <div class="a4 d4">优秀5分<br>良好4分<br>合格3分<br>不合格1分</div>
    </div>
    <!-- 5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555 -->
    <div class="b3">
        <div class="a1 b3">教学效果30%</div>
        <div class="a2 c3">
			<p id="d1" onmouseover="li('d1')" onmouseout="an('d1')">学生理解并掌握了该课程的主要教学内容。</p>
            <p id="d2" onmouseover="li('d2')" onmouseout="an('d2')">学生分析问题和解决问题的能力得到增强。</p>
            <p id="d3" onmouseover="li('d3')" onmouseout="an('d3')">教学有助于陶冶学生的修养品格，有自己的教学风格和特点。</p>
        </div>
      <div class="a3 b3">
       <p onmouseover="li('d1')" onmouseout="an('d1')">
            <select id="sd1" name="sd1" class="xz" onblur="ss('d1')">
              <option value="10">10</option>
              <option value="8">8</option>
              <option value="6">6</option>
              <option value="3">3</option>
            </select>
        </p>
		<p onmouseover="li('d2')" onmouseout="an('d2')">
           	<select id="sd2" name="sd2" class="xz" onblur="ss('d2')">
              <option value="10">10</option>
              <option value="8">8</option>
              <option value="6">6</option>
              <option value="3">3</option>
            </select>
        </p>
        <p onmouseover="li('d3')" onmouseout="an('d3')">
        	<select id="sd3" name="sd3" class="xz" onblur="ss('d3')">
              <option value="10">10</option>
              <option value="8">8</option>
              <option value="6">6</option>
              <option value="3">3</option>
            </select>
        </p>
      </div>
      <div class="a4 d3">优秀10分<br>良好8分<br>合格6分<br>不合格3分</div>
    </div>
    
</div>
<div id="hui"  onclick='fh()'></div>
<div id="bai"></div>
<div id="bbai"></div>
<div id="tiao"><img src="t.png" /></div>
<div class="an" onclick="tj()" id="ckjg">查看结果</div>
</form>

</body>

</html>
