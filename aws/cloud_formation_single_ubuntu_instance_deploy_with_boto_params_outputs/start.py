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




































# TODO: write deploy() that creates a stack in us-west-2 called dpcode-boto, 
# with template ubuntu.template, parameters: HostedZone: dan.test, and returns the outputs
import boto.cloudformation
import time
import sys
import pprint

class DeployException(Exception):
  pass


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
