import static org.mockito.Mockito.*;
import org.junit.Test;
import static org.junit.Assert.*;

public class solution {
	static int[][] rotateMatrix(int[][] m) {
		if (m.length == 0)
			return new int[][] {};

		int[][] result = new int[m[0].length][m.length];
		for (int x = 0; x < m[0].length; x++) {
			for (int y = 0; y < m.length; y++) {
				result[x][y] = m[m.length - y - 1][x];
			}
		}
		return result;
	}

	public static class UnitTest {
		@Test
		public void test() {
			assertEquals(rotateMatrix(new int[][]{}), new int[][]{});
			assertEquals(rotateMatrix(new int[][]{{1}}), new int[][]{{1}});
			assertEquals(rotateMatrix(new int[][]{{1, 2}, {3, 4}}), new int[][]{{3, 1}, {4, 2}});
			assertEquals(rotateMatrix(new int[][]{{1, 2}}), new int[][]{{1}, {2}});
			assertEquals(rotateMatrix(new int[][]{{1, 2}, {3, 4}, {5, 6}}), new int[][]{{5, 3, 1}, {6, 4, 2}});

		}
	}
}

