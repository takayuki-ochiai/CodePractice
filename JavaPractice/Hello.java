class Hello {
  public static void main(String[] args) {
    System.out.println("こんにちは");
  }
}


// 【main メソッドについて】
// 簡単に言えば main メソッドは以下の通りそのまま書けばいいだけです。

// public static void main(String[] args) {
// }

// もちろんそれぞれに意味はありますので、簡単に説明します。

// (1)main メソッドは public キーワードをつけて宣言します。public は他の全てのクラスから呼び出せるということです。

// (2)main メソッドは static キーワードをつけます。static を付けるとクラスをインスタンス化しなくてもこのメソッドが使えます。

// (3)main メソッドは、戻り値に void キーワードを使います。void はそのメソッドが何も値を返さないことを意味します。

// (4)main メソッドは、引数としてString型の配列を受け取れるようにします。 args は配列の名前です。