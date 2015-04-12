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

class PersonFieldTest {
    public static void main (String[] args){
        Person[] people = new Person[3]; //配列のサイズ指定？
        people[0] = new Person("太郎", 21, "東京都港区");
        people[1] = new Person("花子", 18, "北海道札幌市");
        people[2] = new Person("タカユキ", 24, "神奈川県横浜市");

        people[0].name = "次郎";
        people[0].age = 15;
        people[0].address = "福岡県福岡市";
        for(int i = 0; i  <  people.length; i++){
            System.out.println(people[i].say());
        }
    }
}