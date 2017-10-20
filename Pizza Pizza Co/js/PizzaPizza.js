
function getReceipt() {
	var text1 = "<h3>You Ordered:</h3>";
	var runningTotal = 0; 
	var sizeTotal = 0; 
	var sizeArray = document.getElementsByClassName("size");

	for (var i=0; i<sizeArray.length;i++) {
		if (sizeArray[i].checked) {
			var selectedSize = sizeArray[i].value;
			text1 = text1+selectedSize+"<br>";
		}
	}
	if (selectedSize === "Personal Pizza") {
		sizeTotal = 6;
	} else if (selectedSize === "Medium Pizza") {
		sizeTotal = 10;
	} else if (selectedSize === "Large Pizza") {
		sizeTotal = 14;
	} else if (selectedSize === "Extra Large Pizza") {
		sizeTotal = 16;
	} 
	runningTotal = sizeTotal;
	console.log(selectedSize+" = $"+sizeTotal+".00");
	console.log("size text1: "+text1);
	console.log("subtotal: $"+runningTotal+".00");
	getMeat(runningTotal,text1); 
};


function getMeat(runningTotal,text1) {
	var meatTotal = 0;
	var selectedMeat = [];
	var meatArray = document.getElementsByClassName("meats");
	for (var j = 0; j < meatArray.length; j++) {
		if (meatArray[j].checked) {
			selectedMeat.push(meatArray[j].value);
			console.log("selected meat item: ("+meatArray[j].value+")");
			text1 = text1+meatArray[j].value+"<br>";
		}
	}
	var meatCount = selectedMeat.length;
	if (meatCount > 1) {
		meatTotal = (meatCount - 1);
	} else {
		meatTotal = 0;
	}
	runningTotal = (runningTotal + meatTotal);
	console.log("total selected meat items: "+meatCount);
	console.log(meatCount+" meat - 1 free meat = "+"$"+meatTotal+".00");
	console.log("meat text1: "+text1);
	console.log("Purchase Total: "+"$"+runningTotal+".00");
	document.getElementById("showText").innerHTML=text1;
	document.getElementById("totalPrice").innerHTML = "</h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
	getVeggie(runningTotal,text1);
};		
	

function getVeggie(runningTotal,text1) {
	var vegTotal = 0;
	var selectedVeg = [];
	var vegArray = document.getElementsByClassName("veggies");
	for (var k = 0; k < vegArray.length; k++) {
		if (vegArray[k].checked) {
			selectedVeg.push(vegArray[k].value);
			console.log("selected veggie item: ("+vegArray[k].value+")");
			text1 = text1+vegArray[k].value+"<br>";
		}
	}
	var vegCount = selectedVeg.length;
	if (vegCount > 1) {
		vegTotal = (vegCount - 1);
	} else {
		vegTotal = 0;
	}
	runningTotal = (runningTotal + vegTotal);
	console.log("total selected veg items: "+vegCount);
	console.log(vegCount+" veg - 1 free Veg = "+"$"+vegTotal+".00");
	console.log("veg text1: "+text1);
	console.log("Purchase Total: "+"$"+runningTotal+".00");
	document.getElementById("showText").innerHTML=text1;
	document.getElementById("totalPrice").innerHTML = "<h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
	getCheese(runningTotal,text1);
};


function getCheese(runningTotal, text1) {
	console.log("incoming cheese: "+runningTotal+"   "+text1);
	var cheeseTotal = 0;
	var selectedCheese = document.querySelector('input[name=Cheese]:checked').value;
	if (selectedCheese === "Extra Cheese") {
		cheeseTotal = 3;
	} else {
		cheeseTotal = 0;
	}
	runningTotal = (runningTotal + cheeseTotal);
	text1=text1+"<br>"+selectedCheese+"    + $"+cheeseTotal+".00"+"<br>"+"<br>";
	console.log("selected cheese: "+selectedCheese);
	console.log("cheese text1: "+text1);
	console.log("Purchase Total w cheese: "+"$"+runningTotal+".00");
	document.getElementById("showText").innerHTML=text1;
	document.getElementById("totalPrice").innerHTML = "</h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
	getCrust(runningTotal,text1);
}; 

function getCrust(runningTotal, text1) {
	console.log("incoming crust: "+runningTotal+"   "+text1);
	var crustTotal = 0;
	var selectedCrust = document.querySelector('input[name=Crust]:checked').value;
	if (selectedCrust === "Cheese Stuffed Crust") {
		crustTotal = 3;
	} else {
		crustTotal = 0;
	}
	runningTotal = (runningTotal + crustTotal);
	text1=text1+"<br>"+selectedCrust+"    + $"+crustTotal+".00"+"<br>";
	console.log("selected crust: "+selectedCrust);
	console.log("crust text1: "+text1);
	console.log("Purchase Total w crust: "+"$"+runningTotal+".00");
	document.getElementById("showText").innerHTML=text1;
	document.getElementById("totalPrice").innerHTML = "</h3>Total: $<strong>"+runningTotal+".00"+"</strong></h3>";
}; 
