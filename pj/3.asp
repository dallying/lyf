<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>理工学院课堂教学评价——教师用表</title>
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
if rkjs = "" or tkbj = "" or kcmc = "" or iid = "" then response.Redirect("error.asp")
%>
<div class="bj"></div>
<form name="b" action="tj.asp" method="post">
<input type="hidden" value="<%response.Write(iid)%>" id="iid" name="iid" />
<input type="hidden" value="th" id="l12" name="l12" />
<div class="z dh" style="text-align:left;"><a href="index.asp"><span>返回主页</span></a>|<a href="xz.asp"><span>重新选择</span></a>|<span>当前位置：</span><span>学科委员会评价</span>/<span>打分</span></div>
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
<div class="z z3">
	<!-- 1111111111111 -->
	<div class="a a0">
        <div class="a1 a">一级指标</div>
        <div class="a2 a">二级指标（指标内涵）</div>
        <div class="a3 a">分值</div>
        <div class="a4 a">备注</div>
    </div>
    <!-- 22222222222222 -->
    <div class="bjj">
        <div class="a1 bjj">教学文件40%</div>
        <div class="a2 cjj">
			<p id="a1" onmouseover="li('a1')" onmouseout="an('a1')">按时提交教学大纲、教案和教学进度计划（10%）</p>
            <p id="a2" onmouseover="li('a2')" onmouseout="an('a2')">有完整、规范的教学大纲；教学大纲体现教学目的、任务、内容和要求，符合专业培养方案精神（10%）</p>
            <p id="a3" onmouseover="li('a3')" onmouseout="an('a3')">教案准确说明每部分的教学目的、要求、内容、重点、难点，内容清晰、详实，经常补充更新教案内容（15%）</p>
            <p id="a4" onmouseover="li('a4')" onmouseout="an('a4')">教学进度安排完整、科学、合理，符合教学大纲要求（5%）</p>
        </div>
      <div class="a3 bjj">
        <p onmouseover="li('a1')" onmouseout="an('a1')">
            <select id="sa1" name="sa1" class="xz" onblur="ss('a1')">
              <option value="10">10</option>
              <option value="9">9</option>
              <option value="8">8</option>
              <option value="7">7</option>
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('a2')" onmouseout="an('a2')">
        	<select id="sa2" name="sa2" class="xz" onblur="ss('a2')" style="margin:12px 0px;">
              <option value="10">10</option>
              <option value="9">9</option>
              <option value="8">8</option>
              <option value="7">7</option>
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('a3')" onmouseout="an('a3')">
        	<select id="sa3" name="sa3" class="xz" onblur="ss('a3')" style="margin:12px 0px;">
              <option value="15">15</option>
              <option value="14">14</option>
              <option value="13">13</option>
              <option value="12">12</option>
              <option value="11">11</option>
              <option value="10">10</option>
              <option value="9">9</option>
              <option value="8">8</option>
              <option value="7">7</option>
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('a4')" onmouseout="an('a4')">
        	<select id="sa4" name="sa4" class="xz" onblur="ss('a4')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
      </div>
      <div class="a4 djj">&nbsp;</div>
    </div>
    <!-- 3333333333333 -->
    <div class="bss">
        <div class="a1 bss">学生学业成绩评定20%</div>
        <div class="a2 css">
			<p id="b1" onmouseover="li('b1')" onmouseout="an('b1')">能按学校要求命题和评卷，按时提交试卷（考技能的学科提交考试方案）、参考答案、评分标准、学生成绩单和试卷分析报告（8%）</p>
            <p id="b2" onmouseover="li('b2')" onmouseout="an('b2')">按教学大纲要求确定成绩构成，平时成绩构成多样，评定符合规范（3%）</p>
            <p id="b3" onmouseover="li('b3')" onmouseout="an('b3')">试卷总分统计准确无误，成绩分析认真、全面、科学（5%）</p>
            <p id="b4" onmouseover="li('b4')" onmouseout="an('b4')">根据学科特点布置作业，批改反馈及时（4%）</p>
        </div>
      <div class="a3 bss">
        <p onmouseover="li('b1')" onmouseout="an('b1')">
            <select id="sb1" name="sb1" class="xz" onblur="ss('b1')" style="margin:12px 0px;">
              <option value="8">8</option>
              <option value="7">7</option>
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('b2')" onmouseout="an('b2')">
        	<select id="sb2" name="sb2" class="xz" onblur="ss('b2')">
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('b3')" onmouseout="an('b3')">
        	<select id="sb3" name="sb3" class="xz" onblur="ss('b3')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('b4')" onmouseout="an('b4')">
        	<select id="sb4" name="sb4" class="xz" onblur="ss('b4')">
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
      </div>
      <div class="a4 dss">&nbsp;</div>
    </div>
    <!-- 4444444444444 -->
    <div class="b4">
        <div class="a1 b4">教学工作态度20%</div>
        <div class="a2 c4">
			<p id="c1" onmouseover="li('c1')" onmouseout="an('c1')">授课认真，精神饱满有激情；尊重学生人格，严格要求，经常与学生交流（5%）</p>
            <p id="c2" onmouseover="li('c2')" onmouseout="an('c2')">虚心听取各方意见，及时改进教学方法（4%）</p>
            <p id="c3" onmouseover="li('c3')" onmouseout="an('c3')">服从院系的工作安排，不推诿，不懈怠（8%）</p>
            <p id="c4" onmouseover="li('c4')" onmouseout="an('c4')">积极主持或参与教研项目（3%）</p>
        </div>
      <div class="a3 b4">
        <p onmouseover="li('c1')" onmouseout="an('c1')">
            <select id="sc1" name="sc1" class="xz" onblur="ss('c1')">
              <option value="5">5</option>
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
              <option value="8">8</option>
              <option value="7">7</option>
              <option value="6">6</option>
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('c4')" onmouseout="an('c4')">
        	<select id="sc4" name="sc4" class="xz" onblur="ss('c4')">
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
      </div>
      <div class="a4 d4">&nbsp;</div>
    </div>
    <!-- 55555555555 -->
    <div class="b4">
        <div class="a1 b4">日常课堂教学情况20%</div>
        <div class="a2 c4">
			<p id="d1" onmouseover="li('d1')" onmouseout="an('d1')">根据学科特点布置作业及阅读文献，引导学生自主学习（5%）</p>
            <p id="d2" onmouseover="li('d2')" onmouseout="an('d2')">严格课堂管理，落实考勤制度，学生上课积极性高，教学秩序好，课堂气氛活跃（5%）</p>
            <p id="d3" onmouseover="li('d3')" onmouseout="an('d3')">上课前检查相关的教学设备和仪器，并严格按要求操作（5%）</p>
            <p id="d4" onmouseover="li('d4')" onmouseout="an('d4')">提前到达教室，准时下课不拖堂，认真做开讲前准备和授课后整理（5%）</p>
        </div>
      <div class="a3 b4">
        <p onmouseover="li('d1')" onmouseout="an('d1')">
            <select id="sd1" name="sd1" class="xz" onblur="ss('d1')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('d2')" onmouseout="an('d2')">
        	<select id="sd2" name="sd2" class="xz" onblur="ss('d2')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('d3')" onmouseout="an('d3')">
        	<select id="sd3" name="sd3" class="xz" onblur="ss('d3')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
        <p onmouseover="li('d4')" onmouseout="an('d4')">
        	<select id="sd4" name="sd4" class="xz" onblur="ss('d4')">
              <option value="5">5</option>
              <option value="4">4</option>
              <option value="3">3</option>
              <option value="2">2</option>
              <option value="1">1</option>
            </select>
        </p>
      </div>
      <div class="a4 d4">&nbsp;</div>
    </div>
    
</div>
<div id="hui" onclick="fh()"></div>
<div id="bai"></div>
<div id="bbai"></div>
<div id="tiao"><img src="t.png" /></div>
<div class="an" onclick="tj()" id="ckjg">查看结果</div>
</form>
</body>

</html>