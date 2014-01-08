import java.io.*;
import java.net.*;


class solution {
	public static void main(String args[]) throws Exception {
		ServerSocket ss = new ServerSocket(9999);

		System.out.println("Ready");

		Socket conn = ss.accept();
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		String name = reader.readLine();
		writer.write("Hello, " + name + "\n");
		writer.flush();
	}
}
