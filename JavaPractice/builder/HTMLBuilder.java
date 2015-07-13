package builder;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class HTMLBuilder {
	private String filename;
	
	private PrintWriter writer;
	public void makeTitle(String title) {
		filename = title + ".html";
		try {
			writer = new PrintWriter(new FileWriter(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
		writer.println("<html><head><title>" + title + "</title></head><body>");
		
		writer.println("<h1>" + title +"</h1>");
	}
	
}
