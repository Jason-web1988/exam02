function updateBoard(){
	if(validCheck()){
		alert("수정완료 되었습니다.");
		document.getElementById("updateBoard").submit();
	}
}

function insertBoard(){
	if(validCheck()){
		alert("게시글이 등록 되었습니다.");
		document.getElementById("insertBoard").submit();
	}
}


function validCheck(){
	if(document.getElementById("writer").value==0){
		alert("작성자를 입력해주세요");
		document.getElementById("writer").focus();
		return false;
	}
	if(document.getElementById("subject").value==0){
		alert("제목을 입력해주세요");
		document.getElementById("subject").focus();
		return false;
	}
	if(document.getElementById("content").value==0){
		alert("내용를 입력해주세요");
		document.getElementById("content").focus();
		return false;
	}
	return true;
}