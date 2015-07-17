package facade;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * データベースを表現するクラスです
 * @author TakayukiOchiai
 *
 */
public class Database {
	/**
	 * このコンストラクタを外部から使用することは禁止しています
	 */
	private Database(){};
	
	/**
	 * データベース名からPropertiesを取得します
	 * @param dbname　データベース名
	 * @return Propertiesのオブジェクト
	 */
	public static Properties getProperties(String dbname) {
		String filename = dbname + ".txt";
		Properties properties = new Properties();
		try {
			properties.load(new FileInputStream(filename));
		} catch (IOException e) {
			System.err.println("Warning:" + filename + " is not found");
		}
		return properties;
	}
}
