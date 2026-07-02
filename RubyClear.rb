
require 'socket'
require 'timeout'

def test_connection (host, port, timeout)
Timeout.timeout(timeout) do
    socket = TCPSocket.new(host, port)
    socket.close
    return true
end
rescue Errno::ECONNREFUSED
    "Server up, port closed"
rescue Timeout::Error, Errno::ETIMEDOUT
    "Connection timed out"
rescue SocketError
    "DNS failed"
rescue => e
    "Error: #{e.message}"
end

res = test_connection("1.1.12.1", 444, 2)
if res == true
    puts "Yay"
else 
    puts "Nay - #{res}"
end
