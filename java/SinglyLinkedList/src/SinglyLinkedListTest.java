import static org.junit.Assert.*;

import java.util.Iterator;
import java.util.NoSuchElementException;

import org.junit.Test;

public class SinglyLinkedListTest {

	@Test
	public void testCreate() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>();
		assertTrue(l.isEmpty());
	}

	@Test
	public void test_addLast() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>();
		l.addLast(1);
		assertEquals(new Integer(1), l.head.data);
		assertEquals(null, l.head.next);
		assertEquals(l.head, l.tail);
		assertEquals(l.toString(), "[1]");
		l.addLast(2);
		assertEquals(l.toString(), "[1 -> 2]");
		l.addLast(3);
		assertEquals(l.toString(), "[1 -> 2 -> 3]");
	}

	@Test
	public void test_toString() {
		assertEquals(
				new SinglyLinkedList<Integer>(new Integer[] {}).toString(),
				"[]");
		assertEquals(
				new SinglyLinkedList<Integer>(new Integer[] { 0 }).toString(),
				"[0]");
		assertEquals(
				new SinglyLinkedList<Integer>(new Integer[] { 0, 1 })
						.toString(),
				"[0 -> 1]");
		assertEquals(
				new SinglyLinkedList<Integer>(new Integer[] { 0, 1, 2 })
						.toString(),
				"[0 -> 1 -> 2]");
	}

	@Test
	public void test_constructor_takes_Array_parameter() {
		assertEquals(new SinglyLinkedList<String>(
				new String[] { "hi", "there" }).toString(), "[hi -> there]");
	}

	@Test
	public void test_addNodeLast() {
		SinglyLinkedList<Integer> l1 = new SinglyLinkedList<Integer>(
				new Integer[] { 1, 2 });
		SinglyLinkedList<Integer> l2 = new SinglyLinkedList<Integer>(
				new Integer[] { 3, 4 });
		l1.addNodeLast(l2.head);
		assertEquals("[1 -> 2 -> 3 -> 4]", l1.toString());
		l1.addLast(5);
		assertEquals("[1 -> 2 -> 3 -> 4 -> 5]", l1.toString());
	}

	@Test
	public void test_add_at_0_on_an_empty_list() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>();
		l.add(0, 1);
		assertEquals("[1]", l.toString());
	}

	@Test
	public void test_add_at_0_list_with_1_item() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1 });
		l.add(0, 2);
		assertEquals("[2 -> 1]", l.toString());
	}

	@Test
	public void test_add_at_0_list_with_2_items() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1, 2 });
		l.add(0, 0);
		assertEquals("[0 -> 1 -> 2]", l.toString());
	}

	@Test
	public void test_add_at_1_list_with_2_items() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1, 2 });
		l.add(1, 0);
		assertEquals("[1 -> 0 -> 2]", l.toString());
	}

	@Test
	public void test_add_at_2_list_with_2_items() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1, 2 });
		l.add(2, 0);
		assertEquals("[1 -> 2 -> 0]", l.toString());
	}

	@Test
	public void test_size() {
		assertEquals(0, new SinglyLinkedList<Integer>().size());
		assertEquals(1,
				new SinglyLinkedList<Integer>(new Integer[] { 1 }).size());
		assertEquals(2,
				new SinglyLinkedList<Integer>(new Integer[] { 1, 2 }).size());
	}

	@Test
	public void test_iterator_two() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1, 2 });
		Iterator<Integer> i = l.iterator();
		assertNotNull(i);
		assertTrue(i.hasNext());
		assertEquals(i.next(), new Integer(1));
		assertTrue(i.hasNext());
		assertEquals(i.next(), new Integer(2));
		assertFalse(i.hasNext());
		try {
			i.next();
			fail("expeted NoSuchElementException");
		} catch (NoSuchElementException e) {
		} // ok
	}

	@Test
	public void test_iterator_one() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1 });
		Iterator<Integer> i = l.iterator();
		assertNotNull(i);
		assertTrue(i.hasNext());
		assertEquals(i.next(), new Integer(1));
		assertFalse(i.hasNext());
		try {
			i.next();
			fail("expeted NoSuchElementException");
		} catch (NoSuchElementException e) {
		} // ok
	}

	@Test
	public void test_iterator_none() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>();
		Iterator<Integer> i = l.iterator();
		assertNotNull(i);
		assertFalse(i.hasNext());
		try {
			i.next();
			fail("expeted NoSuchElementException");
		} catch (NoSuchElementException e) {
		} // ok
	}

	@Test
	public void test_iterator_remove_from_two() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1, 2 });
		Iterator<Integer> i = l.iterator();
		i.next();
		i.remove();
		assertEquals("[2]", l.toString());
		assertEquals(l.head, l.tail);
		assertEquals(new Integer(2), i.next());
		i.remove();
		assertEquals("[]", l.toString());
		assertNull(l.head);
		assertNull(l.tail);
	}

	@Test
	public void test_iterator_remove_second_from_two() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1, 2 });
		Iterator<Integer> i = l.iterator();
		i.next();
		i.next();
		i.remove();
		assertEquals("[1]", l.toString());
		assertEquals(l.head, l.tail);
	}

	@Test
	public void test_iterator_remove_from_single() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(
				new Integer[] { 1 });
		Iterator<Integer> i = l.iterator();
		i.next();
		i.remove();
		assertEquals("[]", l.toString());
		assertNull(l.head);
		assertNull(l.tail);
	}

	@Test
	public void test_iterator_throws_IllegalStateException_if_next_hasnt_been_called() {
		for (int i = 0; i < 3; i++) {
			SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>();
			for (int j = 0; j < i; j++) {
				l.addLast(j);
			}
			Iterator<Integer> it = l.iterator();
			try {
				it.remove();
				fail("expected IllegalStateException");
			} catch (IllegalStateException ex) {
			} // ok
		}
	}

	@Test
	public void test_iterator_throws_IllegalStateException_if_called_twice() {
		for (int i = 0; i < 3; i++) {
			SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>();
			for (int j = 0; j < i; j++) {
				l.addLast(j);
			}
			Iterator<Integer> it = l.iterator();
			while (it.hasNext()) {
				it.next();
				it.remove();
			}
			try {
				it.remove();
				fail("expected IllegalStateException");
			} catch (IllegalStateException ex) {
			} // ok
		}
	}

	@Test
	public void test_remove_not_found() {
		for (int i = 0; i < 3; i++) {
			SinglyLinkedList<Integer> l1 = new SinglyLinkedList<Integer>();
			SinglyLinkedList<Integer> l2 = new SinglyLinkedList<Integer>();
			for (int j = 0; j < i; j++) {
				l1.addLast(j);
				l2.addLast(j);
			}
			assertFalse(l1.remove(999));
			assertEquals(l2.toString(), l1.toString());
		}
	}

	@Test
	public void test_copy_list() {
		SinglyLinkedList<Integer> l1 = new SinglyLinkedList<Integer>(new Integer[] { 1, 2, 3 });
		SinglyLinkedList<Integer> l2 = new SinglyLinkedList<Integer>(l1);
		assertNotEquals(l1, l2);
		assertNotEquals(l1.head, l2.head);
		assertEquals(l1.toString(), l2.toString());
	}
	
	@Test
	public void test_remove_one_item() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(new Integer[] {1});
		assertTrue(l.remove(1));
		assertEquals("[]", l.toString());
		assertNull(l.head);
		assertNull(l.tail);
	}
	
	@Test
	public void test_remove_two_items_first() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(new Integer[] {1, 2});
		assertTrue(l.remove(1));
		assertEquals("[2]", l.toString());
	}
	
	@Test
	public void test_remove_two_items_second() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(new Integer[] {1, 2});
		assertTrue(l.remove(2));
		assertEquals("[1]", l.toString());
	}
	
	@Test
	public void test_remove_two_items_both() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(new Integer[] {1, 2});
		assertTrue(l.remove(2));
		assertTrue(l.remove(1));
		assertEquals("[]", l.toString());
	}
	
	@Test
	public void test_remove_three_items_first() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(new Integer[] {1, 2, 3});
		assertTrue(l.remove(1));
		assertEquals("[2 -> 3]", l.toString());
		l.addLast(4);
		assertEquals("[2 -> 3 -> 4]", l.toString());
	}
	
	@Test
	public void test_remove_three_items_second() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(new Integer[] {1, 2, 3});
		assertTrue(l.remove(2));
		assertEquals("[1 -> 3]", l.toString());
		l.addLast(4);
		assertEquals("[1 -> 3 -> 4]", l.toString());
	}
	
	@Test
	public void test_remove_three_items_third() {
		SinglyLinkedList<Integer> l = new SinglyLinkedList<Integer>(new Integer[] {1, 2, 3});
		assertTrue(l.remove(3));
		assertEquals("[1 -> 2]", l.toString());
		l.addLast(4);
		assertEquals("[1 -> 2 -> 4]", l.toString());
	}
}
