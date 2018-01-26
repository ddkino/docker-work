package main

import (
	"fmt"
	"log"
	"net"
	"net/http"

	"github.com/gorilla/mux"
)

func GetLocalIP() string {
	addrs, err := net.InterfaceAddrs()
	if err != nil {
		return ""
	}
	for _, address := range addrs {
		// check the address type and if it is not a loopback the display it
		if ipnet, ok := address.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
			if ipnet.IP.To4() != nil {
				return ipnet.IP.String()
			}
		}
	}
	return ""
}

func helloFunc(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello Dede %s", GetLocalIP())
}

func rootFunc(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<a href='/hello'>hello</a><br/> ip:%s", GetLocalIP())
}
func main() {
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", rootFunc).Methods("GET")
	router.HandleFunc("/hello", helloFunc).Methods("GET")
	http.Handle("/", router)
	log.Fatal(http.ListenAndServe(":8880", nil))
	// log.Fatal(http.ListenAndServe(":8080", router))
}
