package main

import (
	"github.com/felipe-lee/custom-go-linters/pkg/ato"
	"golang.org/x/tools/go/analysis/singlechecker"
)

func main() {
	singlechecker.Main(ato.ATOAnalyzer)
}
