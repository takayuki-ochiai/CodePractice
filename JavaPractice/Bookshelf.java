class Book {
    String title;
    String genre;

    Book(String titleStr, String genreStr) {
        title = titleStr;
        genre = genreStr;
    }

    Book(Book copy) {
        title = copy.title;
        genre = copy.genre;
    }

    void printBook() {
        System.out.println("タイトル" + title);
        System.out.println("ジャンル" + genre);
    }
}

class Novel extends Book {
    String writer;

    Novel(String titleStr, String genreStr, String writerStr) {
        super(titleStr, genreStr);
        writer = writerStr;
    }

    void printNov() {
        printBook();
        System.out.println("著者" + writer);
    }
}

class Magazine extends Book{
    int day;

    Magazine(String titleStr, String genreStr, int writerInts) {
        super(titleStr, genreStr);
        day = dayInt;
    }

    void printMag() {
        printBook();
        System.out.println("発売日" + day + "日");
    }
}

class Bookshelf {
    public static void main(String[] args){
        Novel novel = new Novel("西の魔女が死んだ", "文学", "梨木香歩");
        novel.printNov();
        System.out.println();

        Magazine magazine = new Magazine("文藝春秋５月号", "雑誌", 10);
        magazine.printMag();
    }
}