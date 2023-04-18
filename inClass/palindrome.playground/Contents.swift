import UIKit

var greeting = "racecar"

print(isPalindromeHalf(greeting));
print(isPalindromeFull(greeting));

func isPalindromeHalf(_ str: String) -> Bool {
    let prefix = str.prefix(str.count / 2);
    let suffix = str.suffix(str.count / 2);
    
    print(type(of: prefix));
    print(type(of: suffix));
    
    return String(prefix) == String(suffix.reversed());
}

func isPalindromeFull(_ str: String) -> Bool {
    return str == String(str.reversed());
}
