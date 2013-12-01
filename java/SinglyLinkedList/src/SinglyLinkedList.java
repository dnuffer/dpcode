import java.util.Iterator;
import java.util.NoSuchElementException;

public class SinglyLinkedList<E> extends java.util.AbstractCollection<E> {

	public class SinglyLinkedListIterator implements Iterator<E> {
		Node<E> node = null;
		Node<E> prev = null;

		private Node<E> nextNode() {
			if (node == null) {
				return head;
			}
			return node.next;
		}

		@Override
		public boolean hasNext() {
			return nextNode() != null;
		}

		@Override
		public E next() {
			if (nextNode() == null)
				throw new NoSuchElementException();

			prev = node;
			node = nextNode();
			return node.data;
		}

		@Override
		public void remove() {
			if (node == null) {
				throw new IllegalStateException();
			}
			
			if (prev == null) {
				if (head == tail) {
					head = tail = null;
				} else {
					head = head.next;
				}
			} else {
				if (tail == node) {
					tail = prev;
				}
				prev.next = node.next;
			}
			node = prev;
		}

	}

	static class Node<E> {
		E data;
		Node<E> next;

		Node(E element) {
			this.data = element;
		}

		Node(E element, Node<E> next) {
			this.data = element;
			this.next = next;
		}
	}

	Node<E> head;
	Node<E> tail;

	public SinglyLinkedList() {
	}

	public SinglyLinkedList(E[] items) {
		if (items != null) {
			for (E item : items) {
				addLast(item);
			}
		}
	}
	
	public SinglyLinkedList(Iterable<? extends E> items) {
		for (E item : items) {
			addLast(item);
		}
	}

	public boolean isEmpty() {
		return head == null;
	}

	public void addLast(E item) {
		addNodeLast(new Node<E>(item));
	}

	public void addNodeLast(Node<E> n) {
		if (head == null) {
			head = tail = n;
		} else {
			tail.next = n;
		}

		while (tail.next != null) {
			tail = tail.next;
		}
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer("[");
		Node<E> node = head;
		if (node != null) {
			sb.append(node.data.toString());
			node = node.next;
		}
		while (node != null) {
			sb.append(" -> ");
			sb.append(node.data.toString());
			node = node.next;
		}
		sb.append("]");
		return sb.toString();
	}

	public SinglyLinkedList<E> add(int index, E element) {
		if (index == 0 && head == null) {
			addLast(element);
		} else {
			Node<E> node = head;
			Node<E> prev = null;
			while (node != null && index > 0) {
				prev = node;
				node = node.next;
				index--;
			}
			if (prev != null) {
				prev.next = new Node<E>(element);
				prev.next.next = node;
				if (prev == tail) {
					tail = prev.next;
				}
			} else {
				Node<E> oldHead = head;
				head = new Node<E>(element);
				head.next = oldHead;
			}
		}
		return this;
	}

	@Override
	public Iterator<E> iterator() {
		return new SinglyLinkedListIterator();
	}

	@Override
	public int size() {
		int result = 0;
		Node<E> node = head;
		while (node != null) {
			result++;
			node = node.next;
		}
		return result;
	}
}
