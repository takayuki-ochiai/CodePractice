class Book {
    String title;
    String writer;

    Book(String titleStr, String writerStr) {
          title = titleStr;
          writer = writerStr;
    }

    Book(Book copy) {
          title = copy.title;
          writer = copy.writer;
    }

    void print() {
        System.out.println("タイトル" + title);
        System.out.println("著者" + writer);
    }
}

class Books {
    public static void main(String[] args) {
        Book book = new Book("hoge先生の冒険", "Takayuki Ochiai");
        Book copyBook = new Book(book);

        book.print();
        copyBook,print();
    }
}