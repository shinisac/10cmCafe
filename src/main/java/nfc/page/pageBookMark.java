package nfc.page;

public class pageBookMark {
	
	//프로그램이 시작할떄 바로 갖다쓰기(페이지)
	public static String makePage(String pagename,int totalCnt,int listSize,int pageSize,int cp) {
		
		
		
		StringBuffer sb=new StringBuffer();
		
		int totalPage=totalCnt/listSize+1;{
		if(totalCnt%listSize==0)totalPage--;
		}
		int userGroup=cp/pageSize;{
		if(cp%pageSize==0) userGroup--;
		}
		

		 //왼쪽 << 표시
			if(userGroup!=0){
				sb.append("<a href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=(userGroup-1)*pageSize+pageSize;
				sb.append(temp);
				sb.append("'>&lt;&lt;</a>");
			}
				
		//페이지 보여주기   1,2,3,4,5 
				
		
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			sb.append("&nbsp;&nbsp;");

			if(cp==i) {
				sb.append("<font color='red'>");
				sb.append(i);
				sb.append("</font>");
			}else {
				sb.append("<a href='javascript:bookMarkList("+i+");");
				
//				sb.append(pagename);
//				sb.append("?cp=");
//				sb.append(i);
				sb.append("'>");
				sb.append(i);
				
			}
			sb.append("</a>&nbsp;&nbsp;");
			if(i==totalPage) break;  //브레이크 건이유는 총페이지수가 13페이지인데 그룹때문에 15페이지까지나올때 브레이크걸어줌
		}
			
		 //오른쪽 >>표시
			if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				
				
				
//				sb.append(pagename);
//				sb.append("?cp=");
				int temp=(userGroup+1)*pageSize+1;
				sb.append("<a href='javascript:bbookMarkList("+temp+");'>&gt;&gt;</a>");
//				sb.append(temp);
//				sb.append("'>&gt;&gt;</a>");

		
		
			}
				return sb.toString();

			
	}
}

