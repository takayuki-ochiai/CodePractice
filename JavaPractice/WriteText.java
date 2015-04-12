import java.io.*;

class WriteText{
    public static void main(String[] args) {
        try{
            int a = 10, b = 5;
            FileWriter out = new FileWriter("math.txt");
            out.write("足すよ！");
            out.write(a + " + " + b + " = " + (a + b ) + "\n");
            out.write("引くよ！");
            out.write(a + " - " + b + " = " + (a - b ) + "\n");
            out.close();
        } catch(Exception e) {
            System.out.println(e);
        }
    }
}