import java.util.List;


public class BookShelf implements Aggregate {
	private Object[] books;
	private int last = 0;
	
	public BookShelf(int maxsize) {
		this.books = new Object[maxsize];
	}
	
	public Object getBookAt(int index) {
		return this.books[index];
	}
	
	public void appendBook(Object book) {
		this.books[last] = book;
		last++;
	}
	
	public int getLength() {
		return this.last;
	}
	
	public Iterator iterator() {
		return new BookShelfIterator(this);
	}
}
