import java.io.*;

class NumberGame {
    public static void main(String[] args) {
        try {
            int a = 7, b = 7;
            BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("数字を入力してください");
            String c = in.readLine();
            a = Integer.parseInt(c);
            while(a != b) {
                System.out.println("違います");
                c = in.readLine();
                a = Integer.parseInt(c);
            }
        } catch(Exception ie) {
            System.out.println("エラーです");
        }
    }
}