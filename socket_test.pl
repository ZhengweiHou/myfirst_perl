#!/usr/bin/perl -w
use strict;
use Socket;
 
# 初始化地址与端口
my $host = shift || 'localhost';
my $port = shift || 8500;
my $server = "localhost";  # 主机地址
 
# 创建 socket 并连接
socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "无法创建 socket $!\n";
connect( SOCKET, pack_sockaddr_in($port, inet_aton($server)))
   or die "无法连接：port $port! \n";
 
#my $line;
#while ($line = <SOCKET>) {
#        print "$line\n";
#}

sleep 3;
print SOCKET "hhdasflasfasdasfd\n";
#print SOCKET "11111";

sleep 5;

close SOCKET or die "close: $!";

