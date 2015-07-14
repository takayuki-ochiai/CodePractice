package bridge;


/**
 * 指定回数だけ表示するという機能を追加したクラス
 * @author TakayukiOchiai
 *
 */
public class CountDisplay extends Display {
	private DisplayImpl impl;
	public CountDisplay(DisplayImpl impl) {
		super(impl);
	}
	
	public void multiDisplay(int times) {
		this.open();
		for(int i = 0; i < times; i++) {
			this.print();
		}
		this.close();
	}
}
