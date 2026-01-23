// SPDX-License-Identifier: PMPL-1.0-or-later
//// String Operations
////
//// String operations from the PolyglotFormalisms Common Library specification.
////
//// Gleam implementation matching aggregate-library behavioral semantics.

import gleam/string

/// Concatenates two strings.
///
/// ## Behavioral Semantics
/// - Parameters: a (first string), b (second string)
/// - Returns: The concatenation of a and b
///
/// ## Mathematical Properties
/// - Associativity: concat(concat(a, b), c) == concat(a, concat(b, c))
/// - Identity element: concat(a, "") == concat("", a) == a
///
/// ## Examples
/// ```gleam
/// concat("Hello", " World")  // "Hello World"
/// concat("", "test")          // "test"
/// ```
pub fn concat(a: String, b: String) -> String {
  a <> b
}

/// Returns the length of a string (number of graphemes).
///
/// ## Behavioral Semantics
/// - Parameters: s (string to measure)
/// - Returns: Number of graphemes in the string
///
/// ## Mathematical Properties
/// - Non-negativity: length(s) >= 0
/// - Empty string: length("") == 0
/// - Concatenation: length(concat(a, b)) == length(a) + length(b)
///
/// ## Examples
/// ```gleam
/// length("Hello")      // 5
/// length("")           // 0
/// length("🎉")         // 1
/// ```
pub fn length(s: String) -> Int {
  string.length(s)
}

/// Extracts a substring using 0-based indexing.
///
/// ## Behavioral Semantics
/// - Parameters: s (source string), start (start index), end_pos (end index)
/// - Returns: Substring from start to end_pos (inclusive)
/// - Indexing: 0-based (Gleam convention)
///
/// ## Edge Cases
/// - If start > end_pos: returns empty string
/// - If indices out of bounds: returns truncated result
///
/// ## Examples
/// ```gleam
/// substring("Hello World", 0, 4)   // "Hello"
/// substring("Hello World", 6, 10)  // "World"
/// ```
pub fn substring(s: String, start: Int, end_pos: Int) -> String {
  case start > end_pos {
    True -> ""
    False -> {
      let len = end_pos - start + 1
      string.slice(s, start, len)
    }
  }
}

/// Finds the first occurrence of a substring.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to search), substr (substring to find)
/// - Returns: 0-based index of first occurrence, or -1 if not found
///
/// ## Mathematical Properties
/// - Not found convention: returns -1
/// - Empty substring: index_of(s, "") == 0 (found at start)
///
/// ## Examples
/// ```gleam
/// index_of("Hello World", "World")  // 6
/// index_of("Test", "xyz")           // -1
/// ```
pub fn index_of(s: String, substr: String) -> Int {
  case substr {
    "" -> 0
    _ -> {
      case string.split(s, substr) {
        [before, ..] if before != s -> string.length(before)
        _ -> -1
      }
    }
  }
}

/// Checks if a string contains a substring.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to search), substr (substring to find)
/// - Returns: True if substr is found in s, False otherwise
///
/// ## Mathematical Properties
/// - Empty substring: contains(s, "") == True (always)
/// - Reflexivity: contains(s, s) == True
///
/// ## Examples
/// ```gleam
/// contains("Hello World", "World")  // True
/// contains("Hello World", "xyz")    // False
/// ```
pub fn contains(s: String, substr: String) -> Bool {
  string.contains(s, substr)
}

/// Checks if a string starts with a given prefix.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to check), prefix (prefix to match)
/// - Returns: True if s starts with prefix, False otherwise
///
/// ## Mathematical Properties
/// - Empty prefix: starts_with(s, "") == True (always)
/// - Reflexivity: starts_with(s, s) == True
///
/// ## Examples
/// ```gleam
/// starts_with("Hello World", "Hello")  // True
/// starts_with("Hello World", "World")  // False
/// ```
pub fn starts_with(s: String, prefix: String) -> Bool {
  string.starts_with(s, prefix)
}

/// Checks if a string ends with a given suffix.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to check), suffix (suffix to match)
/// - Returns: True if s ends with suffix, False otherwise
///
/// ## Mathematical Properties
/// - Empty suffix: ends_with(s, "") == True (always)
/// - Reflexivity: ends_with(s, s) == True
///
/// ## Examples
/// ```gleam
/// ends_with("Hello World", "World")  // True
/// ends_with("Hello World", "Hello")  // False
/// ```
pub fn ends_with(s: String, suffix: String) -> Bool {
  string.ends_with(s, suffix)
}

/// Converts all characters in a string to uppercase.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to convert)
/// - Returns: New string with all characters in uppercase
///
/// ## Mathematical Properties
/// - Idempotence: to_uppercase(to_uppercase(s)) == to_uppercase(s)
///
/// ## Examples
/// ```gleam
/// to_uppercase("Hello World")  // "HELLO WORLD"
/// to_uppercase("test")         // "TEST"
/// ```
pub fn to_uppercase(s: String) -> String {
  string.uppercase(s)
}

/// Converts all characters in a string to lowercase.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to convert)
/// - Returns: New string with all characters in lowercase
///
/// ## Mathematical Properties
/// - Idempotence: to_lowercase(to_lowercase(s)) == to_lowercase(s)
///
/// ## Examples
/// ```gleam
/// to_lowercase("Hello World")  // "hello world"
/// to_lowercase("TEST")         // "test"
/// ```
pub fn to_lowercase(s: String) -> String {
  string.lowercase(s)
}

/// Removes leading and trailing whitespace from a string.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to trim)
/// - Returns: New string with whitespace removed from both ends
///
/// ## Mathematical Properties
/// - Idempotence: trim(trim(s)) == trim(s)
///
/// ## Examples
/// ```gleam
/// trim("  Hello World  ")  // "Hello World"
/// trim("\n\tTest\n")      // "Test"
/// ```
pub fn trim(s: String) -> String {
  string.trim(s)
}

/// Splits a string into parts using a delimiter.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to split), delimiter (separator)
/// - Returns: List of substrings
/// - Empty delimiter: returns list of individual graphemes
///
/// ## Examples
/// ```gleam
/// split("a,b,c", ",")           // ["a", "b", "c"]
/// split("Hello World", " ")      // ["Hello", "World"]
/// ```
pub fn split(s: String, delimiter: String) -> List(String) {
  case delimiter {
    "" -> string.to_graphemes(s)
    _ -> string.split(s, delimiter)
  }
}

/// Joins a list of strings with a separator.
///
/// ## Behavioral Semantics
/// - Parameters: parts (list of strings), separator (string to insert between parts)
/// - Returns: Single string with parts joined by separator
///
/// ## Mathematical Properties
/// - Empty list: join([], sep) == ""
/// - Single element: join([s], sep) == s
///
/// ## Examples
/// ```gleam
/// join(["a", "b", "c"], ",")       // "a,b,c"
/// join(["Hello", "World"], " ")     // "Hello World"
/// ```
pub fn join(parts: List(String), separator: String) -> String {
  string.join(parts, separator)
}

/// Replaces all occurrences of a substring with another string.
///
/// ## Behavioral Semantics
/// - Parameters: s (source string), old (substring to replace), new (replacement)
/// - Returns: New string with all occurrences replaced
///
/// ## Edge Cases
/// - old not found: returns original string unchanged
/// - Empty old: returns original string unchanged
///
/// ## Examples
/// ```gleam
/// replace("Hello World", "World", "Universe")  // "Hello Universe"
/// replace("test test", "test", "demo")         // "demo demo"
/// ```
pub fn replace(s: String, old: String, new: String) -> String {
  case old {
    "" -> s
    _ -> string.replace(s, old, new)
  }
}

/// Checks if a string is empty.
///
/// ## Behavioral Semantics
/// - Parameters: s (string to check)
/// - Returns: True if string has zero length, False otherwise
///
/// ## Mathematical Properties
/// - Equivalent to: length(s) == 0
///
/// ## Examples
/// ```gleam
/// is_empty("")        // True
/// is_empty("test")    // False
/// ```
pub fn is_empty(s: String) -> Bool {
  string.is_empty(s)
}
