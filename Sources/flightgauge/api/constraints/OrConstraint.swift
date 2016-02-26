///
/// Constraint that is the disjunction of two other constraints.
///

public class OrConstraint<T>: Constraint {

    private let constraint1: AnyConstraint<T>;
    private let constraint2: AnyConstraint<T>;

    public init(
        _ constraint1: AnyConstraint<T>,
        _ constraint2: AnyConstraint<T>
    ) {
        self.constraint1 = constraint1;
        self.constraint2 = constraint1;
    }

    /// Checks this constraint against a given actual value with an optional name of that value
    /// for use in message output.
    /// @param actualValue An actual value to compare against the condition of the constraint.
    /// @param name The name of the value for use in outcome result messages.
    public func check(
        actualValue: T,
        _ valueName: String
    ) -> ConstraintCheckResult {

        let result1 = constraint1.check( actualValue, valueName );
        if ( result1.isSuccess ) {
            return result1;
        }

        let result2 = constraint2.check( actualValue, valueName );
        if ( result2.isSuccess ) {
            return result2;
        }

        return .ConstraintCheckFailure( message: result1.message + " -OR- " + result2.message );

    }
}
