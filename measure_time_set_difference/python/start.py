import timeit
import itertools
import re

def print_table(table):
  print format_table(table)

def format_table(table):
  rows = len(table)
  if rows == 0:
    return 

  cols = len(table[0])
  col_widths = [max([len(table[row][col]) for row in xrange(rows)]) for col in xrange(cols)]
  return "\n".join(["".join(["%-*s" % (col_widths[col], table[row][col]) for col in xrange(cols)]) for row in xrange(rows)])

def set_difference_create_two_sets_and_return_a_new_set(first, second):
  return set(second) - set(first)

def set_difference_create_one_set_and_return_a_new_set(first, second):
  return set(second).difference(first)

def set_difference_one_set_and_return_a_list_comprehension(first, second):
  first_set = set(first)
  return [x for x in second if x not in first_set]

def set_difference_one_set_and_return_a_generator(first, second):
  first_set = set(first)
  for x in second:
    if x not in first_set:
      yield x

def set_difference_one_set_using_itertools_return_a_generator(first, second):
  first_set = set(first)
  return itertools.ifilter(lambda x: x not in first_set, second)

def calculate_set_difference(f, first, second):
  for x in f(first, second):
    pass

def time_set_difference_implementations():
  range1 = [x for x in xrange(0, 100)]
  range2 = [x for x in xrange(50, 550, 5)]
  repeat = 10000
  table = []
  ns_per_sec = 1e9

  # TODO: write time() which times a function and puts the result into table

  time("Creating two sets and return a new set: ", set_difference_create_two_sets_and_return_a_new_set)
  time("Creating one set and return a new set: ", set_difference_create_one_set_and_return_a_new_set)
  time("Creating one set and returning a list comprehension: ", set_difference_one_set_and_return_a_list_comprehension)
  time("Creating one set and returning a generator: ", set_difference_one_set_and_return_a_generator)
  time("Creating one set and using itertools to return a generator: ", set_difference_one_set_using_itertools_return_a_generator)
  return format_table(table)


if __name__ == '__main__':
  result = time_set_difference_implementations()
  pattern = 'Creating two sets and return a new set:[ ]*[0-9.]+ns[ ]*\n' \
            'Creating one set and return a new set:[ ]*[0-9.]+ns[ ]*\n' \
            'Creating one set and returning a list comprehension:[ ]*[0-9.]+ns[ ]*\n' \
            'Creating one set and returning a generator:[ ]*[0-9.]+ns[ ]*\n' \
            'Creating one set and using itertools to return a generator:[ ]*[0-9.]+ns[ ]*'
  if not re.match(pattern, result, re.MULTILINE):
    print "Failed:"
    print result
    import sys
    sys.exit(1)
  else:
    print "Success:"
    print result
