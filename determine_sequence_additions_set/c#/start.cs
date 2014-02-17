using System;
using System.Collections.Generic;
using NUnit.Framework;

public class Scratch
{
}

[TestFixture]
public class TestSequenceAdditions : AssertionHelper {
	[Test]
	public void TestIt() {
		var result = Scratch.findAdditions(new List<int>{1}, new List<int>{1, 2, 3});
		Expect(result.Count, Is.EqualTo(2));
		Expect(result.Contains(2), Is.True);
	}
}
