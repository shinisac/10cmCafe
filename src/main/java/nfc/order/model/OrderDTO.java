package nfc.order.model;

import java.sql.Timestamp;

public class OrderDTO {
 
   private int order_idx;
   private int shop_idx;
   private Timestamp order_date;
   private String order_pay;
   private int order_price;
   private String order_state;
   private int member_idx;
   private String shop_name;
   
   public OrderDTO() {
      super();
   }
   public OrderDTO(int order_idx, int shop_idx, Timestamp order_date, String order_pay, int order_price,
         String order_state, int member_idx) {
      super();
      this.order_idx = order_idx;
      this.shop_idx = shop_idx;
      this.order_date = order_date;
      this.order_pay = order_pay;
      this.order_price = order_price;
      this.order_state = order_state;
      this.member_idx = member_idx;
   }
   public int getOrder_idx() {
      return order_idx;
   }
   public void setOrder_idx(int order_idx) {
      this.order_idx = order_idx;
   }
   public int getShop_idx() {
      return shop_idx;
   }
   public void setShop_idx(int shop_idx) {
      this.shop_idx = shop_idx;
   }
   public Timestamp getOrder_date() {
      return order_date;
   }
   public void setOrder_date(Timestamp order_date) {
      this.order_date = order_date;
   }
   public String getOrder_pay() {
      return order_pay;
   }
   public void setOrder_pay(String order_pay) {
      this.order_pay = order_pay;
   }
   public int getOrder_price() {
      return order_price;
   }
   public void setOrder_price(int order_price) {
      this.order_price = order_price;
   }
   public String getOrder_state() {
      return order_state;
   }
   public void setOrder_state(String order_state) {
      this.order_state = order_state;
   }
   public int getMember_idx() {
      return member_idx;
   }
   public void setMember_idx(int member_idx) {
      this.member_idx = member_idx;
   }
   public String getShop_name() {
      return shop_name;
   }
   public void setShop_name(String shop_name) {
      this.shop_name = shop_name;
   }
   
   
   
}