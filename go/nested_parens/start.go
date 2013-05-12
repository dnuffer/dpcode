package main


/* TODO: write IsValidParens
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

