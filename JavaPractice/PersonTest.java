class Person{
    String name;
    int age;
    String address;

    Person(String _name, int _age, String _address){
          name = _name;
          age = _age;
          address = _address;
    }

    String say(){
        String str = "名前は" + name + "  年齢は" + age + "  住所は" + address ;
        return str;
    }
}

class PersonTest {
    public static void main (String[] args){
            Person taro = new Person("太郎", 21, "東京都港区");
            System.out.println(taro.say());

            Person hanako = new Person("花子", 18, "北海道札幌市");
            System.out.println(hanako.say());
    }
}