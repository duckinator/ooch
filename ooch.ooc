import net/ServerSocket

socket := ServerSocket new("0.0.0.0", 8000)

socket accept(|conn|
    conn in readLine() println()

    // Start headers
    conn out write("HTTP/1.0 200 OK\r\n")
    conn out write("Server: ooc httpd\r\n")
    conn out write("Content-Type: text/html\r\n")
    conn out write("\r\n")
    // End headers

    // Content
    conn out write("<html><body>Hello, from the ooc socket world!</body></html>")
)
