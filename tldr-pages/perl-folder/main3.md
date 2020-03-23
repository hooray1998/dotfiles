# main3

```perl
use Socket        # 定义了 PF_INET 和 SOCK_STREAM

$port = 12345;    # 监听的端口
$server_ip_address = "10.12.12.168";
bind( SOCKET, pack_sockaddr_in($port, inet_aton($server_ip_address)))
   or die "无法绑定端口! \n";
   ```
