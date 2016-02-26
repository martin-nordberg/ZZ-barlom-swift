//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// A constraint with messages expressed in terms of a simple adjective like 'empty' or 'ready'.
///
public class AdjectivalConstraint<T>
    : BasicConstraint<T> {

    public required init(
        checkCondition: T throws -> Bool,
        adjective: String
    ) {
        func makeSuccessMessage( valueName: String ) -> String {
            return "Verified \( valueName ) to be \( adjective )."
        }

        func makeFailureMessage( actualValue: T, valueName: String ) -> String {
            return "Expected \( valueName ) to be \( adjective ), but was \( actualValue )."
        }

        func makeExceptionMessage( actualValue: T, valueName: String ) -> String {
            return "An exception occurred while checking whether \( valueName ) is \( adjective )."
        }

        super.init( checkCondition: checkCondition,
            makeSuccessMessage: makeSuccessMessage,
            makeFailureMessage: makeFailureMessage,
            makeExceptionMessage: makeExceptionMessage )
    }

}

