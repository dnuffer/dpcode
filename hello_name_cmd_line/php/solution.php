<?php
$options = getopt("n:h", array("name:", "help"));
function usage($out)
{
	fprintf($out, "usage: solution\n");
	fprintf($out, " -h,--help         print help\n");
	fprintf($out, " -n,--name <arg>   set name\n");
}

if (!is_array($options))
{
  fprintf(STDERR, "failed to parse options\n");
  usage(STDERR);
  exit(1);
}

if (key_exists("help", $options))
{
  usage(STDOUT);
  exit(0);
}

if (!key_exists("name", $options) && !key_exists("n", $options))
{
  fprintf(STDERR, "--name was not specified\n");
  usage(STDERR);
  exit(1);
}

if (key_exists("name", $options))
{
  $name = $options["name"];
}

if (key_exists("n", $options))
{
  $name = $options["n"];
}

echo "Hello, $name\n";
?>
