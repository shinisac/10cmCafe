package nfc.admin_member.model;

public class Admin_memberDTO {
	private int admin_member_idx;
	private String admin_member_id;
	private String admin_member_pwd;
	
	public Admin_memberDTO() {
		super();
	}

	public Admin_memberDTO(int admin_member_idx, String admin_member_id, String admin_member_pwd) {
		super();
		this.admin_member_idx = admin_member_idx;
		this.admin_member_id = admin_member_id;
		this.admin_member_pwd = admin_member_pwd;
	}

	public int getAdmin_member_idx() {
		return admin_member_idx;
	}

	public void setAdmin_member_idx(int admin_member_idx) {
		this.admin_member_idx = admin_member_idx;
	}

	public String getAdmin_member_id() {
		return admin_member_id;
	}

	public void setAdmin_member_id(String admin_member_id) {
		this.admin_member_id = admin_member_id;
	}

	public String getAdmin_member_pwd() {
		return admin_member_pwd;
	}

	public void setAdmin_member_pwd(String admin_member_pwd) {
		this.admin_member_pwd = admin_member_pwd;
	}
}
