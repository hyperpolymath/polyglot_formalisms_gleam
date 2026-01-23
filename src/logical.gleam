// SPDX-License-Identifier: PMPL-1.0-or-later
////
//// Logical operations from the PolyglotFormalisms Common Library specification.
////
//// Gleam implementation matching aggregate-library behavioral semantics.
////

/// and(a, b) -> Bool
///
/// Computes the logical conjunction (AND) of two boolean values.
///
/// # Behavioral Semantics
/// - Parameters: a (first boolean), b (second boolean)
/// - Returns: True if both a and b are True, otherwise False
///
/// # Truth Table
/// | a     | b     | and(a, b) |
/// |-------|-------|-----------|
/// | True  | True  | True      |
/// | True  | False | False     |
/// | False | True  | False     |
/// | False | False | False     |
///
/// # Mathematical Properties
/// - Commutativity: and(a, b) == and(b, a)
/// - Associativity: and(and(a, b), c) == and(a, and(b, c))
/// - Identity element: and(a, True) == a
/// - Annihilator: and(a, False) == False
/// - Idempotence: and(a, a) == a
/// - Distributivity: and(a, or(b, c)) == or(and(a, b), and(a, c))
///
/// # Examples
/// ```gleam
/// and(True, True)     // Returns True
/// and(True, False)    // Returns False
/// and(False, True)    // Returns False
/// and(False, False)   // Returns False
/// ```
pub fn and(a: Bool, b: Bool) -> Bool {
  a && b
}

/// or(a, b) -> Bool
///
/// Computes the logical disjunction (OR) of two boolean values.
///
/// # Behavioral Semantics
/// - Parameters: a (first boolean), b (second boolean)
/// - Returns: True if at least one of a or b is True, otherwise False
///
/// # Truth Table
/// | a     | b     | or(a, b) |
/// |-------|-------|----------|
/// | True  | True  | True     |
/// | True  | False | True     |
/// | False | True  | True     |
/// | False | False | False    |
///
/// # Mathematical Properties
/// - Commutativity: or(a, b) == or(b, a)
/// - Associativity: or(or(a, b), c) == or(a, or(b, c))
/// - Identity element: or(a, False) == a
/// - Annihilator: or(a, True) == True
/// - Idempotence: or(a, a) == a
/// - Distributivity: or(a, and(b, c)) == and(or(a, b), or(a, c))
///
/// # Examples
/// ```gleam
/// or(True, True)     // Returns True
/// or(True, False)    // Returns True
/// or(False, True)    // Returns True
/// or(False, False)   // Returns False
/// ```
pub fn or(a: Bool, b: Bool) -> Bool {
  a || b
}

/// not(a) -> Bool
///
/// Computes the logical negation (NOT) of a boolean value.
///
/// # Behavioral Semantics
/// - Parameters: a (boolean value to negate)
/// - Returns: True if a is False, False if a is True
///
/// # Truth Table
/// | a     | not(a) |
/// |-------|--------|
/// | True  | False  |
/// | False | True   |
///
/// # Mathematical Properties
/// - Involution (double negation): not(not(a)) == a
/// - Excluded middle: or(a, not(a)) == True
/// - Non-contradiction: and(a, not(a)) == False
/// - De Morgan's laws:
///   - not(and(a, b)) == or(not(a), not(b))
///   - not(or(a, b)) == and(not(a), not(b))
///
/// # Examples
/// ```gleam
/// not(True)     // Returns False
/// not(False)    // Returns True
/// ```
pub fn not(a: Bool) -> Bool {
  !a
}
