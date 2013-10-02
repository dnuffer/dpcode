<?php
require 'vendor/autoload.php';


class Queue
{
  function Queue()
  {
    $this->buffer = array();
    $this->begin = 0;
    $this->length = 0;
  }

  function is_empty()
  {
    return $this->length == 0;
  }

  function push_back($item)
  {
    if (count($this->buffer) < $this->length + 1)
    {
      if ($this->begin == 0)
      {
        $new_buffer = array_merge($this->buffer, array_fill(0, (($this->length / 2) + 1), NULL));
      }
      else
      {
        $p1begin = $this->begin;
        $p1len = count($this->buffer) - $p1begin;
        $p2begin = 0;
        $p2len = $this->length - $p1len;
        $p1 = array_slice($this->buffer, $p1begin, $p1len);
        $p2 = array_slice($this->buffer, $p2begin, $p2len);
        $new_buffer = array_merge($p1, $p2, array_fill(0, (($this->length / 2) + 1), NULL));
        $this->begin = 0;
      }
      $this->buffer = $new_buffer;
    }

    $this->buffer[($this->begin + $this->length) % count($this->buffer)] = $item;
    $this->length++;
  }

  function pop_front()
  {
    $result = $this->buffer[$this->begin];
    $this->length--;
    $this->begin = ($this->begin + 1) % count($this->buffer);
    return $result;
  }
}

class QueueTest extends PHPUnit_Framework_TestCase
{
  public function testEverything()
  {
    $queue = new Queue();
    $this->assertTrue($queue->is_empty());
    $queue->push_back(1);
    $queue->push_back(2);
    $queue->push_back(3);
    $this->assertFalse($queue->is_empty());

    $this->assertEquals(1, $queue->pop_front());
    $this->assertEquals(2, $queue->pop_front());
    $this->assertEquals(3, $queue->pop_front());
    $this->assertTrue($queue->is_empty());

    $queue->push_back(4);
    $this->assertFalse($queue->is_empty());
    $this->assertEquals(4, $queue->pop_front());

    $in_cnt = 0;
    $out_cnt = 0;
    for ($i = 1; $i < 50; $i++)
    {
      for ($j = 0; $j < $i; $j++)
      {
        $queue->push_back($in_cnt);
        $in_cnt++;
      }
      $this->assertEquals($out_cnt, $queue->pop_front());
      $out_cnt++;
    }

    while (!$queue->is_empty())
    {
      $this->assertEquals($out_cnt, $queue->pop_front());
      $out_cnt++;
    }
  }
}

$suite  = new PHPUnit_Framework_TestSuite();
$suite->addTestSuite(QueueTest);
PHPUnit_TextUI_TestRunner::run($suite);
?>

