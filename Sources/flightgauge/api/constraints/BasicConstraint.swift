//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Common higher order constraint that computes a test result from a predicate and a function that
/// computes the message when needed for a failure.
///
public class BasicConstraint<T>
    : Constraint {

    public typealias ValueType = T

    private let checkCondition: T throws -> Bool

    private let makeSuccessMessage: String -> String

    private let makeFailureMessage: ( T, String ) -> String

    private let makeExceptionMessage: ( T, String ) -> String

    public required init(
        checkCondition: T throws -> Bool,
        makeSuccessMessage: String -> String,
        makeFailureMessage: ( T, String ) -> String,
        makeExceptionMessage: ( T, String ) -> String
    ) {
        self.checkCondition = checkCondition;
        self.makeSuccessMessage = makeSuccessMessage;
        self.makeFailureMessage = makeFailureMessage;
        self.makeExceptionMessage = makeExceptionMessage;
    }

    public func check( actualValue: T, _ valueName: String ) -> ConstraintCheckResult {
        do {
            if ( try self.checkCondition( actualValue ) ) {
                return .ConstraintCheckSuccess( message: self.makeSuccessMessage( valueName ) );
            }
            return .ConstraintCheckFailure( message: self.makeFailureMessage( actualValue, valueName ) );
        }
        catch let e {
            return .ConstraintCheckUnexpectedException( message: self.makeExceptionMessage( actualValue, valueName ), error: e );
        }
    }
}


