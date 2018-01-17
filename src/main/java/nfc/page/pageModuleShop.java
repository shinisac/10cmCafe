package nfc.page;

public class pageModuleShop {
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
}
