
use Socket;

$port = 8888;    # 监听的端口
$server_ip_address = "127.0.0.1";
bind( SOCKET, pack_sockaddr_in($port, inet_aton($server_ip_address))) or die "无法绑定端口! \n";
