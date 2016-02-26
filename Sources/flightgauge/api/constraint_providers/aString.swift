//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Constraint provider for a string value.
///
public class StringConstraints: ComparableConstraints<String> {
    ///
    /// Returns a constraint that checks that a string is longer than a given length.
    ///
    public func longerThan(
        belowMinimumLength: Int
    ) -> AnyConstraint<String> {
        func compare( actualValue: String ) -> Bool {
            return actualValue.characters.count > belowMinimumLength
        }

        return AnyConstraint( AdjectivalConstraint<String>( checkCondition: compare, adjective: "longer than \( belowMinimumLength )" ) )
    }

    ///
    /// Returns a constraint that checks that a string is shorter than a given length.
    ///
    public func shorterThan(
        aboveMaximumLength: Int
    ) -> AnyConstraint<String> {
        func compare( actualValue: String ) -> Bool {
            return actualValue.characters.count < aboveMaximumLength
        }

        return AnyConstraint( AdjectivalConstraint<String>( checkCondition: compare, adjective: "shorter than \( aboveMaximumLength )" ) )
    }

    ///
    /// Returns a constraint that checks that a string is not empty and is shorter than or equal in length to a given value.
    ///
    public func thatIsNotEmptyWithMaximumLength(
        maximumLength: Int
    ) -> AnyConstraint<String> {
        func compare( actualValue: String ) -> Bool {
            return actualValue.characters.count > 0 && actualValue.characters.count <= maximumLength
        }

        return AnyConstraint( AdjectivalConstraint<String>( checkCondition: compare, adjective: "at most \( maximumLength ) characters in length" ) )
    }

    ///
    /// Returns a constraint that checks that a string is equal in length to a given value.
    ///
    public func withLength(
        length: Int
    ) -> AnyConstraint<String> {
        func compare( actualValue: String ) -> Bool {
            return actualValue.characters.count == length
        }

        return AnyConstraint( AdjectivalConstraint<String>( checkCondition: compare, adjective: "exactly \( length ) characters in length" ) )
    }

    ///
    /// Returns a constraint that checks that a string is shorter than or equal in length to a given value.
    ///
    public func withMaximumLength(
        maximumLength: Int
    ) -> AnyConstraint<String> {
        func compare( actualValue: String ) -> Bool {
            return actualValue.characters.count <= maximumLength
        }

        return AnyConstraint( AdjectivalConstraint<String>( checkCondition: compare, adjective: "at most \( maximumLength ) characters in length" ) )
    }

    ///
    /// Returns a constraint that checks that a string is longer than or equal in length to a given value.
    ///
    public func withMinimumLength(
        minimumLength: Int
    ) -> AnyConstraint<String> {
        func compare( actualValue: String ) -> Bool {
            return actualValue.characters.count >= minimumLength
        }

        return AnyConstraint( AdjectivalConstraint<String>( checkCondition: compare, adjective: "at least \( minimumLength ) characters in length" ) )
    }
}


public let aString = StringConstraints()

