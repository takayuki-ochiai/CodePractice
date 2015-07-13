package builder;

public class Director {
	private Builder builder;
	public Director(Builder builder) {
		this.builder = builder;
	}
	
	public void construct() {
		builder.makeTitle("Greeting");
		builder.makeString("朝から昼にかけて");
		builder.makeItems(new String[]{"おはようございます", "こんにちは"});
		builder.close();
	}
}
