package decorator;
/**
 * Borderの具象クラスの一種です
 * 文字列の左右に決まった文字で飾りをつけます
 * @author TakayukiOchiai
 *
 */
public class SideBorder extends Border {
	/** 飾りとなる文字*/
	private char borderChar;
	
	public SideBorder(Display display, char ch) {
		super(display);
		this.borderChar = ch;
	}
	
	/**
	 * 中身の両側に飾り文字の文字数分を加えた結果を返します
	 * @return　一行の文字数に飾り文字の文字数（２文字）を加えたもの
	 */
	@Override
	public  int getColumns() {
		return display.getColumns() + 2;
	}
	
	/**
	 * 縦の行数を取得します
	 * @return 縦の行数
	 */
	@Override
	public int getRows() {
		return display.getRows();
	}
	
	/**
	 * 文字列の両端に指定した文字による飾りがついたものを返します
	 */
	@Override
	public String getRowText(int row) {
		return borderChar + display.getRowText(row) + borderChar;
	}
}
