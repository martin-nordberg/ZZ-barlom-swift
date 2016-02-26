//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Protocol defining a constraint that is expected to be satisfied.
///
public protocol Constraint {

    ///
    /// The type of the value expected to satisfy some condition.
    ///
    associatedtype ValueType

    ///
    /// Checks this constraint against a given actual value with an optional name of that value
    /// for use in message output."
    /// - Parameter actualValue: An actual value to compare against the condition of the constraint.
    /// - Parameter name: The name of the value for use in outcome result messages.
    ///
    func check(
        actualValue: ValueType,
        _ valueName: String
    ) -> ConstraintCheckResult;

}


///
/// Thunk for making Constraint into a generic type.
///
public final class AnyConstraint<T>: Constraint {

    private let _check: ( ( T, String ) -> ConstraintCheckResult )

    public init<U:Constraint where U.ValueType == T>( _ constraint: U ) {
        _check = constraint.check
    }

    public func check( actualValue: T,
                       _ valueName: String ) -> ConstraintCheckResult {
        return _check( actualValue, valueName )
    }

    /// Returns a constraint that is the conjunction of this constraint and another one.
    public func and( otherConstraint: AnyConstraint<T> ) -> AnyConstraint<T> {
        return AnyConstraint( AndConstraint( self, otherConstraint ) )
    }

    /// Returns a constraint that is the disjunction of this constraint and another one.
    public func or( otherConstraint: AnyConstraint<T> ) -> AnyConstraint<T> {
        return AnyConstraint( OrConstraint( self, otherConstraint ) )
    }
}