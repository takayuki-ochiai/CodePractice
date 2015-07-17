package facade;

import java.io.IOException;
import java.io.Writer;

/**
 * Webページを作成するためのクラスです
 * @author TakayukiOchiai
 *
 */
public class HtmlWriter {
	private Writer writer;
	public HtmlWriter(Writer writer) {
		this.writer = writer;
	}
	
	/**
	 * タイトルを出力します
	 * @param title　出力したいタイトルの文字列
	 * @throws IOException 出力エラー
	 */
	public void title(String title) throws IOException {
		writer.write("<html>");
		writer.write("<head>");
		writer.write("<title>" + title + "</title>");
		writer.write("</head>");
		writer.write("<body>¥n");
		writer.write("<h1>" + title + "</h1>");
	}
	/**
	 * 段落を出力します
	 * @param msg 出力したい文字列
	 * @throws IOException
	 */
	public void paragraph(String msg) throws IOException {
		writer.write("<p>" + msg + "</p>¥n");
	}
	
	/**
	 * リンクを出力します
	 * @param href リンク先に設定したいアドレス
	 * @param caption リンク名に使用したい文字列
	 * @throws IOException 出力エラー時
	 */
	public void link(String href, String caption) throws IOException {
		paragraph("<a href=" + href + ">"+ caption + "</a>");
	}
	
	public void mailto(String mailaddr, String username) throws IOException {
		link("mailto:" + mailaddr, username);
	}
	
	public void close() throws IOException {
		writer.write("</body>");
		writer.write("</html>¥n");
		writer.close();
	}
}
