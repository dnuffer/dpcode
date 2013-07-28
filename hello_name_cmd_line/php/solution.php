<?php
$options = getopt("", array("name:"));
if (!is_array($options) || !key_exists("name", $options))
{
  fprintf(STDERR, "--name was not specified\n");
  exit(1);
}
$name = $options["name"];
echo "Hello, $name\n";
?>
