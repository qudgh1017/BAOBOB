package spring.mvc.baobob.vo;

public class MenuVO {
	private int restaurant_menu_index; // 레스토랑_인덱스
	private String restaurant_menu_img; // 이미지
	private String restaurant_menu_name; // 메뉴명
	private String restaurant_menu_content; // 메뉴 설명
	private int restaurant_menu_price; // 가격

	public int getRestaurant_menu_index() {
		return restaurant_menu_index;
	}

	public void setRestaurant_menu_index(int restaurant_menu_index) {
		this.restaurant_menu_index = restaurant_menu_index;
	}

	public String getRestaurant_menu_img() {
		return restaurant_menu_img;
	}

	public void setRestaurant_menu_img(String restaurant_menu_img) {
		this.restaurant_menu_img = restaurant_menu_img;
	}

	public String getRestaurant_menu_name() {
		return restaurant_menu_name;
	}

	public void setRestaurant_menu_name(String restaurant_menu_name) {
		this.restaurant_menu_name = restaurant_menu_name;
	}

	public String getRestaurant_menu_content() {
		return restaurant_menu_content;
	}

	public void setRestaurant_menu_content(String restaurant_menu_content) {
		this.restaurant_menu_content = restaurant_menu_content;
	}

	public int getRestaurant_menu_price() {
		return restaurant_menu_price;
	}

	public void setRestaurant_menu_price(int restaurant_menu_price) {
		this.restaurant_menu_price = restaurant_menu_price;
	}
}
