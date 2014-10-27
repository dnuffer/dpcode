import static org.mockito.Mockito.*;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import java.util.*;

public class scratch {

	public static SinglyLinkedList partition(SinglyLinkedList sll, int x) {
	}

	public static class Node {
		int data;
		Node nextNode;
		public Node(int data) {
			this.data = data;
		}
		public Node(int data, Node nextNode) {
			this.data = data;
			this.nextNode = nextNode;
		}
	}

	public static class SinglyLinkedList {
		Node head, tail;
		public SinglyLinkedList() {
		}

		public SinglyLinkedList(int data) {
			head = new Node(data);
			tail = head;
		}

		public SinglyLinkedList(int data1, int data2, int data3) {
			tail = new Node(data3);
			head = new Node(data1, new Node(data2, tail));
		}

		public void appendNode(Node node) {
			if (head == null) {
				head = node;
				tail = node;
				return;
			}

			tail.nextNode = node;
			while (tail.nextNode != null) {
				tail = tail.nextNode;
			}
		}

		@Override
		public boolean equals(Object obj) {
			SinglyLinkedList that = (SinglyLinkedList)obj;
			Node thisNode = this.head;
			Node thatNode = that.head;
			while (thisNode != null && thatNode != null) {
				if (thisNode.data != thatNode.data) {
					return false;
				}
				thisNode = thisNode.nextNode;
				thatNode = thatNode.nextNode;
			}
			return thisNode == null && thatNode == null;
		}
	}

	public static class UnitTest {
		@Test
		public void test() {
			assertThat(partition(new SinglyLinkedList(1), 0), equalTo(new SinglyLinkedList(1)));
			assertThat(partition(new SinglyLinkedList(1), 1), equalTo(new SinglyLinkedList(1)));
			assertThat(partition(new SinglyLinkedList(1), 2), equalTo(new SinglyLinkedList(1)));
			assertThat(partition(new SinglyLinkedList(3, 2, 1), 0), equalTo(new SinglyLinkedList(3, 2, 1)));
			assertThat(partition(new SinglyLinkedList(3, 2, 1), 1), equalTo(new SinglyLinkedList(3, 2, 1)));
			assertThat(partition(new SinglyLinkedList(3, 2, 1), 2), equalTo(new SinglyLinkedList(1, 3, 2)));
			assertThat(partition(new SinglyLinkedList(3, 2, 1), 3), equalTo(new SinglyLinkedList(2, 1, 3)));
			assertThat(partition(new SinglyLinkedList(3, 2, 1), 4), equalTo(new SinglyLinkedList(3, 2, 1)));
		}
	}
}

