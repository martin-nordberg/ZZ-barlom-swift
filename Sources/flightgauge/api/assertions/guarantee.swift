//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Top level function establishes the start of a declarative asserted expectation. Intended for
///    writing function postconditions.
///
/// For example:
/// ...
/// shared Resource acquireResource() {
///  ...
///
///   // postcondition calls fatalError (with a very readable message) if function runs incorrectly
///   guarantee( result, named: "result" ).toBe( anInteger.greaterThan(0) );
/// }
///
public func guarantee<T>(
    actualValue: T?,
    named valueName: String = "value",
    file: StaticString = #file,
    line: UInt = #line
) -> AssertedExpectation<T> {

    return AssertedExpectation( makeExpectation( actualValue, named: valueName ), file, line );

}

//---------------------------------------------------------------------------------------------------------------------
