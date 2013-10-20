from singly_linked_list import singly_linked_list, singly_linked_list_node

# TODO: write a function that returns None if the list is good (i.e. no loops)
# and that returns the node at the beginning of the loop if there is a loop

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
