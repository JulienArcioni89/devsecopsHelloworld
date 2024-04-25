// hello_test.go
package greetings

import (
	"testing"
)

func TestSum(t *testing.T) {
	// Appel de la fonction Sum avec des valeurs
	result := Sum(3, 4)

	// Vérification du résultat
	expected := 7
	if result != expected {
		t.Errorf("Sum(3, 4) = %d; want %d", result, expected)
	}
}
