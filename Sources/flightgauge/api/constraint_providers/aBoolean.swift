///
/// Constraint provider for a boolean value.
///
public class BoolConstraintProvider: EquatableConstraints<Bool> {

    ///
    /// Returns a constraint that checks that a boolean value is false.
    ///
    public var thatIsFalse: AnyConstraint<Bool> {
        get {
            func compare( actualValue: Bool ) -> Bool {
                return !actualValue
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "false" ) )
        }
    }

    ///
    /// Returns a constraint that checks that a boolean value is true.
    ///
    public var thatIsTrue: AnyConstraint<Bool> {
        get {
            func compare( actualValue: Bool ) -> Bool {
                return actualValue
            }
            return AnyConstraint( AdjectivalConstraint( checkCondition: compare, adjective: "true" ) )
        }
    }

}

///
/// Singleton instance of BoolConstraintProvider.
///
public let aBoolean = BoolConstraintProvider()

