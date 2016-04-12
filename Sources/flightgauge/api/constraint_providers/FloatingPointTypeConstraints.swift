//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Constraint provider for floating point numbers.
///
public class FloatingPointTypeConstraints<T where T: FloatingPointType, T: IntegerLiteralConvertible>
    : SignedNumberTypeConstraints<T> {

    ///
    /// Returns a constraint that checks that a number is finite.
    ///
    public var thatIsFinite: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue.isFinite
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "finite" ) )
        }
    }

    ///
    /// Returns a constraint that checks that a number is infinite.
    ///
    public var thatIsInfinite: AnyConstraint<T> {
        get {
            func compare( actualValue: T ) -> Bool {
                return actualValue.isInfinite
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "infinite" ) )
        }
    }

}

//---------------------------------------------------------------------------------------------------------------------

