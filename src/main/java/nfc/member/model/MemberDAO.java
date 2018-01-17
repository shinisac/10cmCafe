package nfc.member.model;

import java.util.List;

public interface MemberDAO {
	public int memberJoin(MemberDTO dto);
	public int emailCheck(String member_email);
	public int phoneCheck(String member_phone);
	public int mailChk(String keys);
	public int loginOk(String member_email,String member_pwd);
	public int loginOk2(String member_email,String member_pwd);
	public MemberDTO idFind(String name,String phone);
	public MemberDTO pwdCheck(String name,String email);
	public int pwdChange(String member_email,String member_pwd);
	public MemberDTO myPage(String member_email);
	public int memberOut(String member_email); 
	public List<MemberDTO> admin_memberList(int ls,int cp);
	public List<MemberDTO> admin_memberFind(String searchsel,String keyword,int ls,int cp);
	public List<MemberDTO> memberOutList(int ls,int cp);
	public List<MemberDTO> admin_memberOutFind(String searchsel,String keyword,int ls,int cp);
	public MemberDTO member_info(int idx); 
	public int memberIdx(String member_email);
	public int member_PointGive(int point,int idx);
	public int member_pointUpdate(int point,int idx, String point_content);
	public int getMemberTotal();
	public int getMemberFindTotal(String sel,String keyword);
	public int getMemberOutTotal();
	public int getMemberOutFindTotal(String sel,String keyword);
	public List<MemberDTO>  getMemberIdxTotal();
	public String getPwd(String member_email);
	public int admin_memberDel(int member_idx);
}
