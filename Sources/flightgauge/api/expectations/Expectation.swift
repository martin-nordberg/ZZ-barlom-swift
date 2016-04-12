//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Protocol defining the starting point for a fluent interfaced expectation.
///
public protocol Expectation {

    /// The type of the value expected to satisfy some condition.
    associatedtype ValueType

    ///
    /// Performs a constraint check, giving back a constraint check result.
    /// - Parameter constraint: the constraint expected to be satisfied.
    ///
    func toBe(
        constraint: AnyConstraint<ValueType>
    ) -> EConstraintCheckResult

    ///
    /// Performs a constraint check if a value exists; gives back a constraint check result,
    /// succeeding if the tested actual value does not exist or does satisfy the constraint.
    /// - Parameter constraint: the constraint expected to be satisfied if the value exists.
    ///
    func toOptionallyBe(
        constraint: AnyConstraint<ValueType>
    ) -> EConstraintCheckResult

    ///
    /// Performs a constraint check on a value that is expected to not exist.
    ///
    func toNotExist() -> EConstraintCheckResult
}

///
/// Thunk for making Expectation into a generic type.
///

public final class AnyExpectation<T>: Expectation {

    private let _toBe: AnyConstraint<T> -> EConstraintCheckResult

    private let _toOptionallyBe: AnyConstraint<T> -> EConstraintCheckResult

    private let _toNotExist: ( () -> EConstraintCheckResult )

    public init<U:Expectation where U.ValueType == T>( _ expectation: U ) {
        self._toBe = expectation.toBe
        self._toOptionallyBe = expectation.toOptionallyBe
        self._toNotExist = expectation.toNotExist
    }

    public func toBe( constraint: AnyConstraint<T> ) -> EConstraintCheckResult {
        return self._toBe( constraint )
    }

    public func toOptionallyBe( constraint: AnyConstraint<T> ) -> EConstraintCheckResult {
        return self._toOptionallyBe( constraint )
    }

    public func toNotExist() -> EConstraintCheckResult {
        return self._toNotExist()
    }
}