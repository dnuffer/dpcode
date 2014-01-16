import static org.mockito.Mockito.*;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.*;

public class solution {

	public static int sum(Iterable<Integer> seq) {
		int total = 0;
		for (int i : seq) {
			total += i;
		}
		return total;
	}

	public static class UnitTest {
		@Test
		public void test() {
			assertEquals(sum(new ArrayList<Integer>(Arrays.asList(new Integer[]{1,2,3}))), 6);
		}
	}
}
