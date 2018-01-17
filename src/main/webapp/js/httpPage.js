function sendPost(url,arg){
	    // Form객체를 만들고 속성값들을 추가함
	    var oForm = document.createElement('form');
	  
	    oForm.method = "post";
	    oForm.action = url;
	     
	    var equIndex = 0;
	     
	    var argArr = arg.split("&");
	    for(var i=0 ; i<argArr.length; i++){
	        leftStr = "";
	        oInputHidden = document.createElement("input");
	        oInputHidden.type       = "hidden";
	        oInputHidden.name       = argArr[i].split("=")[0];
	        equIndex = argArr[i].indexOf("=") + 1;
	        oInputHidden.value  = argArr[i].substr(equIndex);
	        oForm.appendChild(oInputHidden);
	    }
	    // Form안에 TextBox를 넣음
	    oForm.appendChild(oInputHidden);
	    // Body안에 Form을 넣음
	    document.body.appendChild(oForm);
	    oForm.submit();
	}
