package decorator;
/**
 * 一行の文字列を表示するクラスです
 * @author TakayukiOchiai
 *
 */
public class StringDisplay extends Display {
	/** 表示する文字列 */
	private String string;
	
	/**
	 * SingleDisplayのコンストラクタ
	 * @param string 表示する文字列
	 */
	public StringDisplay(String string) {
		this.string = string;
	}
	
	/**
	 * 横の文字数を取得します
	 * @return　横の文字数
	 */
	@Override
	public int getColumns() {
		return string.getBytes().length;
	}
	
	/**
	 * 縦の行数を取得します
	 * @return 縦の行数
	 */
	@Override
	public int getRows() {
		return 1;
	}
	
	/**
	 * 指定した行の文字列を取得します
	 * @param row
	 * @return 指定した行の文字列
	 */
	public String getRowText(int row) {
		if (row == 0) {
			return string;
		} else {
			return null;
		}
	}
}
