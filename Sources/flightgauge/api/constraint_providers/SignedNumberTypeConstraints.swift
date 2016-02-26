//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Constraint provider for signed numbers.
///
public class SignedNumberTypeConstraints<T where T: Comparable, T: IntegerLiteralConvertible>: ComparableConstraints<T> {
    /// Returns a constraint that checks that a number is negative (less than 0).

    public var thatIsNegative: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue < 0
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "negative" ) )
        }
    }

    /// Returns a constraint that checks that a number is not negative (less than 0).

    public var thatIsNonnegative: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue >= 0
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "not negative" ) )
        }
    }

    /// Returns a constraint that checks that a number is not negative (less than 0).

    public var thatIsNonpositive: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue <= 0
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "not positive" ) )
        }
    }

    /// Returns a constraint that checks that a number is nonzero.

    public var thatIsNonzero: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue != 0
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "nonzero" ) )
        }
    }

    /// Returns a constraint that checks that a number is posittive (greater than than 0).

    public var thatIsPositive: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue > 0
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "positive" ) )
        }
    }

    /// Returns a constraint that checks that a number is zero.

    public var thatIsZero: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue == 0
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "zero" ) )
        }
    }

}
