//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Top level function establishes the start of a declarative expectation.
/// For example:
///
/// /* A stack starts out empty. */
/// void testNewStack( void outcomes( ConstraintCheckResult* results ) ) {
///    let stack = Stack<Integer>();
///    // expected outcomes of the test
///    outcomes(
///      makeExpectation( stack, named: "stack" ).toBe( anIntegerStack.thatIsEmpty ),
///      makeExpectation( stack.topIfPresent, named: "top of stack" ).toNotExist()
///    );
/// }
///
public func makeExpectation<T>( maybeActualValue: T?, named valueName: String = "value" ) -> AnyExpectation<T> {

    if let actualValue = maybeActualValue {
        return AnyExpectation( ExistentExpectation( actualValue, named: valueName ) )
    }

    return AnyExpectation( NonexistentExpectation( named: valueName ) )

}

//---------------------------------------------------------------------------------------------------------------------

public func expect<T>(
    maybeActualValue: T?,
    named valueName: String = "value",
    toBe constraint: AnyConstraint<T>
) -> EConstraintCheckResult {

    return makeExpectation( maybeActualValue, named: valueName ).toBe( constraint );

}

//---------------------------------------------------------------------------------------------------------------------

public func expect<T>(
    maybeActualValue: T?,
    named valueName: String = "value",
    toOptionallyBe constraint: AnyConstraint<T>
) -> EConstraintCheckResult {

    return makeExpectation( maybeActualValue, named: valueName ).toOptionallyBe( constraint );

}

//---------------------------------------------------------------------------------------------------------------------
