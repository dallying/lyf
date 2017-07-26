<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>理工学院课堂教学评价——教师用表</title>
<script src="js1.js" type="text/javascript"></script>
<script type="text/javascript" src="kc.js"></script>
<script type="text/javascript" src="js.js"></script>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
rkjs = request.Form("xjs")
tkbj = request.Form("xbj")
kcmc = request.Form("xkc")
kcdm = request.Form("xdm")
id = request.Form("xid")
%>
<div class="bj"></div>
<form name="b" action="tj.asp" method="post">
<input type="hidden" value="<%response.Write(lx)%>" id="l12" name="l12" />
<input id="nj" name="nj" type="hidden" value="0" />
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
        <div class="a23" onmousemove="bk('xkzdwyh')" onmouseout="bkw('xkzdwyh')"<%response.Write(xs)%>>
            学科指导委员会：
            <select id="xkzdwyh" name="xkzdwyh">
              <option value="委员会一">委员会一</option>
              <option value="委员会二">委员会二</option>
              <option value="委员会三">委员会三</option>
              <option value="委员会四">委员会四</option>
            </select>
        </div>
        <div class="a23" onmousemove="bk('pj')" onmouseout="bkw('pj')">
            评价人：
            <input id="pj" name="pj" type="text" onchange="ppj()" style="background:#fff;"/>
        </div>
    </div>
</div>
<div class="z z1">
	<!-- 1111111111111 -->
	<div class="a">
        <div class="a1 a">一级指标</div>
        <div class="a2 a">二级指标（指标内涵）</div>
        <div class="a3 a">分值</div>
        <div class="a4 a">备注</div>
    </div>
    <!-- 22222222222222 -->
    <div class="b">
        <div class="a1 b">教学态度20%</div>
        <div class="a2 c">
			<p id="a1" onmouseover="li('a1')" onmouseout="an('a1')">为人师表，治学严谨，教书育人。</p>
            <p id="a2" onmouseover="li('a2')" onmouseout="an('a2')">教学大纲、教学计划、教案等教学文件齐全。</p>
            <p id="a3" onmouseover="li('a3')" onmouseout="an('a3')">严格课堂管理，落实考勤制度。</p>
            <p id="a4" onmouseover="li('a4')" onmouseout="an('a4')">提前到达教室，准时下课不拖堂，认真做开讲前准备和授课后整理。</p>
            <p id="a5" onmouseover="li('a5')" onmouseout="an('a5')">作业布置合理，及时评改，耐心辅导。</p>
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
    <!-- 3333333333333 -->
    <div class="b">
        <div class="a1 b">教学内容30%</div>
        <div class="a2 c">
			<p id="b1" onmouseover="li('b1')" onmouseout="an('b1')">执行教学大纲和教学计划，进度与计划误差小。</p>
            <p id="b2" onmouseover="li('b2')" onmouseout="an('b2')">合理选用优秀新版教材，注重开发本土教材、教辅、案例。</p>
            <p id="b3" onmouseover="li('b3')" onmouseout="an('b3')">根据课程特点突出职业能力培养。</p>
            <p id="b4" onmouseover="li('b4')" onmouseout="an('b4')">授课内容符合大纲要求。</p>
            <p id="b5" onmouseover="li('b5')" onmouseout="an('b5')">渗透前沿知识，知识讲解清楚，重点难点突出。</p>
        </div>
      <div class="a3 b">
        <p onmouseover="li('b1')" onmouseout="an('b1')">
            <select id="sb1" name="sb1" class="xz" onblur="ss('b1')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('b2')" onmouseout="an('b2')">
        	<select id="sb2" name="sb2" class="xz" onblur="ss('b2')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('b3')" onmouseout="an('b3')">
        	<select id="sb3" name="sb3" class="xz" onblur="ss('b3')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('b4')" onmouseout="an('b4')">
        	<select id="sb4" name="sb4" class="xz" onblur="ss('b4')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('b5')" onmouseout="an('b5')">
        	<select id="sb5" name="sb5" class="xz" onblur="ss('b5')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
      </div>
      <div class="a4 d">优秀6分<br>良好5分<br>合格4分<br>不合格2分</div>
    </div>
    <!-- 4444444444444 -->
    <div class="b">
        <div class="a1 b">教学方法20%</div>
        <div class="a2 c">
			<p id="c1" onmouseover="li('c1')" onmouseout="an('c1')">充分利用多媒体和其他教学手段，课件、板书设计合理，条理清晰。</p>
            <p id="c2" onmouseover="li('c2')" onmouseout="an('c2')">语言表达清晰、准确，逻辑性强。</p>
            <p id="c3" onmouseover="li('c3')" onmouseout="an('c3')">理论联系实际，注重培养学生分析问题和解决问题的能力。</p>
            <p id="c4" onmouseover="li('c4')" onmouseout="an('c4')">根据课程特点设计教学组织流程，教学手段灵活。</p>
            <p id="c5" onmouseover="li('c5')" onmouseout="an('c5')">参加教研和教改活动、采用多样化教学方法。</p>
        </div>
      <div class="a3 b">
        <p onmouseover="li('c1')" onmouseout="an('c1')">
            <select id="sc1" name="sc1" class="xz" onblur="ss('c1')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c2')" onmouseout="an('c2')">
        	<select id="sc2" name="sc2" class="xz" onblur="ss('c2')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c3')" onmouseout="an('c3')">
        	<select id="sc3" name="sc3" class="xz" onblur="ss('c3')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c4')" onmouseout="an('c4')">
        	<select id="sc4" name="sc4" class="xz" onblur="ss('c4')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c5')" onmouseout="an('c5')">
        	<select id="sc5" name="sc5" class="xz" onblur="ss('c5')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
      </div>
      <div class="a4 d">优秀4分<br>良好3分<br>合格2分<br>不合格1分</div>
    </div>
    <!-- 55555555555 -->
    <div class="b">
        <div class="a1 b">教学效果30%</div>
        <div class="a2 c">
			<p id="d1" onmouseover="li('d1')" onmouseout="an('d1')">学生到课率高，迟到率低。</p>
            <p id="d2" onmouseover="li('d2')" onmouseout="an('d2')">课堂秩序良好，学生认真听课，记录完整。</p>
            <p id="d3" onmouseover="li('d3')" onmouseout="an('d3')">考试（查）课试卷设计合理，成绩呈正态分布。</p>
            <p id="d4" onmouseover="li('d4')" onmouseout="an('d4')">参加教学竞赛，成绩良好。</p>
            <p id="d5" onmouseover="li('d5')" onmouseout="an('d5')">指导学生参加竞赛，成绩良好。</p>
        </div>
      <div class="a3 b">
        <p onmouseover="li('d1')" onmouseout="an('d1')">
            <select id="sd1" name="sd1" class="xz" onblur="ss('d1')">
             <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('d2')" onmouseout="an('d2')">
        	<select id="sd2" name="sd2" class="xz" onblur="ss('d2')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('d3')" onmouseout="an('d3')">
        	<select id="sd3" name="sd3" class="xz" onblur="ss('d3')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('d4')" onmouseout="an('d4')">
        	<select id="sd4" name="sd4" class="xz" onblur="ss('d4')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
        <p onmouseover="li('d5')" onmouseout="an('d5')">
        	<select id="sd5" name="sd5" class="xz" onblur="ss('d5')">
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
            </select>
        </p>
      </div>
      <div class="a4 d">优秀6分<br>良好5分<br>合格4分<br>不合格2分</div>
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
