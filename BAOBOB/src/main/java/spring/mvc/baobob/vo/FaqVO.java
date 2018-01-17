package spring.mvc.baobob.vo;

public class FaqVO {
	private int faq_index;
	private String faq_title;
	private String faq_sub_title;
	private String faq_content;

	public void setFaq_index(int faq_index) {
		this.faq_index = faq_index;
	}

	public int getFaq_index() {
		return faq_index;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_sub_title() {
		return faq_sub_title;
	}

	public void setFaq_sub_title(String faq_sub_title) {
		this.faq_sub_title = faq_sub_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
}
