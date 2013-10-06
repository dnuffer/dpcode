
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
