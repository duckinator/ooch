import net/ServerSocket

/*
SOCKET INITIALIZATION:

ServerSocket new() // Create socket, no binding, not listening
ServerSocket new(port: Int) // Create socket, bind to port, not listening
ServerSocket new(ip: String, port: Int) // Create socket, bind to IP and port, not listening
ServerSocket new(ip: String, port: Int, enabled: Bool) // Create socket, bind to IP and port, listening only if `enabled` is true

ServerSocket bind(port: Int) // Bind to port
ServerSocket bind(ip: String, port: Int) // Bind to IP and port
ServerSocket listen(backlog: Int) // Listen, with backlog specified as argument
ServerSocket listen() // Calls listen(100), more details in sdk/net/ServerSocket.ooc line #138

ACCEPTING CONNECTIONS:
Abstracting away from a receiving StreamSocket, by adding the following:
conn := socket accept() // implemented, ServerSocket accept()
conn out write("str")   // not implemented
conn in recv()          // not implemented

*/

socket := ServerSocket new("0.0.0.0", 8000, true)

while(true) {
    conn := socket accept()
    writer := conn writer()
    writer write("<html><body>Hello, from the ooc socket world!</body></html>")
    conn close()
}

/* Using all the modifications I mentioned, we could turn the above code into this: */
/*
socket := ServerSocket new("0.0.0.0", 8000, true)

while(true) {
    conn := socket accept()
    conn out write("<html><body>Hello, from the ooc socket world!</body></html>")
    conn close()
}


Completely unrelated, but i'd love a loop(|| ... )

*/
