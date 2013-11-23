import org.junit.Test;
import static org.junit.Assert.*;
import java.util.ArrayList;
import static java.util.Collections.*;

public class solution {

	public static class Queue<T> {
		private ArrayList<T> data = new ArrayList<T>();
		private int size = 0;
		private int begin = 0;

		public boolean empty() {
			return size == 0;
		}

		public void pushBack(T item) {
			if (size + 1 > data.size()) {
				if (begin == 0) {
					data.addAll(nCopies(2 * (data.size() + 1), (T)null));
				} else {
					ArrayList<T> newData = new ArrayList<T>(2 * (data.size() + 1));
					int p1begin = begin;
					int p1len = size - begin;
					int p2begin = 0;
					int p2len = p1begin;

					newData.addAll(data.subList(p1begin, p1begin + p1len));
					newData.addAll(data.subList(p2begin, p2begin + p2len));
					newData.addAll(nCopies(data.size() + 1, (T)null));
					data = newData;
				}
				begin = 0;
			}

			int index = (begin + size) % data.size();
			data.add(index, item);
			size++;
		}

		public T popFront() {
			T result = data.get(begin);
			begin = (begin + 1) % data.size();
			size--;
			return result;
		}
	}

	public static class UnitTest {
		@Test
		public void test() {
			Queue<Integer> q = new Queue<Integer>();
			assertEquals(q.empty(), true);
			q.pushBack(1);
			q.pushBack(2);
			q.pushBack(3);
			assertEquals(q.empty(), false);

			assertEquals((int)q.popFront(), 1);
			assertEquals((int)q.popFront(), 2);
			assertEquals((int)q.popFront(), 3);
			assertEquals(q.empty(), true);

			q.pushBack(4);
			assertEquals(q.empty(), false);
			assertEquals((int)q.popFront(), 4);
			assertEquals(q.empty(), true);

			int in = 0;
			int out = 0;
			for (int i = 1; i < 100; i++) {
				for (int j = 0; j < i; j++) {
					q.pushBack(in);
					in++;
				}

				int x = q.popFront();
				assertEquals(x, out);
				out++;
			}
			while (!q.empty()) {
				int x = q.popFront();
				assertEquals(x, out);
				out++;
			}
		}
	}
}
