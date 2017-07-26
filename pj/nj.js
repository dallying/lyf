function nnj(){
	var obj = document.getElementById("nj");
	var obj1 = document.getElementById("tkbj");
	obj1.innerHTML = "";
	var x;
	if (obj.value == "12级"){
		for (x in nj12){
			obj1.options.add(new Option(nj12[x],nj12[x]));//在当前选中的那个的值中改变
		}
	}else if (obj.value == "13级"){
		for (x in nj13){
			obj1.options.add(new Option(nj13[x],nj13[x]));
		}
	}else if (obj.value == "14级"){
		for (x in nj14){
			obj1.options.add(new Option(nj14[x],nj14[x]));
		}
	}else if (obj.value == "15级"){
		for (x in nj15){
			obj1.options.add(new Option(nj15[x],nj15[x]));
		}
	}else{
		obj1.options.add(new Option("请先选择班级","no"));
	}
	//obj1.options[obj.selectedIndex] = new Option(nj12[x],nj12[x]);//在当前选中的那个的值中改变
	//obj.options.add(new Option("1","4"));//添加一个option
	//obj.options[obj.selectedIndex].text = "a";//更改值
	//obj.remove(obj.selectedIndex);//删除功能
}