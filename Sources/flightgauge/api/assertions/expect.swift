//
// The expect() function.
//

///
/// Top level function establishes the start of a declarative expectation.
/// For example:
/// ```
/// /* A stack starts out empty. */
/// void testNewStack( void outcomes( ConstraintCheckResult* results ) ) {
///    let stack = Stack<Integer>();
///    // expected outcomes of the test
///    outcomes(
///      expect( stack ).named( "stack" ).toBe( anIntegerStack.thatIsEmpty ),
///      expect( stack.topIfPresent ).named( "top of stack" ).toNotExist()
///    );
/// }
/// ```
///
public func expect<T>( maybeActualValue: T?, named valueName: String = "value" ) -> AnyExpectation<T> {

    if let actualValue = maybeActualValue {
        return AnyExpectation( ExistentExpectation( actualValue, named: valueName ) )
    }

    return AnyExpectation( NonexistentExpectation( named: valueName ) )
}