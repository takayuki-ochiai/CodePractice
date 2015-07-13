package idcard;

import framework.Product;

public class IDCard extends Product {
	private String owner;
	public IDCard(String owner) {
		this.owner = owner;
		System.out.println(this.owner + "のカードを作ります");
	}
	
	public void use() {
		System.out.println(this.owner + "のカードを使います");
	}
	
	public String getOwner() {
		return this.owner;
	}
}
