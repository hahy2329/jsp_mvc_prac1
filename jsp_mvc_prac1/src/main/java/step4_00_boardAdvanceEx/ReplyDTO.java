package step4_00_boardAdvanceEx;

import java.util.Date;

public class ReplyDTO {
	private long replyId;
	private String writer;
	private String content;
	private String passwd;
	private Date enrollDt;
	private long boardDt;
	
	public long getReplyId() {
		return replyId;
	}
	public void setReplyId(long replyId) {
		this.replyId = replyId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public long getBoardDt() {
		return boardDt;
	}
	public void setBoardDt(long boardDt) {
		this.boardDt = boardDt;
	}
	
	
	
	
	
}