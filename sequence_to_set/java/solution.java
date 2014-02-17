import static org.mockito.Mockito.*;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.*;

public class solution {

	public static HashSet<Integer> makeSet(Iterable<Integer> seq) {
		HashSet<Integer> result = new HashSet<Integer>();
		for (Integer x : seq) {
			result.add(x);
		}
		return result;
	}

	public static class UnitTest {
		@Test
		public void test() {
			HashSet<Integer> s = makeSet(new ArrayList<Integer>(Arrays.asList(new Integer[]{1,2,3})));
			assertEquals(s.size(), 3);
			assert(s.contains(1));
		}
	}
}
