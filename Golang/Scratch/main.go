package main
// https://blog.codeship.com/building-minimal-docker-containers-for-go-applications/
// https://blog.docker.com/2016/09/docker-golang/
// build command with libraries CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
// Cross-compilation
// Go 1.5 comes with outstanding out-of-the-box cross-compilation abilities, so if your container operating system and/or architecture doesn’t match your system’s, it’s no problem at all!
// To enable cross-compilation, you need to set GOOS and/or GOARCH.
// For instance, assuming that you are on a 64 bits Mac:
import (
    "fmt"
    "io/ioutil"
    "net/http"
    "os"
)

func main() {
    resp, err := http.Get("https://google.com")
    check(err)
    body, err := ioutil.ReadAll(resp.Body)
    check(err)
    fmt.Println(len(body))
}

func check(err error) {
    if err != nil {
        fmt.Println(err)
        os.Exit(1)
    }
}