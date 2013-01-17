"""
>>> from mock import patch
>>> with patch('boto.cloudformation.connect_to_region') as mock:
...     instance = mock.return_value
...     instance.create_stack.return_value = 'the result'
...     result = deploy()
...     mock.assert_called_with('us-west-2')
...     instance.create_stack.assert_called_once_with('dpcode_boto', template_body=open('ubuntu.template', 'r').read())
...     print result
the result
"""

def deploy():
  import boto.cloudformation
  conn = boto.cloudformation.connect_to_region('us-west-2')
  stack_id = conn.create_stack('dpcode_boto', template_body=open('ubuntu.template', 'r').read())
  return stack_id


if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
