package nfc.ordermenu.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import nfc.order.model.OrderDTO;
import nfc.warehousing.model.ShopDTO;

public class OrderMenuDAOImple implements OrderMenuDAO {
private SqlSessionTemplate sqlMap;
	
	public OrderMenuDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<ShopDTO> shopList(){
		List<ShopDTO> list=sqlMap.selectList("orderShop");
		return list;
	}

	public List<OrderMenuDTO> orderList(int idx) {
		
		List<OrderMenuDTO> list=sqlMap.selectList("orderList", idx);
		return list;
	}

	public int reserveOk(int idx, int shop_idx) {
		
		Map data=new HashMap();
		data.put("idx", idx);
		data.put("shop_idx", shop_idx);
		
		int count=sqlMap.update("reserveUpdate", data);
		return count;
	}

	public int orderOk(int idx, int shop_idx) {
		
		Map data=new HashMap();
		data.put("idx", idx);
		data.put("shop_idx", shop_idx);
		
		int count=sqlMap.update("orderUpdate", data);
		int count2=sqlMap.update("orderUpdate2", data);
		return count;
	}

	public List<OrderMenuDTO> detailList(int idx) {
		
		List<OrderMenuDTO> list=sqlMap.selectList("detailList",idx);
		return list;
	}

	public int orderDel(int idx, int shop_idx) {
		
		Map data=new HashMap();
		data.put("idx", idx);
		data.put("shop_idx", shop_idx);
		
		int count=sqlMap.delete("orderDelete", data);
		return count;
	}
}
