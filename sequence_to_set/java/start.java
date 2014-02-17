import static org.mockito.Mockito.*;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.*;

public class scratch {


	public static class UnitTest {
		@Test
		public void test() {
			HashSet<Integer> s = makeSet(new ArrayList<Integer>(Arrays.asList(new Integer[]{1,2,3})));
			assertEquals(s.size(), 3);
			assert(s.contains(1));
		}
	}
}
