import net/Socket, net/ServerSocket, net/StreamSocket, net/berkeley, net/Address

/*
SOCKET INITIALIZATION:

I'd like to see the following:

ServerSocket new() // no auto-listen, it's not set up! this is implemented, other 3 overloads are not
ServerSocket new(port: Int)
ServerSocket new(ip: String, port: Int)
ServerSocket new(ip: String, port: Int, listen: Bool)

ServerSocket bind(ip: String)      // not implemented
ServerSocket bind(port: Int)       // implemented, ServerSocket bind()
ServerSocket listen(backlog: Int)  // implemented, ServerSocket listen()

ACCEPTING CONNECTIONS:
Abstracting away from a receiving StreamSocket, by adding the following:
conn := socket accept() // implemented, ServerSocket accept()
conn out write("str")   // not implemented
conn in recv()          // not implemented

*/

socket := ServerSocket new()
inaddr: InAddr
inet_pton(AddressFamily IP4, "0.0.0.0", inaddr&)
addr := SocketAddressIP4 new(inaddr, 8000)
socket bind(addr)
//socket bind(8000)
socket listen(1) // no clue what a good number would be. went with 1.

while(true) {
    conn := socket accept()
    writer := conn writer()
    writer write("<html><body>Hello, from the ooc socket world!</body></html>")
    conn close()
}

/* Using all the modifications I mentioned, we could turn the above code into this: */
/*
socket := ServerSocket new("0.0.0.0", 8000)

while(true) {
    conn := socket accept()
    conn out write("<html><body>Hello, from the ooc socket world!</body></html>")
    conn close()
}


Completely unrelated, but i'd love a loop(|| ... )

*/