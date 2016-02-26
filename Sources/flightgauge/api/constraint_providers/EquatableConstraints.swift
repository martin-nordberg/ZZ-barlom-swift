///
/// Concrete constraint class enforces equality of an actual value with an expected value.
///

public class EquatableConstraints<T where T: Equatable> {
    /// Returns a constraint that checks that an actual value equals an expected value.
    public func equalTo(
        expectedValue: T
    ) -> AnyConstraint<T> {
        func compare( actualValue: T ) -> Bool {
            return actualValue == expectedValue
        }

        return AnyConstraint( ComparisonConstraint<T>( checkCondition: compare, comparisonText: "equal to", comparableValue: expectedValue ) )
    }

    /// Returns a constraint that checks that an actual value does not equal an expected value.
    public func notEqualTo(
        expectedValue: T
    ) -> AnyConstraint<T> {
        // TBD: include the actual value in the success message

        func compare( actualValue: T ) -> Bool {
            return actualValue != expectedValue
        }

        return AnyConstraint( ComparisonConstraint<T>( checkCondition: compare, comparisonText: "not equal to", comparableValue: expectedValue ) )
    }

    /// Returns a constraint that checks that an actual value equals an expected value (synonym for equalTo).
    public func withValue(
        expectedValue: T
    ) -> AnyConstraint<T> {
        return self.equalTo( expectedValue )
    }
}

