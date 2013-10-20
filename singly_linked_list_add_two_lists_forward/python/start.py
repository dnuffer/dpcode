from singly_linked_list import singly_linked_list, singly_linked_list_node

# TODO: You have two numbers represented by a linked list, where each node
# contains a single digit. The digits are stored in forward order, such that
# 1's digit is at the tail of the list. Write a function that adds the two
# numbers and returns the sum as a linked list in forward order

if __name__ == '__main__':
  import doctest
  result = doctest.testmod()
  if result.failed > 0:
    print "Failed:", result
    import sys
    sys.exit(1)
  else:
    print "Success:", result
