use strict;

# ============================== load table def
my $ddl_file_name = "TM_CARD_MEDIA_MAP.ddl";

open HANDLE, "<${ddl_file_name}" or die "open $ddl_file_name fail!";

my @col_array = ();
my %col_map = ();
my $index = 0;

while (<HANDLE>) {
	chomp; # chomp是啥意思?
	# File useless rows
	next if /^\s*$/;
        next if /^ /;
        next if /^-/;
        next if /^Column name/;

	my @row = split; # ?? split string, can we specify the separator

	print "=row=:@row\n";	

	# 这个col是个什么结构?
	my $col = {
		NAME   => $row[0],
		TYPE   => $row[2],
		LENGTH => $row[3],
		SCALE  => $row[4],
		NULL   => $row[5],
		INDEX  => $index
	};

	print "=col=$col->{NAME}:$col\n";

	# 数组里放一个
	push @col_array, $col;
	# map里放一个，key是NAME
	$col_map{$col->{NAME}} = $col;
	$index++;
};

close HANDLE;

my $ddl_info = {
	ARRAY => [@col_array], MAP => {%col_map}  # 这个[]和{}是什么意思？
};


# ==================================gen_del_data










