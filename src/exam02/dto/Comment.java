package exam02.dto;

import java.sql.Timestamp;

public class Comment {
	private int idx;
	private int bidx;
	private String writer;
	private String content;
	private Timestamp regDate;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int idx, int bidx, String writer, String content, Timestamp regDate) {
		super();
		this.idx = idx;
		this.bidx = bidx;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}
	
	public Comment(int bidx, String writer, String content) {
		super();
		this.bidx = bidx;
		this.writer = writer;
		this.content = content;
	}
	public final int getIdx() {
		return idx;
	}
	public final void setIdx(int idx) {
		this.idx = idx;
	}
	public final int getBidx() {
		return bidx;
	}
	public final void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public final String getWriter() {
		return writer;
	}
	public final void setWriter(String writer) {
		this.writer = writer;
	}
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}
	public final Timestamp getRegDate() {
		return regDate;
	}
	public final void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return String.format("Comment [idx=%s, bidx=%s, writer=%s, content=%s, regDate=%s]", idx, bidx, writer, content,
				regDate);
	}
	
	
}
