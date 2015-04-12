class Truth{
    public static void main(String[] args) {
          String right = "正解", wront = "不正解";
          boolean value = true;

          String answer = value ? right : wrong;
          System.out.println(answer);

          value = false;
          String secondAnswer = value ? right : wrong;
          System.out.println(secondAnswer);
    }
}