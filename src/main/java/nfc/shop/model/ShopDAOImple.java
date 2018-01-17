package nfc.shop.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.*;
import org.mybatis.spring.SqlSessionTemplate;
import nfc.shop.model.MenuDTO;
import nfc.order.model.Order_menuDTO;
import nfc.admin.category.model.CategoryDTO;

public class ShopDAOImple implements ShopDAO {

	private SqlSessionTemplate sqlMap;

	public ShopDAOImple(SqlSessionTemplate sqlMap) {// 인자 생성자 생성
		super();
		this.sqlMap = sqlMap;
	}

	public int storeAdd(ShopDTO dto) {
		int result = sqlMap.insert("storeAdd", dto);
		return result;
	}

	public void cartIn(int idx, Order_menuDTO dto, HttpSession session, HttpServletResponse res) {

		HashMap<Integer, ArrayList> maps = new HashMap<Integer, ArrayList>();
		if (session.getAttribute("cartList") == null) {
			session.setAttribute("cartList", maps);
		}
		maps = (HashMap) session.getAttribute("cartList");

		if (!(maps.containsKey(idx))) {

			ArrayList<Order_menuDTO> arr = new ArrayList<Order_menuDTO>();
			arr.add(dto);
			maps.put(idx, arr);
			session.setAttribute("cartList", maps);

		} else {
			Boolean chk = true;
			ArrayList<Order_menuDTO> list = maps.get(idx);
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).chkdto(dto)) {
					list.get(i).setOrder_menu_amount(list.get(i).getOrder_menu_amount() + dto.getOrder_menu_amount());
					chk = false;
					break;
				}
			}
			if (chk) {
				list.add(dto);
			}
			maps.put(idx, list);
			session.setAttribute("cartList", maps);

		}

	}

	public List<ShopDTO> mapcode() {

		List<ShopDTO> arr = sqlMap.selectList("shopList");

		return arr;

	}

	public MenuDTO menuContent(int menu_idx,int member_idx) {
		HashMap map=new HashMap();
		
		map.put("menu_idx", menu_idx);
		map.put("member_idx", member_idx);
		MenuDTO dto = sqlMap.selectOne("menuContent2", map);
		return dto;
	}

	public String shoparea(String addr) {
		List<ShopDTO> arr = sqlMap.selectList("shoparea", addr);
		if (arr == null || arr.size() == 0) {
			return null;
		}
		String list = shopjson(arr);

		return list;

	}

	public String shopname(String name) {
		System.out.println(name);
		List<ShopDTO> arr = sqlMap.selectList("shopname", name);
		if (arr == null || arr.size() == 0) {
			return null;
		}
		String list = shopjson(arr);

		return list;

	}

	public String lookshop(int idx) {
		List<ShopDTO> arr = (List) sqlMap.selectList("lookshop", idx);
		String list = shopjson(arr);
		return list;
	}

	public List<ShopDTO> shopcategory() {
		List<ShopDTO> arr = (List) sqlMap.selectList("shopcategory");
		return arr;
	}

	public List<MenuDTO> menuList(int idx) {
		List<MenuDTO> arr = (List) sqlMap.selectList("menuList2", idx);
		return arr;
	}
	public CategoryDTO menuCategory(int idx) {
		CategoryDTO dto = sqlMap.selectOne("menuCategory",idx);
		return dto;
	}
	public List<MenuDTO> loadmenuList(){
		List<MenuDTO> arr = (List) sqlMap.selectList("loadMenu");
		return arr;
		
	}
	
	public ArrayList<Order_menuDTO> loadCartList(HttpSession session,int idx){
		HashMap<Integer, ArrayList> maps = new HashMap<Integer, ArrayList>();
		if (session.getAttribute("cartList") == null) {
			return null;
		}
		maps = (HashMap) session.getAttribute("cartList");
		ArrayList<Order_menuDTO> arrs = maps.get(idx);
		
		return arrs;
	}
	public String menujson(List<MenuDTO> arrs) {
		// 전체를 담아줄 객체를 설정
		JSONObject jsonMain = new JSONObject();
		JSONArray jArray = new JSONArray();
		// 하나의 정보를 저장할 JSONObject를 설정
		JSONObject jObject = null;
		// 얻은 DB의 정보 갯수만큼 반복
		if (!(arrs == null || arrs.size() == 0)) {

			for (int i = 0; i < arrs.size(); i++) {
				jObject = new JSONObject();
				// 앞부분에 KEY(이름)값을 입력하고 뒷부분에 해당되는 VALUE(DB내용)값 입력
				jObject.put("menu_idx", arrs.get(i).getMenu_idx());
				jObject.put("menu_turn", arrs.get(i).getMenu_turn());
				jObject.put("menu_name", arrs.get(i).getMenu_name());
				jObject.put("menu_price", arrs.get(i).getMenu_price());
				jObject.put("menu_img", arrs.get(i).getMenu_img());
				jObject.put("menu_state", arrs.get(i).getMenu_state());
				jObject.put("menu_category", arrs.get(i).getMenu_category());
				jObject.put("menu_buy", arrs.get(i).getMenu_buy());
				// JSONArray배열객체에 하나의 JSONObject를 저장
				jArray.add(i, jObject);// i가 0일경우 0번째 배열값이 기록
			}

			jsonMain.put("nfc_menu", jArray);
			return jsonMain.toJSONString();// 문자형으로 변환
		}
		return null;
	}

	public String shopjson(List<ShopDTO> arrs) {
		// 전체를 담아줄 객체를 설정
		JSONObject jsonMain = new JSONObject();
		JSONArray jArray = new JSONArray();
		// 하나의 정보를 저장할 JSONObject를 설정
		JSONObject jObject = null;
		// 얻은 DB의 정보 갯수만큼 반복
		for (int i = 0; i < arrs.size(); i++) {
			jObject = new JSONObject();
			// 앞부분에 KEY(이름)값을 입력하고 뒷부분에 해당되는 VALUE(DB내용)값 입력
			jObject.put("shop_idx", arrs.get(i).getShop_idx());
			jObject.put("shop_name", arrs.get(i).getShop_name());
			jObject.put("shop_area", arrs.get(i).getShop_area());
			jObject.put("shop_addr", arrs.get(i).getShop_addr());
			jObject.put("shop_tel", arrs.get(i).getShop_tel());
			jObject.put("shop_img", arrs.get(i).getShop_img());
			jObject.put("shop_lat", arrs.get(i).getShop_lat());
			jObject.put("shop_lng", arrs.get(i).getShop_lng());
			// JSONArray배열객체에 하나의 JSONObject를 저장
			jArray.add(i, jObject);// i가 0일경우 0번째 배열값이 기록
		}

		jsonMain.put("nfc_shop", jArray);
		return jsonMain.toJSONString();// 문자형으로 변환

	}

	public String cartjson(int idx, HttpSession session, HttpServletResponse res) {
		// 전체를 담아줄 객체를 설정
		JSONObject jsonMain = new JSONObject();
		JSONArray jArray = new JSONArray();
		// 하나의 정보를 저장할 JSONObject를 설정
		JSONObject jObject = null;

		HashMap<Integer, ArrayList> maps = new HashMap<Integer, ArrayList>();
		if (session.getAttribute("cartList") == null) {
			return null;
		}
		maps = (HashMap) session.getAttribute("cartList");
		ArrayList<Order_menuDTO> arrs = maps.get(idx);
		if (!(arrs == null || arrs.size() == 0)) {
			// 얻은 DB의 정보 갯수만큼 반복
			for (int i = 0; i < arrs.size(); i++) {
				jObject = new JSONObject();
				// 앞부분에 KEY(이름)값을 입력하고 뒷부분에 해당되는 VALUE(DB내용)값 입력
				jObject.put("menu_idx", arrs.get(i).getOrder_menu_idx());
				jObject.put("menu_name", arrs.get(i).getOrder_menu_name());
				jObject.put("menu_price", arrs.get(i).getOrder_menu_price());
				jObject.put("menu_amount", arrs.get(i).getOrder_menu_amount());
				jObject.put("menu_optiona", arrs.get(i).getOrder_menu_optiona());
				jObject.put("menu_optionb", arrs.get(i).getOrder_menu_optionb());
				jObject.put("menu_optionc", arrs.get(i).getOrder_menu_optionc());
				// JSONArray배열객체에 하나의 JSONObject를 저장
				jArray.add(i, jObject);// i가 0일경우 0번째 배열값이 기록
			}
		}
		jsonMain.put("cart_list", jArray);

		return jsonMain.toJSONString();// 문자형으로 변환

	}

	public String cartdel(int idx, Order_menuDTO dto, HttpSession session, HttpServletResponse res) {
		HashMap<Integer, ArrayList> maps = new HashMap<Integer, ArrayList>();
		if (session.getAttribute("cartList") == null) {
			return null;
		}
		maps = (HashMap) session.getAttribute("cartList");
		ArrayList<Order_menuDTO> arrs = maps.get(idx);
		if (arrs == null || arrs.size() == 0) {
			return null;
		}
		for (int i = 0; i < arrs.size(); i++) {
			Order_menuDTO dtos = arrs.get(i);
			if (dtos.chkdto(dto)) {
				arrs.remove(i);

				break;
			}
		}
		maps.put(idx, arrs);
		session.setAttribute("cartList", maps);

		return null;

	}

	public String cartamount(int idx, Order_menuDTO dto, HttpSession session, HttpServletResponse res) {

		HashMap<Integer, ArrayList> maps = new HashMap<Integer, ArrayList>();
		if (session.getAttribute("cartList") == null) {
			return null;
		}
		maps = (HashMap) session.getAttribute("cartList");
		ArrayList<Order_menuDTO> arrs = maps.get(idx);
		if (arrs == null || arrs.size() == 0) {
			return null;
		}
		for (int i = 0; i < arrs.size(); i++) {
			Order_menuDTO dtos = arrs.get(i);
			if (dtos.chkdto(dto)) {
				arrs.get(i).setOrder_menu_amount(dto.getOrder_menu_amount());
				break;
			}
		}
		maps.put(idx, arrs);
		session.setAttribute("cartList", maps);

		return null;

	}

	public List<ShopDTO> adminshopList(int cp,int ls){
		int startnum=(cp-1)*ls+1;
	    int endnum=cp*ls;
	    HashMap map=new HashMap();
	    map.put("startnum", startnum);
	    map.put("endnum", endnum);
		List<ShopDTO> list = sqlMap.selectList("adminshopList",map);
		return list;
		
	}

	public int adminshoptotalList() {
		
		int cnt = sqlMap.selectOne("adminshoptotal");
		return cnt;
		
	}

	public ShopDTO shopContent(int idx){
		
		ShopDTO list = sqlMap.selectOne("lookshop",idx);
		return list;
		
	}

	public int shopDel(int idx) {
		int result = sqlMap.delete("shopDel", idx);
		return result;
	}

	public int shopupdate(ShopDTO dto) {
		
		int result = sqlMap.update("admin_shopupdate", dto);
		return result;
	}

	public ShopDTO shopnameFind(int shop_idx) {

		ShopDTO dto=sqlMap.selectOne("shopnamefind", shop_idx);
		return dto;
	}
}
