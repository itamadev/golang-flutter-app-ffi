package main

import (
	"C"
	"fmt"
	"os"
)

//export CreateMessage
func CreateMessage(message *C.char) {
	file, err := os.Create("./message.txt")

	if err != nil {
		panic(err)
	}

	defer file.Close()

	if _, err := file.WriteString(fmt.Sprint(C.GoString(message))); err != nil {
		panic(err)
	}
}

func main() {}
