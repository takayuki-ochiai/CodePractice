package facade;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

/**
 * HTMLページを作るための一連の処理の窓口となるクラスです。
 * @author TakayukiOchiai
 *
 */
public class PageMaker {
	private PageMaker() {};
	
	public static void makeWelcomePage(String mailaddr, String filename) {
		try {
			Properties mailprop = Database.getProperties("maildata");
			String userName = mailprop.getProperty("maildata");
			HtmlWriter writer = new HtmlWriter(new FileWriter(filename));
			writer.title("Welcome to " + userName + "'s page!");
			writer.paragraph(userName);
			writer.paragraph(userName + "のページへようこそ");
			writer.paragraph("メール待ってます");
			writer.mailto(mailaddr, userName);
			writer.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
