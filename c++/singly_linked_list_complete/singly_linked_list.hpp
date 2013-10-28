#pragma once

#include <forward_list>
#include <string>
#include <sstream>

template <typename T>
class singly_linked_list : public std::forward_list<T>
{
	public:
		singly_linked_list() = default;

		singly_linked_list(std::initializer_list<T> l)
		{
			auto it = this->before_begin();
			for (auto item: l)
			{
				it = this->insert_after(it, item);
			}
		}

		template <typename CharT>
		std::basic_string<CharT> to_basic_string() const
		{
			std::basic_ostringstream<CharT> result;
			result << CharT('[');
			auto it = this->cbegin();
			if (it != this->cend())
			{
				result << *it;
				++it;
				while (it != this->cend())
				{
					result << CharT(' ');
					result << CharT('-');
					result << CharT('>');
					result << CharT(' ');
					result << *it;
					++it;
				}
			}
			result << CharT(']');
			return result.str();
		}

		std::string to_string() const
		{
			return to_basic_string<std::string::value_type>();
		}
		std::wstring to_wstring() const
		{
			return to_basic_string<std::wstring::value_type>();
		}
		std::u16string to_u16string() const
		{
			return to_basic_string<std::u16string::value_type>();
		}
};

