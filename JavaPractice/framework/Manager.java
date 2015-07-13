package framework;

import java.util.HashMap;

public class Manager {
	private HashMap<String, PrototypeProduct> showcase = new HashMap<String, PrototypeProduct>();
	public void register(String name, PrototypeProduct photo) {
		showcase.put(name, photo);
	}
	
	public PrototypeProduct create(String name) {
		PrototypeProduct product = (PrototypeProduct)showcase.get(name);
		return product.createClone();
	}
}
