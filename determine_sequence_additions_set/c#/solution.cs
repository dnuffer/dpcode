using System;
using System.Collections.Generic;
using NUnit.Framework;

public class Scratch
{
	public static HashSet<T> findAdditions<T>(IEnumerable<T> first, IEnumerable<T> second)
	{
		var result = new HashSet<T>();
		var firstSet = new HashSet<T>(first);
		foreach (var x in second)
		{
			if (!firstSet.Contains(x))
				result.Add(x);
		}
		return result;
	}
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
