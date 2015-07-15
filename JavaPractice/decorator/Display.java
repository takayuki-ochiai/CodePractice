package decorator;
/**
 * ディスプレイの抽象クラスです
 * @author TakayukiOchiai
 *
 */
public abstract class Display {
	/**
	 * 横の文字数を取得します
	 * @return　横の文字数
	 */
	public abstract int getColumns();
	
	/**
	 * 縦の行数を取得します
	 * @return 縦の行数
	 */
	public abstract int getRows();
	
	/**
	 * 指定した行の文字列を取得します
	 * @param row
	 * @return 指定した行の文字列
	 */
	public abstract String getRowText(int row);
	
	/**
	 * 全て表示します
	 */
	public final void show() {
		for(int i = 0; i < getRows(); i++) {
			System.out.println(getRowText(i));
		}
	}
}
