import static java.lang.Math.*;
import static org.mockito.Mockito.*;
import org.junit.Test;
import static org.junit.Assert.*;

public class scratch {

	public static class UnitTest {
		@Test
		public void test() {
			assertEquals(maximumWeightedSubset(new int[]{}, 9), 0);
			assertEquals(maximumWeightedSubset(new int[]{1, 3, 6}, 9), 9);
			assertEquals(maximumWeightedSubset(new int[]{1, 3, 6}, 8), 7);
			assertEquals(maximumWeightedSubset(new int[]{1, 2, 3}, 7), 6);
			assertEquals(maximumWeightedSubset(new int[]{1, 2, 3}, 6), 6);
			assertEquals(maximumWeightedSubset(new int[]{1, 2, 3}, 5), 5);
			assertEquals(maximumWeightedSubset(new int[]{1, 2, 3}, 4), 4);
			assertEquals(maximumWeightedSubset(new int[]{1, 2, 3}, 3), 3);
			assertEquals(maximumWeightedSubset(new int[]{1, 2, 3}, 2), 2);
			assertEquals(maximumWeightedSubset(new int[]{1, 2, 3}, 1), 1);
			assertEquals(maximumWeightedSubset(new int[]{4, 2, 1}, 7), 7);
			assertEquals(maximumWeightedSubset(new int[]{4, 2, 1}, 6), 6);
			assertEquals(maximumWeightedSubset(new int[]{4, 2, 1}, 5), 5);
			assertEquals(maximumWeightedSubset(new int[]{4, 2, 1}, 4), 4);
			assertEquals(maximumWeightedSubset(new int[]{4, 2, 1}, 3), 3);
			assertEquals(maximumWeightedSubset(new int[]{4, 2, 1}, 2), 2);
			assertEquals(maximumWeightedSubset(new int[]{4, 2, 1}, 1), 1);
			assertEquals(maximumWeightedSubset(new int[]{3, 5, 7}, 6), 5);
		}
	}

}
