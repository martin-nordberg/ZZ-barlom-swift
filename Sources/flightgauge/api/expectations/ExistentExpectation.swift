//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// An expectation where the actual value does exist.
///
public class ExistentExpectation<T>
    : Expectation {

    public typealias ValueType = T

    public let actualValue: T

    public let valueName: String

    public init( _ actualValue: T, named valueName: String ) {
        self.actualValue = actualValue
        self.valueName = valueName
    }

    public func toBe( constraint: AnyConstraint<T> ) -> ConstraintCheckResult {
        return constraint.check( self.actualValue, self.valueName );
    }

    public func toOptionallyBe( constraint: AnyConstraint<T> ) -> ConstraintCheckResult {
        return constraint.check( self.actualValue, self.valueName );
    }

    public func toNotExist() -> ConstraintCheckResult {
        return .ConstraintCheckUnexpectedNull( message: "Expected \( self.valueName ) to not exist, but is \( self.actualValue )." )
    }
}
