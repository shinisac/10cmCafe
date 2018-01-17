	function getNumString(s) {
        var rtn = parseFloat(s.replace(/,/gi, ""));
        if (isNaN(rtn)) {
            return 0;
        }
        else {
            return rtn;
        }
    }
	 function getNumber(obj){
	        
         var num01;
         var num02;
         num01 = obj.value;
         num02 = num01.replace(/\D/g,""); //숫자가 아닌것을 제거, 
                                          //즉 [0-9]를 제외한 문자 제거; /[^0-9]/g 와 같은 표현
         num01 = setComma(num02); //콤마 찍기
         obj.value =  num01;

    }
    function setComma(n) {
         var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
         n += '';                          // 숫자를 문자열로 변환         
         while (reg.test(n)) {
            n = n.replace(reg, '$1' + ',' + '$2');
         }         
         return n;
    }
    function foo(timestamp){



    	var date = new Date(timestamp);

    	var year = date.getFullYear();

    	var month = date.getMonth()+1;

    	var day = date.getDay();

    	var hour = date.getHours();

    	var min = date.getMinutes();

    	var sec = date.getSeconds();



    	var retVal =   year + "-" + (month < 10 ? "0" + month : month) + "-" 

    	                        + (day < 10 ? "0" + day : day) + " " 

    	                        + (hour < 10 ? "0" + hour : hour) + ":"

    	                        + (min < 10 ? "0" + min : min) + ":" 

    	                        + (sec < 10 ? "0" + sec : sec);



    	return retVal;

    	}