package bridge;

/**
 * 機能のクラス改装で、表示を行うためのクラスです
 * 
 * @author TakayukiOchiai
 *
 */
public class Display {
	private DisplayImpl impl;
	public Display (DisplayImpl impl) {
		this.impl = impl;
	}
	
	//DisplayImplのインターフェースへ変換するためのラッパー
	public void open() {
		this.impl.rawOpen();
	}
	
	public void print() {
		this.impl.rawPrint();
	}
	
	public void close() {
		this.impl.rawClose();
	}
	
	public void display() {
		this.open();
		this.print();
		this.close();
	}
}
