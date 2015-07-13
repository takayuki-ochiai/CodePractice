package framework;

public interface PrototypeProduct {
	public abstract void use(String s);
	
	public abstract PrototypeProduct createClone();
}

