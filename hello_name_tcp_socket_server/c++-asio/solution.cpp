#include <cstdlib>
#include <iostream>
#include <utility>
#include <boost/asio.hpp>

using namespace std;
using boost::asio::ip::tcp;

const int max_length = 1024;

void session(tcp::socket sock)
{
	string hello = "Hello, ";
	boost::asio::write(sock, boost::asio::buffer(hello.c_str(), hello.size()));
	for (;;)
	{
		char data[max_length];

		boost::system::error_code error;
		size_t length = sock.read_some(boost::asio::buffer(data), error);
		if (error == boost::asio::error::eof)
			break; // Connection closed cleanly by peer.
		else if (error)
			throw boost::system::system_error(error); // Some other error.

		boost::asio::write(sock, boost::asio::buffer(data, length));
	}
}

void server(boost::asio::io_service& io_service, unsigned short port)
{
	tcp::acceptor a(io_service, tcp::endpoint(tcp::v4(), port));
	cout << "Ready" << endl;
	tcp::socket sock(io_service);
	a.accept(sock);
	session(move(sock));
}

int main(int argc, char* argv[])
{
	boost::asio::io_service io_service;

	server(io_service, 9999);

	return 0;
}
