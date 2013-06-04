#include <vector>
#include <cstdlib>
#include <iostream>

// TODO: implement a queue with a dynamicly sized ring-buffer storage.


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

