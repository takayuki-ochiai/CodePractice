class Person{
    //直接フィールドにアクセスできなくするためにはprivateをつける
    private String name;
    private int age;
    private String address;

    Person(String _name, int _age, String _address){
          name = _name;
          age = _age;
          address = _address;
    }

    //セッタを定義
    public void setName(String _name){
        name = _name;
    }

    public void setAge(int _age){
        age = _age;
    }

    public void setAddress(String _address){
        address = _address;
    }

    public String getName(){
        return name;
    }

    public int getAge(){
        return age;
    }

    public String getAddress(){
        return address;
    }
}

class PersonCoupselTest {
    public static void main (String[] args){
        Person[] people = new Person[3]; //配列のサイズ指定？
        people[0] = new Person("太郎", 21, "東京都港区");
        people[1] = new Person("花子", 18, "北海道札幌市");
        people[2] = new Person("タカユキ", 24, "神奈川県横浜市");

        people[0].setName("次郎");
        people[0].setAge(15);
        people[0].setAddress("福岡県福岡市");
        for(int i = 0; i  <  people.length;  i++){
            System.out.println("名前は" + people[i].getName() + "  年齢は" + people[i].getAge() + "  住所は" + people[i].getAddress()
);
        }

    }
}