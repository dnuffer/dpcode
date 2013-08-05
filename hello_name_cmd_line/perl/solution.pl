use Getopt::Long;

my $name;
my $show_help = 0;

GetOptions(
	"n|name=s" => \$name,
	"h|help" => \$show_help)
or die("scratch: Invalid command line arguments\nTry `scratch --help' for more information.");

if (!$show_help && $name eq "")
{
	print STDERR "scratch: missing name\n";
	print STDERR "Try `scratch --help' for more information.\n";
	exit 1;
}

if ($show_help) 
{
	print "Usage: scratch [options]\n";
	print "  -n, --name NAME          Use NAME to greet someone\n";
	print "  -h, --help               Print help message\n";
	exit 0;
}

print "Hello, $name\n";
