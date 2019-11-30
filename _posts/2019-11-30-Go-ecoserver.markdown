---
layout: post
title:  "Go ecoserver"
date:   2019-11-30 18:00:50 +0000
categories: Go http
---

Here are a few things you should know before you understand the program at the bottom.

To run a server on port 8000 call the function `ListenAndServe()` in the `http` package. It takes the `host:8000` address string as the first parameter and a handler function as the second parameter which could be nil.

This method once called will be continuously serving on that port until there is a fatal error or it is stopped.

To log an error and exit with status 1, use `Fatal(msg)` method in `log` package.

Any request to the above server are dispatched to one of the calls to the function `HandleFunc(pattern string, handler func(ResponseWriter, *Request))`.
Which of these is called depends on the url of the incoming request.

The pattern '/' will catch all request coming to this server.

The function will have access to the whole request and will have to generate the response that will be sent to the server which the server will display as a result of the HTTP call.

The most important properties of the request such as the method (GET), URL (/abc), and protocol (HTTP/1.1) are accessed by the fields `Method`, `URL` and `Proto` on the request pointer passed into the handler function.

The headers are accessible as the map `Header` on the request. We can iterate over it to get all the headers.

To write to the response writer, we can use the function `Fprintf(w io.Writer, format string, a ...interface{})` in the `fmt` package.

If we need to check the success of a call and have no other need from a call, we can do the call assign the result to a variable and then check the error all in one line such as ` if err := r.ParseForm(); err!= nil { log.Print(err)}`

{% highlight go%}
// Start a simple HTTP server that listens on
// the port 8000. Respond with the request
// parameters passed.
package main

import (
    "fmt"
    "log"
    "net/http"
)

func main() {

    // The HTTP calls that match '/' are caught and
    // supplied to the function called handler
    http.HandleFunc("/", handler)

    // Start a server listening on 8000 port
    // if it ends, exit the program and display
    // the error
    log.Fatal(http.ListenAndServe("localhost:8000", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {

    // Print to response the request params method, url and protocol
    fmt.Fprintf(w, "%s %s %s\n", r.Method, r.URL, r.Proto)

    // Print to response the headers
    for k, v := range r.Header {
        fmt.Fprintf(w, "Header[%q] = %q\n", k, v)
    }

    // Print to response host
    fmt.Fprintf(w, "Host = %q\n", r.Host)

    // Print to response remote address
    fmt.Fprintf(w, "Remote address = %q\n", r.RemoteAddr)

    // Check error in parsing the form
    // First parse the form and assign the error to err
    // Then check if it's not nil
    if err := r.ParseForm(); err != nil {
        // Write the error to log
        log.Print(err)
    }

}

}

{% endhighlight %}
