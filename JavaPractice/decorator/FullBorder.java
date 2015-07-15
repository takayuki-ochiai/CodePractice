package decorator;

public class FullBorder extends Border {
	/**
	 * FullBorderのコンストラクタです
	 * @param display　中身のDisplay型のインスタンスです
	 */
	public FullBorder(Display display) {
		super(display);
	}
	
	/**
	 * 中身の両側に左右の飾り文字の文字数を加えたものを返します
	 */
	@Override
	public int getColumns() {
		return display.getColumns() + 2;
	}
	
	/**
	 * 中身の行数に上下の飾り文字数分を加えたものを返します
	 */
	@Override
	public int getRows() {
		return display.getRows() + 2;
	}
	
	/**
	 * 文字列の両端に指定した文字による飾りがつき、上下に枠がついたものを返します
	 */
	@Override
	public String getRowText(int row) {
		if (row == 0 || row == display.getRows() + 1) {
			return "+" + makeLine('-', display.getColumns()) + "+";
		} else {
			return "|" + display.getRowText(row - 1) + "|";
		}
	}
	/**
	 * 文字chをcountの個数分連続させた文字列を作成します
	 * @param ch
	 * @param count
	 * @return
	 */
	private String makeLine(char ch, int count) {
		StringBuffer buffer = new StringBuffer();
		for(int i =0; i < count; i++) {
			buffer.append(ch);
		}
		return buffer.toString();
	}
}
