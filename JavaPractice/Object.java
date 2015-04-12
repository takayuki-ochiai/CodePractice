class Object{
    void outputNum(int num){
          System.out.println("数字は" + num);
    }

    void outputTen(){
          outputNum(10);
    }

}

class ObjectA{
    public static void main(String[] args){
        Object object = new Object();
        object.outputNum(1);
        object.outputTen();
    }
}
