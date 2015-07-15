package decorator;

/**
 * 飾り枠を表す抽象クラスです。
 * このクラスはDisplay(中身)を継承しています。
 * 飾り枠と中身を同一視することができます
 * @author TakayukiOchiai
 *
 */
public abstract class Border extends Display {
	/** 飾り枠が包む中身 */
	//StringDisplayだけじゃなくxxxxxBorderも入ってくる
	protected Display display;
	
	/**
	 * Borderオブジェクトのコンストラクタです
	 * @param display　中身となるディスプレイ型のオブジェクトです
	 */
	protected Border(Display display) {
		this.display = display;
	}
}
