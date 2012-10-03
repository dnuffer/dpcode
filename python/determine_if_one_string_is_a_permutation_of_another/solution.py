"""
>>> are_permutations("abc", "cab")
True
>>> are_permutations("abc", "aab")
False
>>> are_permutations("abcd", "abc")
False
>>> are_permutations("", "")
True
>>> are_permutations("a", "a")
True
>>> are_permutations("aaa", "aaa")
True
"""

def are_permutations(s1, s2):
    return set(s1) == set(s2)

if __name__ == '__main__':
    import doctest
    doctest.testmod()
