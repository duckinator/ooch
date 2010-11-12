import net/ServerSocket

socket := ServerSocket new("0.0.0.0", 8000, true)

while(true) {
    conn := socket accept()
    conn in readLine() println()
    conn out write("<html><body>Hello, from the ooc socket world!</body></html>")
    conn close()
}

