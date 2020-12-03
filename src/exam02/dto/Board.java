package exam02.dto;

import java.sql.Timestamp;

public class Board {
	private int idx;
	private String writer;
	private String subject;
	private String content;
	private Timestamp regDate;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int idx, String writer, String subject, String content, Timestamp regDate) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.regDate = regDate;
	}
	
	public Board(int idx, String writer, String subject, String content) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}
	
	
	public Board(String writer, String subject, String content) {
		super();
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}
	public final int getIdx() {
		return idx;
	}
	public final void setIdx(int idx) {
		this.idx = idx;
	}
	public final String getWriter() {
		return writer;
	}
	public final void setWriter(String writer) {
		this.writer = writer;
	}
	public final String getSubject() {
		return subject;
	}
	public final void setSubject(String subject) {
		this.subject = subject;
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
		return String.format("Board [idx=%s, writer=%s, subject=%s, content=%s, regDate=%s]", idx, writer, subject,
				content, regDate);
	}
	
	
}
