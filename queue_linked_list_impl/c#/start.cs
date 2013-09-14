using System;
using NUnit.Framework;


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
