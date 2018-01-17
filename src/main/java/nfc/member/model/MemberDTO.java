package nfc.member.model;

import java.sql.Timestamp;


public class MemberDTO {
	private int member_idx;
	private String member_state;
	private String member_phone;
	private String member_email;
	private String member_pwd;
	private int member_point;
	private String member_name;
	private Timestamp member_date;
	private Timestamp member_deldate;
	private String member_key;
	public MemberDTO() {
		super();
	}
	public MemberDTO(int member_idx, String member_state, String member_phone, String member_email, String member_pwd,
			int member_point, String member_name, Timestamp member_date, Timestamp member_deldate, String member_key) {
		super();
		this.member_idx = member_idx;
		this.member_state = member_state;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_pwd = member_pwd;
		this.member_point = member_point;
		this.member_name = member_name;
		this.member_date = member_date;
		this.member_deldate = member_deldate;
		this.member_key = member_key;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_state() {
		return member_state;
	}
	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Timestamp getMember_date() {
		return member_date;
	}
	public void setMember_date(Timestamp member_date) {
		this.member_date = member_date;
	}
	public Timestamp getMember_deldate() {
		return member_deldate;
	}
	public void setMember_deldate(Timestamp member_deldate) {
		this.member_deldate = member_deldate;
	}
	public String getMember_key() {
		return member_key;
	}
	public void setMember_key(String member_key) {
		this.member_key = member_key;
	}
	
	
}
