package mall_client.vo;

public class Comment {
	private int commentNo;
	private int noticeNo;
	private String managerId; // FK 댓글을 지울때 필요
	private String commentContent;
	private String commentDate;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", noticeNo=" + noticeNo + ", managerId=" + managerId
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
	// 디버깅 한번에 하기 위해 toString()함수 오버라이딩
}
