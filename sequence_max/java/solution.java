import static org.mockito.Mockito.*;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.*;

public class solution {

	public static int max(Iterable<Integer> seq) {
		int max = Integer.MIN_VALUE;
		for (int i : seq) {
			if (i > max) {
				max = i;
			}
		}
		return max;
	}

	public static class UnitTest {
		@Test
		public void test() {
			assertEquals(max(new ArrayList<Integer>(Arrays.asList(new Integer[]{1,2,3}))), 3);
		}
	}
}
