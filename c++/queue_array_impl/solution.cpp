#include <vector>
#include <cstdlib>
#include <iostream>

// TODO: implement a queue with a dynamicly sized ring-buffer storage.
template <typename T>
class Queue
{
	private:
		typedef typename std::vector<T>::size_type size_type;

	public:
		Queue()
			: m_buffer()
			, m_begin(0)
			, m_length(0)
		{
			m_buffer.resize(1);
		}

		void push_back(const T& data)
		{
			ensure_available(1);
			size_type pos = m_begin + m_length;
			if (pos >= m_buffer.size())
			{
				pos -= m_buffer.size();
			}
			m_buffer[pos] = data;
			++m_length;
		}

		T& front()
		{
			return m_buffer[m_begin];
		}

		void pop()
		{
			--m_length;
			++m_begin;
			if (m_begin >= m_buffer.size())
			{
				m_begin = 0;
			}
		}

		bool empty() const
		{
			return size() == 0;
		}

		size_type size() const
		{
			return m_length;
		}

		friend std::ostream& operator<<(std::ostream& ostr, const Queue<T>& queue)
		{
			ostr << "{m_buffer: ";
			for (size_type i = 0; i < queue.m_buffer.size(); ++i)
			{
				if (i != 0)
					ostr << ' ';

				ostr << queue.m_buffer[i];
			}

			ostr << ", m_begin: " << queue.m_begin;
			ostr << ", m_length: " << queue.m_length;
			ostr << "}";
			return ostr;
		}

	private:
		void ensure_available(size_type available)
		{
			if (m_buffer.size() < m_length + available)
			{
				std::vector<T> new_buffer((m_length + available) * 3 / 2);
				if (m_begin + m_length < m_buffer.size())
				{
					std::copy(m_buffer.begin() + m_begin, m_buffer.begin() + m_begin + m_length, new_buffer.begin());
				}
				else
				{
					// 2 parts, wrapped
					size_type p1begin = m_begin;
					size_type p1len = m_buffer.size() - p1begin;
					size_type p2begin = 0;
					size_type p2len = m_buffer.size() - p1len;
					// copy p1 to the start of new_buffer
					std::copy(m_buffer.begin() + p1begin, m_buffer.begin() + p1begin + p1len, new_buffer.begin());
					// append p2 to new_buffer
					std::copy(m_buffer.begin() + p2begin, m_buffer.begin() + p2begin + p2len, new_buffer.begin() + p1len);
				}
				swap(m_buffer, new_buffer);
				m_begin = 0;
			}
		}

	private:
		std::vector<T> m_buffer;
		size_type m_begin, m_length;
};


void panic(const char* s)
{
	std::cout << s << std::endl;
	std::abort();
}

int main() 
{
	Queue<int> queue;
	if (!queue.empty())
	{
		panic("!queue.empty()");
	}
	queue.push_back(1);
	queue.push_back(2);
	queue.push_back(3);
	if (queue.empty())
  	{
		panic("queue.empty()");
	}

	if (queue.front() != 1)
  	{
		panic("queue.PopFront() != 1");
	}
	queue.pop();
	if (queue.front() != 2)
  	{
		panic("queue.PopFront() != 2");
	}
	queue.pop();
	if (queue.front() != 3)
  	{
		panic("queue.PopFront() != 3");
	}
	//std::cout << queue << std::endl;
	queue.pop();
	if (!queue.empty())
  	{
		panic("!queue.empty()");
	}
	//std::cout << queue << std::endl;
	queue.push_back(4);
	if (queue.empty())
  	{
		panic("queue.empty()");
	}
	//std::cout << queue << std::endl;
	if (queue.front() != 4)
  	{
		panic("queue.PopFront() != 4");
	}
	queue.pop();

	int in = 0;
	int out = 0;
	for (int i = 1; i < 100; i++)
  	{
		for (int j = 0; j < i; j++)
	  	{
			queue.push_back(in);
			in++;
		}
		int x = queue.front();
		queue.pop();
		if (x != out)
	  	{
			//panic(fmt.Sprintf("queue.PopFront() != %d, got %d", out, x));
			panic("queue.PopFront() != %d, got %d");
		}
		out++;
	}
	while (!queue.empty())
  	{
		int x = queue.front();
		queue.pop();
		if (x != out)
	  	{
			panic("queue.PopFront() != %d, got %d");
		}
		out++;
	}
}

