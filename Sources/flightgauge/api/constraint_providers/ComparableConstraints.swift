//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Concrete constraint class for checking comparable values - less than, greater than, etc.
///
public class ComparableConstraints<T where T: Comparable>: EquatableConstraints<T> {
    /// Returns a constraint that checks that the actual value is greater than a comparable value."
    public func greaterThan(
        comparableValue: T
    ) -> AnyConstraint<T> {
        func compare( actualValue: T ) -> Bool {
            return actualValue > comparableValue
        }

        return AnyConstraint( ComparisonConstraint<T>( checkCondition: compare, comparisonText: "greater than", comparableValue: comparableValue ) )
    }

    /// Returns a constraint that checks that the actual value is greater than or equal to a comparable value."
    public func greaterThanOrEqualTo(
        comparableValue: T
    ) -> AnyConstraint<T> {
        func compare( actualValue: T ) -> Bool {
            return actualValue >= comparableValue
        }

        return AnyConstraint( ComparisonConstraint<T>( checkCondition: compare, comparisonText: "greater than or equal to", comparableValue: comparableValue ) )
    }

    /// Returns a constraint that checks that the actual value is less than a comparable value."
    public func lessThan(
        comparableValue: T
    ) -> AnyConstraint<T> {
        func compare( actualValue: T ) -> Bool {
            return actualValue < comparableValue
        }

        return AnyConstraint( ComparisonConstraint<T>( checkCondition: compare, comparisonText: "less than", comparableValue: comparableValue ) )
    }

    /// Returns a constraint that checks that the actual value is less than or equal to a comparable value."
    public func lessThanOrEqualTo(
        comparableValue: T
    ) -> AnyConstraint<T> {
        func compare( actualValue: T ) -> Bool {
            return actualValue <= comparableValue
        }

        return AnyConstraint( ComparisonConstraint<T>( checkCondition: compare, comparisonText: "less than or equal to", comparableValue: comparableValue ) )
    }
}


