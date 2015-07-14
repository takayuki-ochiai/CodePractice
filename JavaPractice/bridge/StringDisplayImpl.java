package bridge;

public class StringDisplayImpl extends DisplayImpl {
	private String string;
	private int width;
	public StringDisplayImpl(String string) {
		this.string = string;
		this.width = string.getBytes().length;
	}
	
	public void rawOpen() {
		this.printLine();
	}
	
	public void rawPrint() {
		System.out.println("|" + this.string + "|");
	}
	
	public void rawClose() {
		this.printLine();
	}
	
	public void printLine() {
		System.out.println("+");
		for (int i = 0; i < this.width; i++) {
			System.out.print("-");
		}
		System.out.println("+");
	}
}
