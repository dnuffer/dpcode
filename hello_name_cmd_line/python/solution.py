import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--name', help="set name", nargs='?')
args = parser.parse_args()

if not args.name:
  sys.stderr.write("--name not specified\n")
  sys.exit(1)

print "Hello, %s" % args.name
