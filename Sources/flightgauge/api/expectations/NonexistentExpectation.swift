//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// An expectation where the actual value does not exist.
///
public class NonexistentExpectation<T>: Expectation {
    public typealias ValueType = T

    public let valueName: String

    public init( named valueName: String ) {
        self.valueName = valueName
    }

    public func toBe( constraint: AnyConstraint<T> ) -> ConstraintCheckResult {
        if ( valueName == "value" ) {
            return .ConstraintCheckUnexpectedNull( message: "Expected a nonexistent value." );
        }

        return .ConstraintCheckUnexpectedNull( message: "Expected a nonexistent value for ``valueName``." );
    }

    public func toOptionallyBe( constraint: AnyConstraint<T> ) -> ConstraintCheckResult {
        return .ConstraintCheckSuccess( message: "Ignored nonexistent but optional ``valueName``." );
    }

    public func toNotExist() -> ConstraintCheckResult {
        return .ConstraintCheckSuccess( message: "Verified that \( self.valueName ) does not exist." )
    }
}
