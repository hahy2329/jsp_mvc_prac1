package step2_00_loginEx;

import java.util.Date;

public class MemberDTO {

	
	private String memberId;
	private String passwd;
	private String name;
	private Date joinData;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoinData() {
		return joinData;
	}
	public void setJoinData(Date joinData) {
		this.joinData = joinData;
	}
	
	
	
	
	
}
