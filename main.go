package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", helloHandler)
	if err := http.ListenAndServe(":8181", nil); err != nil {
		log.Fatal("server not started")
	}
}

func helloHandler(rw http.ResponseWriter, r *http.Request) {
	if r.Method == "GET" {

		log.Println("GET request received")
		name := r.URL.Query().Get("name")

		rw.Write([]byte(fmt.Sprintf("Hello %v\n", name)))
	}
}
