import java.io.*;
import java.net.*;

public class solution {
	public static void main(String[] args) throws Exception {
		DatagramSocket sock = new DatagramSocket();
		InetAddress addr = InetAddress.getByName("localhost");
		byte[] sendData = ("Hello, " + args[0]).getBytes("UTF-8");
		sock.send(new DatagramPacket(sendData, sendData.length, addr, 9999));
	}
}
