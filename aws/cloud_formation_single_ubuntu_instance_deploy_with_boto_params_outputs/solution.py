"""
>>> from mock import patch, Mock
>>> with patch('boto.cloudformation.connect_to_region') as mock:
...     with patch('time.sleep') as sleep_mock:
...         instance = mock.return_value
...         instance.create_stack.return_value = 'the result'
...         mock_event = Mock(boto.cloudformation.stack.StackEvent)
...         mock_event.resource_type = 'AWS::CloudFormation::Stack'
...         mock_event.resource_status = 'CREATE_COMPLETE'
...         instance.describe_stack_events.return_value = [mock_event]
...         mock_stack = Mock(boto.cloudformation.stack.Stack)
...         mock_stack.outputs = [('output', 'output')]
...         instance.describe_stacks.return_value = [mock_stack]
...         result = deploy()
...         mock.assert_called_with('us-west-2')
...         instance.create_stack.assert_called_once_with('dpcode-boto', template_body=open('ubuntu.template', 'r').read(), parameters=[('HostedZone', 'dan.test')])
...         assert(result == [('output', 'output')])
Stack deployed. Waiting
"""

import boto.cloudformation
import time
import sys
import pprint

class DeployException(Exception):
  pass

def deploy():
  conn = boto.cloudformation.connect_to_region('us-west-2')
  stack_id = conn.create_stack('dpcode-boto', template_body=open('ubuntu.template', 'r').read(), 
                               parameters=[('HostedZone', 'dan.test')])

  print "Stack deployed. Waiting"
  # wait until we get a CREATE_FAILED, ROLLBACK_COMPLETE, or CREATE_COMPLETE on the stack
  stack_is_deploying = True
  while stack_is_deploying:
    events = conn.describe_stack_events(stack_id)
    if any((e.resource_type == 'AWS::CloudFormation::Stack' and (e.resource_status == 'CREATE_FAILED' or e.resource_status == 'ROLLBACK_COMPLETE') for e in events)):
      raise DeployException()

    if any((e.resource_type == 'AWS::CloudFormation::Stack' and e.resource_status == 'CREATE_COMPLETE' for e in events)):
      stack_is_deploying = False

    time.sleep(3)
  
  return conn.describe_stacks(stack_id)[0].outputs


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
