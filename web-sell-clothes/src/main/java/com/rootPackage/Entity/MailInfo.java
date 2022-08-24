package com.rootPackage.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailInfo {
	private String from;
	private String to;
	private String[] cc;
	private String[] bcc;
	private String subject;
	private String body;
	private String[] attachments;
	public MailInfo(String to, String subject, String body) {
		this.from = "HỒ TRUNG TÍNH - PS14843 <tinhhtps14843@fpt.edu.vn>";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}
