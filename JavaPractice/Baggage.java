
public class Baggage {
	private float size;
	private int regionGrade;
	
	public Baggage(float size, int regionGrade) {
		if(size > 170) {
			System.out.println("縦横高さの合計が170センチ以上の荷物は配送することができません");
			return;
		}
		this.size = size;
		this.regionGrade = regionGrade;
	}
	
	public int charge() {
		return BaggagePriceTable.fetchPrice(this.regionGrade, calculateSizeGrade());
	}
	
	private int calculateSizeGrade() {
		if(this.size <= 60)  return 0;
		if(this.size <= 80)  return 1;
		if(this.size <= 100) return 2;
		if(this.size <= 120) return 3;
		if(this.size <= 140) return 4;
		if(this.size <= 160) return 5;
		return 6;
	}
}
