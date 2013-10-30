package main


/*
Input:
    parens: A string of parentheses

Output:
    Whether the parentheses are properly nested

Examples:
    >>> IsValidParens('((()()))()')
    True
    >>> IsValidParens(')()(')
    False
*/

func IsValidParens(parens string) bool {
	depth := 0
	for i := 0; i < len(parens); i++ {
		if parens[i] == '(' {
			depth++
		} else {
			depth--
			if depth < 0 {
				return false
			}
		}
	}
	return depth == 0
}

func TestIsValidParens() {
	if IsValidParens("((()()))()") != true {
		panic("IsValidParens('((()()))()') should return true")
	}
	if IsValidParens("((()()))(") != false {
		panic("IsValidParens('((()()))(') should return false")
	}
	if IsValidParens(")()(") != false {
		panic("IsValidParens(')()(' should return false")
	}
}

func main() {
	TestIsValidParens()
}

