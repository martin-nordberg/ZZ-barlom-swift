//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Top level function establishes the start of a declarative asserted expectation. Intended for
///    writing function preconditions.
///
/// For example:
/// ...
/// shared Resource acquireResource() {
///  // precondition throws AssertionException (with a very readable message) if no resources available
///  constrain( this.availableResourceCount ).named( \"available resources\" ).toBe( anInteger.greaterThan(0) );
///
///  ...
///}
///
public func constrain<T>(
    actualValue: T?,
    named valueName: String = "value",
    file: StaticString =
#file,
line: UInt = #line
) -> AssertedExpectation<T> {
    return AssertedExpectation( expect( actualValue, named: valueName ), file, line );
}
