using System;
using NUnit.Framework;

public class QueueNode<T> {
	public QueueNode<T> nextNode { get; set; }
	public T data { get; set; }
}

public class Queue<T> {
	public QueueNode<T> front, back;
	public bool empty() {
		return front == null;
	}

	public void pushBack(T item) {
		if (front == null) {
			front = back = new QueueNode<T> { nextNode = null, data = item };
		} else {
			back.nextNode = new QueueNode<T> { nextNode = null, data = item };
			back = back.nextNode;
		}
	}

	public T popFront() {
		var result = front.data;
		front = front.nextNode;
		return result;
	}
}

[TestFixture]
public class TestQueue : AssertionHelper {
	[Test]
	public void TestIt() {
		var queue = new Queue<int>();
		Expect(queue.empty(), Is.True);
		queue.pushBack(1);
		queue.pushBack(2);
		queue.pushBack(3);
		Expect(queue.empty(), Is.False);
		Expect(queue.popFront(), Is.EqualTo(1));
		Expect(queue.popFront(), Is.EqualTo(2));
		Expect(queue.popFront(), Is.EqualTo(3));
		Expect(queue.empty(), Is.True);
		queue.pushBack(4);
		Expect(queue.empty(), Is.False);
		Expect(queue.popFront(), Is.EqualTo(4));
		Expect(queue.empty(), Is.True);
	}
}
