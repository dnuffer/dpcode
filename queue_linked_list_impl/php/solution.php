<?php
require 'vendor/autoload.php';

class QueueNode
{
  function QueueNode($data)
  {
    $this->data = $data;
    $this->next_node = NULL;
  }
}

class Queue
{
  function Queue()
  {
    $this->front = NULL;
    $this->back = NULL;
  }

  function is_empty()
  {
    return $this->front == NULL;
  }

  function push_back($item)
  {
    if (!$this->front)
    {
      $this->back = new QueueNode($item);
      $this->front = $this->back;
    }
    else
    {
      $this->back->next_node = new QueueNode($item);
      $this->back = $this->back->next_node;
    }
  }

  function pop_front()
  {
    $result = $this->front->data;
    $this->front = $this->front->next_node;
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
$suite->addTestSuite('QueueTest');
PHPUnit_TextUI_TestRunner::run($suite);
?>

