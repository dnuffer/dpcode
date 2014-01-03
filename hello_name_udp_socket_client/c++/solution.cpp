// Take NAME as the first command line arg.
// Send "Hello, NAME" as a udp packet to localhost port 9999
#include <boost/asio.hpp>
using namespace boost::asio;
using boost::asio::ip::udp;

#include <string>
using namespace std;

int main(int argc, char** argv)
{
	io_service svc;

	udp::socket s(svc, udp::v4());
	udp::resolver resolver(svc);
	udp::resolver::query query("localhost", "9999");
	udp::endpoint ep = *resolver.resolve(query);
	string hello = string("Hello, ") + argv[1];
	s.send_to(buffer(hello.c_str(), hello.size()), ep);
}
