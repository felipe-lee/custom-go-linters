// This must be package main
package main

import (
	"golang.org/x/tools/go/analysis"

	"github.com/felipe-lee/custom-go-linters/pkg/ato"
)

type analyzerPlugin struct{}

// This must be implemented
func (*analyzerPlugin) GetAnalyzers() []*analysis.Analyzer {
	return []*analysis.Analyzer{
		ato.ATOAnalyzer,
	}
}

// This must be defined and named 'AnalyzerPlugin'
var AnalyzerPlugin analyzerPlugin
