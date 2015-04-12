import java.io.*;

class ReadText {
    public static void main(String[] args) {
        try{
            FileReader in = new FileReader(args[0]);
            int c;
            String s = new String();
            while((c = in.read() ) != -1)
                s = s + (char)c;
            System.out.println(s);
            in.close();
        } catch(IOException ie) {
            System.out.println("ファイルがありません");
        } catch(Exception e) {
            System.out.println("ファイル指定がありません");
        }
    }
}