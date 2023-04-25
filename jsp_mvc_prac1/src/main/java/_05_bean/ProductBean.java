package _05_bean;

public class ProductBean {
	private String pdCd;
	private String pdNm;
	private String deptCd;
	private String deptNm;
	private String mgrCd;
	private String mgrNm;
	
	
	public String getPdCd() {
		return pdCd;
	}
	public void setPdCd(String pdCd) {
		this.pdCd = pdCd;
	}
	public String getPdNm() {
		return pdNm;
	}
	public void setPdNm(String pdNm) {
		this.pdNm = pdNm;
	}
	public String getDeptCd() {
		return deptCd;
	}
	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getMgrCd() {
		return mgrCd;
	}
	public void setMgrCd(String mgrCd) {
		this.mgrCd = mgrCd;
	}
	public String getMgrNm() {
		return mgrNm;
	}
	public void setMgrNm(String mgrNm) {
		this.mgrNm = mgrNm;
	}
	@Override
	public String toString() {
		return "ProductBean [pdCd=" + pdCd + ", pdNm=" + pdNm + ", deptCd=" + deptCd + ", deptNm=" + deptNm + ", mgrCd="
				+ mgrCd + ", mgrNm=" + mgrNm + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
