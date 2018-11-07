package main

import (
	"fmt"
	"net/http"

	"google.golang.org/appengine"
)

func handleEcho(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		if r.FormValue("anotherVariable") != "" {
			fmt.Fprintf(w, fmt.Sprintf("CLOUDWALK %s %s", r.FormValue("buf"), r.FormValue("anotherVariable")))
		} else {
			fmt.Fprintf(w, fmt.Sprintf("CLOUDWALK %s", r.FormValue("buf")))
		}
		return
	}
	http.Redirect(w, r, "https://docs.cloudwalk.io", http.StatusSeeOther)
}

func init() {
	http.HandleFunc("/", handleEcho)
}

func main() {
	appengine.Main()
}
