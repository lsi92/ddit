function CheckAddProduct(){
	let form = document.newProduct;
	
	//1) 상품 아이디 체크
	//첫 글자는 P, 숫자를 조합하여 5~12자리까지 입력
	//P1234
	let regExpId = /^P[0-9]{4,11}/;
	if(!regExpId.test(form.productId.value)){
		alert("[상품코드]\nP와 숫자를 조합핳여 5~12자리까지 입력하세요\n첫글자는 P로 시작하세요");
		form.productId.select();
		form.productId.focus();
		return false;
	}
	
	//2) 상품명 체크
	//4~12자 까지 입력가능
	//삼성갤럭시S22
	if(form.pname.value.length<4||form.pname.value.length>12){
		alert("[상품명]\n최소4자에서 최대12자까지 입력하세요");
		form.pname.select();
		form.pname.focus();
		return false; //함수 멈춤
	}
	
	//3) 상품 가격 체크
	//숫자만 입력가능, 음수는 x
	//200000
	if(form.unitPrice.value.length==0||isNaN(form.unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		form.unitPrice.select();
		form.unitPrice.focus();
		return false;
	}
	
	if(form.unitPrice.value<0){
		alert("[가격]\n음수는 입력할 수 없습니다");
		form.unitPrice.select();
		form.unitPrice.focus();
		return false;
	}
	
	//200000.12 소수점 둘째자리까지만 허용(+:하나이상), [0-9] = \d
	// /^\d+((\.)?[0-9]{1,2})?)?$/;
	// /^\d+$/; -> 정수만 입력할 수 있게
	let regExpUnitPrice = /^\d+(?:[.]?[\d]?[\d])?$/;
	if(!regExpUnitPrice.test(form.unitPrice.value)){
		alert("[가격]\n가격은 소수점 둘째자리까지만 허용됩니다");
		form.unitPrice.select();
		form.unitPrice.focus();
		return false;
	}
	
	//4) 재고수
	//숫자만 입력 가능
	if(form.unitsInStock.value.length==0||isNaN(form.unitsInStock.value)){
		alert("[재고수]\n숫자만 입력해주세요");
		form.unitsInStock.select();
		form.unitsInStock.focus();
		return false;
	}
	
	//유효성 검사를 모두 통과했다면
	//alert("모두 통과!!");
	form.submit();
}