package nfc.order.model;

public class MonthDTO {
	
	private int ja;
	private int fa;
	private int march;
	private int ap;
	private int ma;
	private int june;
	private int ju;
	private int au;
	private int sa;
	private int oc;
	private int no;
	private int de;
	
	public MonthDTO() {
		super();
	}

	public MonthDTO(int ja, int fa, int march, int ap, int ma, int june, int ju, int au, int sa, int oc, int no,
			int de) {
		super();
		this.ja = ja;
		this.fa = fa;
		this.march = march;
		this.ap = ap;
		this.ma = ma;
		this.june = june;
		this.ju = ju;
		this.au = au;
		this.sa = sa;
		this.oc = oc;
		this.no = no;
		this.de = de;
	}

	public int getJa() {
		return ja;
	}

	public void setJa(int ja) {
		this.ja = ja;
	}

	public int getFa() {
		return fa;
	}

	public void setFa(int fa) {
		this.fa = fa;
	}

	public int getMarch() {
		return march;
	}

	public void setMarch(int march) {
		this.march = march;
	}

	public int getAp() {
		return ap;
	}

	public void setAp(int ap) {
		this.ap = ap;
	}

	public int getMa() {
		return ma;
	}

	public void setMa(int ma) {
		this.ma = ma;
	}

	public int getJune() {
		return june;
	}

	public void setJune(int june) {
		this.june = june;
	}

	public int getJu() {
		return ju;
	}

	public void setJu(int ju) {
		this.ju = ju;
	}

	public int getAu() {
		return au;
	}

	public void setAu(int au) {
		this.au = au;
	}

	public int getSa() {
		return sa;
	}

	public void setSa(int sa) {
		this.sa = sa;
	}

	public int getOc() {
		return oc;
	}

	public void setOc(int oc) {
		this.oc = oc;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getDe() {
		return de;
	}

	public void setDe(int de) {
		this.de = de;
	}
}
