package nfc.order.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import nfc.point.model.PointDTO;
import nfc.member.model.MemberDTO;
import nfc.shop.model.ShopDTO;

public class OrderDAOImple implements OrderDAO {
	private SqlSessionTemplate sqlMap;

	public OrderDAOImple(SqlSessionTemplate sqlMap) {// 인자 생성자 생성
		super();
		this.sqlMap = sqlMap;
	}
	
	
	public ArrayList<Order_menuDTO> orderpage(int idx,HttpSession session){
		HashMap<Integer, ArrayList> maps = (HashMap<Integer, ArrayList>) session.getAttribute("cartList");
		ArrayList<Order_menuDTO> arr = maps.get(idx);	
		
		if(session.getAttribute("orderList")!=null) {
			session.removeAttribute("orderList");
		}
		maps.put(idx, arr);
		session.setAttribute("orderList", maps);
		return arr;
	}
	
	public List<ShopDTO> lookshop(int idx) {
		List<ShopDTO> arr = (List) sqlMap.selectList("lookshop", idx);

		return arr;
	}
	
	public int orderinfo(PointDTO points,OrderDTO dto,HttpSession session) {
		int memberidx = (Integer) session.getAttribute("member_idx");
		dto.setMember_idx(memberidx);
		int result = sqlMap.insert("orderinfo",dto);
		int cnt = 0;
		if(result>0) {
			HashMap map = (HashMap) session.getAttribute("orderList");	
			ArrayList ordermenu = (ArrayList) map.get(dto.getShop_idx());
			Order_menuDTO odto=null;
			for(int i=0;i<ordermenu.size();i++) {
				odto = (Order_menuDTO) ordermenu.get(i);
				
				HashMap sqlmap = new HashMap();
				sqlmap.put("dto", dto);
				sqlmap.put("odto",odto);
				cnt+=sqlMap.insert("ordermenu",sqlmap);
				session.removeAttribute("cartList");
			}
			if(cnt>0) {
				int point = (int) (dto.getOrder_price()*0.03);

				points.setPoint_save(point);
				points.setPoint_member(memberidx);
				points.setPoint_shop(dto.getShop_idx());
				
				if(points.getPoint_save()>0) {
					sqlMap.insert("pointsaving",points);
				}
				if(points.getPoint_use()>0) {
					sqlMap.insert("pointusing",points);
				}
				Map mpoint = new HashMap();
				mpoint.put("member", memberidx);
				mpoint.put("point",points.getPoint_use()-point);
				sqlMap.update("point_member",mpoint);
				
			}
		}
			
		return result;
	}
	public int memberPoint(HttpSession session) {
		if(session.getAttribute("member_idx")!=null) {
			int loginidx = (Integer) session.getAttribute("member_idx");
			MemberDTO dto = sqlMap.selectOne("memberpoint",loginidx);
			
			return dto.getMember_point();
			
		}
		return -1;
	}
	
	public List<OrderDTO> beforeOrderListForm(int idx) {
		List<OrderDTO> dto=sqlMap.selectList("beforeOrderListForm", idx);
		return dto;
	}

	public List<ShopDTO> shopList(){
		List<ShopDTO> list=sqlMap.selectList("salesShop");
		return list;
	}
	
	public List<OrderDTO> salesTotalList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		
		List<OrderDTO> list=sqlMap.selectList("salesTotalList", data);
		return list;
	}
	
	public List<OrderDTO> salesList(int cp, int ls, int shop_idx){
		
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", shop_idx);
		
		
		List<OrderDTO> list=sqlMap.selectList("salesList", data);
		return list;
	}
	
	public int getTotalCnt() {
		
		int count=sqlMap.selectOne("salesTotalCnt");
		return count==0?1:count;
	}
	
	public int todayPrice(int shop_idx) {
		
		int count=sqlMap.selectOne("todayPrice", shop_idx);
		return count;
	}
	
	public int todayCount(int shop_idx) {
		
		int count=sqlMap.selectOne("todayCount", shop_idx);
		return count;
	}
	
	public List<OrderDTO> salesSearch(String start, String end, int shop_idx) {
	
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("shop_idx", shop_idx);
		
		List<OrderDTO> list=sqlMap.selectList("salesSearch",data);
		return list;
	}
	
	public List<OrderDTO> salesTotalSearch(String start, String end) {
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		
		List<OrderDTO> list=sqlMap.selectList("salesTotalSearch", data);
		return list;
	}
	
	public MonthDTO monthPrice1(int shop_idx) {
		MonthDTO dto=sqlMap.selectOne("monthPrice1", shop_idx);
		return dto;
	}

	public MonthDTO monthPrice2(int shop_idx) {
		MonthDTO dto2=sqlMap.selectOne("monthPrice2", shop_idx);
		return dto2;
	}

	public MonthDTO monthPrice3(int shop_idx) {
		MonthDTO dto3=sqlMap.selectOne("monthPrice3", shop_idx);
		return dto3;
	}

	public int todayTotalPrice() {
		int count=sqlMap.selectOne("todayTotalPrice");
		return count;
	}

	public int todayTotalCount() {
		int count=sqlMap.selectOne("todayTotalCount");
		return count;
	}

	public MonthDTO monthTotalPrice1() {
		
		MonthDTO dto=sqlMap.selectOne("monthTotalPrice1");
		return dto;
	}
	
	public MonthDTO monthTotalPrice2() {
		MonthDTO dto2=sqlMap.selectOne("monthTotalPrice2");
		return dto2;
	}

	public MonthDTO monthTotalPrice3() {
		MonthDTO dto3=sqlMap.selectOne("monthTotalPrice3");
		return dto3;
	}

	public OrderDTO salesTotalSearchPrice(String start, String end) {
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		
		OrderDTO dto=sqlMap.selectOne("salesTotalSearchPrice", data);
		return dto;
	}

	public OrderDTO salesSearchPrice(String start, String end, int shop_idx) {
		
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("shop_idx", shop_idx);
		
		OrderDTO dto=sqlMap.selectOne("salesSearchPrice", data);
		System.out.println(" fgdfgdfgdfg "+dto);
		
		
		if(dto==null) {
			dto=new OrderDTO();
			dto.setOrder_price(0);
		}
		return dto;
	}

	public nfc.warehousing.model.ShopDTO wshopName(int shop_idx) {
	
		nfc.warehousing.model.ShopDTO dto=sqlMap.selectOne("shop_name", shop_idx);
		return dto;
	}
}
