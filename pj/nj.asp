var nj12 = new Array();
nj12(0)='12级物理班（本）';
nj12(1)='12级中文4班（本）';
nj12(2)='12级中文5班（本）';
nj12(3)='12级中文3班（本）';
nj12(4)='12级美术1班（本）';
nj12(5)='12级中文1班（本）';
nj12(6)='12级美术2班（本）';
nj12(7)='12级数学班（本）';
nj12(8)='12级历史班（本）';
nj12(9)='12级中文2班（本）';




function number(){
var obj = document.getElementById("tkbj");
	obj.options[obj.selectedIndex] = new Option("我的吃吃","4");//在当前选中的那个的值中改变
	obj.options.add(new Option("我的吃吃","4"));//再添加一个option
	//alert(obj.selectedIndex);//显示序号，option自己设置的
	//obj.options[obj.selectedIndex].text = "我的吃吃";//更改值
	//obj.remove(obj.selectedIndex);//删除功能
}