//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Common higher order constraint that computes a test result from a predicate and a function that
/// computes the message when needed for a failure.
///
public class BasicConstraint<T>
    : Constraint {

    public typealias ValueType = T

    private let _checkCondition: T throws -> Bool

    private let _makeSuccessMessage: String -> String

    private let _makeFailureMessage: ( T, String ) -> String

    private let _makeExceptionMessage: ( T, String ) -> String

    ///
    /// Constructs a new basic constraint.
    ///
    public required init(
        checkCondition: T throws -> Bool,
        makeSuccessMessage: String -> String,
        makeFailureMessage: ( T, String ) -> String,
        makeExceptionMessage: ( T, String ) -> String
    ) {
        self._checkCondition = checkCondition;
        self._makeSuccessMessage = makeSuccessMessage;
        self._makeFailureMessage = makeFailureMessage;
        self._makeExceptionMessage = makeExceptionMessage;
    }

    ///
    /// Checks this constraint.
    ///
    public func check( actualValue: T, _ valueName: String ) -> EConstraintCheckResult {
        do {
            if ( try self._checkCondition( actualValue ) ) {
                return .ConstraintCheckSuccess( message: self._makeSuccessMessage( valueName ) );
            }
            return .ConstraintCheckFailure( message: self._makeFailureMessage( actualValue, valueName ) );
        }
        catch let e {
            return .ConstraintCheckUnexpectedException( message: self._makeExceptionMessage( actualValue, valueName ), error: e );
        }
    }
}

//---------------------------------------------------------------------------------------------------------------------

