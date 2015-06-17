
public class BaggagePriceTable {
	private static final int[] ZEROTH_REGION_PRICES  = { 610,  810,  1030, 1230, 1440, 1650, 1750 };
	private static final int[] FIRST_REGION_PRICES   = { 710,  930,  1130, 1340, 1540, 1750, 1950 };
	private static final int[] SECOND_REGION_PRICES  = { 810,  1030, 1230, 1440, 1650, 1850, 2060 };
	private static final int[] THIRD_REGION_PRICES   = { 930,  1130, 1340, 1540, 1750, 1950, 2160 };
	private static final int[] FOURTH_REGION_PRICES  = { 1030, 1230, 1440, 1650, 1850, 2060, 2260 };
	private static final int[] FIFTH_REGION_PRICES   = { 1130, 1340, 1540, 1750, 1950, 2160, 2370 };
	private static final int[] SIXTH_REGION_PRICES   = { 1230, 1440, 1650, 1850, 2060, 2260, 2470 };
	private static final int[][] REGION_PRICE_TABLE = { ZEROTH_REGION_PRICES, FIRST_REGION_PRICES,
													    SECOND_REGION_PRICES, THIRD_REGION_PRICES,
													    FOURTH_REGION_PRICES, FIFTH_REGION_PRICES,
													    SIXTH_REGION_PRICES };
	
	public static int fetchPrice(int regionGrade, int sizeGrade) {
		return REGION_PRICE_TABLE[regionGrade][sizeGrade];
	}
}
