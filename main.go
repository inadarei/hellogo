package main

import (
    "fmt"
    "net/http"
    "time"
    "os"
)

func main() {

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "<p>Hello. Welcome to the Hello service! You've requested: %s\n", r.URL.Path)
        fmt.Fprintf(w, "<p>Current time is: %s", time.Now().String())
    })

    serverPort := os.Getenv("PORT")
    if serverPort == "" {
        serverPort = "8181"
    }
    http.ListenAndServe(":" + serverPort, nil)
}
