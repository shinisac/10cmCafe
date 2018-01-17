package nfc.page;

public class PageModule {
	//이메소드는 프로그램이 시작할때 메모리에 바로 올라가기때문에 바로 가져다 쓸 수 있다.
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, int shop_idx){
		
		StringBuffer sb=new StringBuffer();
		int totalPage=totalCnt/listSize+1;
		
		if(totalCnt%listSize==0)totalPage--;

		int userGroup=cp/pageSize;//그룹화

		if(cp%pageSize==0)userGroup--;//딱 나눠떨어졋을때 하나를 줄여 그룹화를 맞춰준다.
		
		if(userGroup!=0){//왼쪽으로가는 화살표
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp=(userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("&shop_idx=");
			int temp2=shop_idx;
			sb.append(temp2);
			sb.append("'>&lt;&lt;</a>");
			
		}
		
	
		for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize+pageSize); i++){//중간 숫자
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("&shop_idx=");
			int temp2=shop_idx;
			sb.append(temp2);
			sb.append("'>");
			if(cp==i){
				sb.append("<font color='red'>");
				sb.append(i);
				sb.append("</font>");
			}else{
				sb.append(i);
			}
			
			sb.append("</a>&nbsp;&nbsp;");
		
			if(i==totalPage)break;
		}
	
		if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){//오른쪽으로 가는 화살표
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp=(userGroup+1)*pageSize+1;//다음페이지cp
			sb.append(temp);
			sb.append("&shop_idx=");
			int temp2=shop_idx;
			sb.append(temp2);
			sb.append("'>&gt;&gt;</a>");
		
		}
		
		return sb.toString();//String버퍼값 반환
	}
	
	public static String makePage2(String pagename, int totalCnt, int listSize, int pageSize, int cp) { 


		StringBuffer sb = new StringBuffer(); 

		int totalPage = totalCnt / listSize + 1; 
		if (totalCnt % listSize == 0) {
			totalPage--;
		}
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) {
			userGroup--;
		}

		if(userGroup!=0){
		
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=1'>&lt;&lt;맨 앞</a>");
		} 
		
		
		if (userGroup != 0) { 
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'>&lt;이전</a>");
		}

		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) { 
																								
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if (i == totalPage) {
				break;
			}
		}

		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'>다음&gt;</a>");
		}
		
		if(userGroup!=totalPage/pageSize){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(totalPage);
			sb.append("'>맨 끝&gt;&gt;</a>");			
			}
		
		return sb.toString();
	}
	
	public static String shopPage(String pagename, int totalCnt, int listSize, int pageSize, int cp) { 

		StringBuffer sb = new StringBuffer(); 

		int totalPage = totalCnt / listSize + 1; 
		if (totalCnt % listSize == 0) {
			totalPage--;
		}
		int userGroup = cp / pageSize;
		if (cp % pageSize == 0) {
			userGroup--;
		}

		if(userGroup!=0){
		
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=1'>&lt;&lt;맨 앞</a>");
		} 
		
		
		if (userGroup != 0) { 
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'>&lt;이전</a>");
		}

		for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) { 
																								
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if (i == totalPage) {
				break;
			}
		}

		if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'>다음&gt;</a>");
		}
		
		if(userGroup!=totalPage/pageSize){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(totalPage);
			sb.append("'>맨 끝&gt;&gt;</a>");			
			}
		
		return sb.toString();
	}
	public static String makePage3(String pagename, int totalCnt, int listSize, int pageSize, int cp) { 


	      StringBuffer sb = new StringBuffer(); 

	      int totalPage = totalCnt / listSize + 1; 
	      if (totalCnt % listSize == 0) {
	         totalPage--;
	      }
	      int userGroup = cp / pageSize;
	      if (cp % pageSize == 0) {
	         userGroup--;
	      }

	      if(userGroup!=0){
	      
	         sb.append("<a href='");
	         sb.append(pagename);
	         sb.append("?cp=1'>&lt;&lt;맨 앞</a>");
	      } 
	      
	      
	      if (userGroup != 0) { 
	         sb.append("<a href='");
	         sb.append(pagename);
	         sb.append("?cp=");
	         int temp = (userGroup - 1) * pageSize + pageSize;
	         sb.append(temp);
	         sb.append("'>&lt;이전</a>");
	      }

	      for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) { 
	                                                                        
	         sb.append("&nbsp;&nbsp;<a href='");
	         sb.append(pagename);
	         sb.append("?cp=");
	         sb.append(i);
	         sb.append("'>");
	         sb.append(i);
	         sb.append("</a>&nbsp;&nbsp;");
	         if (i == totalPage) {
	            break;
	         }
	      }

	      if (userGroup != (totalPage / pageSize - (totalPage % pageSize == 0 ? 1 : 0))) {
	         sb.append("<a href='");
	         sb.append(pagename);
	         sb.append("?cp=");
	         int temp = (userGroup + 1) * pageSize + 1;
	         sb.append(temp);
	         sb.append("'>다음&gt;</a>");
	      }
	      
	      if(userGroup!=totalPage/pageSize){
	         sb.append("<a href='");
	         sb.append(pagename);
	         sb.append("?cp=");
	         sb.append(totalPage);
	         sb.append("'>맨 끝&gt;&gt;</a>");         
	         }
	      
	      return sb.toString();
	   }
}
