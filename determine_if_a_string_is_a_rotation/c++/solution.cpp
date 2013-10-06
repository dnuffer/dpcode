#include <string>
#include <type_traits>
#include <iostream>
#include <cassert>

using namespace std;

template <typename T>
struct extract_char;

template <typename Char, typename Traits, typename Alloc>
struct extract_char<std::basic_string<Char, Traits, Alloc> >
{
	typedef Char type;
};

template <typename Char, int N>
struct extract_char<Char[N]>
{
	typedef typename std::remove_const<Char>::type type;
};

template <typename Char, int N>
struct extract_char<Char(&)[N]>
{
	typedef typename std::remove_const<Char>::type type;
};

template <typename Char>
struct extract_char<Char*>
{
	typedef typename std::remove_const<Char>::type type;
};

template <typename Str1T, typename Str2T>
bool is_rotation(const Str1T& arg1, const Str2T& arg2)
{
	typedef typename extract_char<Str1T>::type Char1T;
	typedef typename extract_char<Str2T>::type Char2T;
	basic_string<Char1T> s1(arg1);
	basic_string<Char2T> s2(arg2);
	if (s1.size() != s2.size())
		return false;

	return (s1 + s1).find(s2) != s1.npos;
}

int main(int argc, char** argv)
{
	assert(is_rotation("abc", "abc"));
	assert(is_rotation("abc", string("abc")));
	assert(!is_rotation(u8"aaa", u8"aa"));
	assert(is_rotation(u"abc", u"bca"));
	assert(is_rotation(L"abc", wstring(L"cab")));
	assert(is_rotation(U"waterbottle", U"erbottlewat"));
	assert(!is_rotation(R"(waterbottle)", R"(rbottlewat)"));
	assert(!is_rotation(uR"(waterbottle)", uR"(Erbottlewat)"));
	cout << "All tests passed!\n";
}
