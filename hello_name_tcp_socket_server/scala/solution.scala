// Simple server
import java.net._
import java.io._
import scala.io._

object scratch extends App {
  val server = new ServerSocket(9999)
  System.out.println("Ready")
  val s = server.accept()
  val out = new PrintStream(s.getOutputStream())
  for (line <- new BufferedSource(s.getInputStream()).getLines()) {
    out.println("Hello, " + line)
    out.flush()
  }

  s.close()
}
