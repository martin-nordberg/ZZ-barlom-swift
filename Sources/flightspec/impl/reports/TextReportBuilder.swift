//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgauge

//---------------------------------------------------------------------------------------------------------------------

///
/// Builds a plain text report for the results of checking a (usually composite) constraint.
/// - Parameter testResult: the constraint check result to be reported.
///
func buildTextReport( testResult: EConstraintCheckResult ) -> String {

    var result = accumulateTextReport( "", testResult: testResult, indentLevel: 0 )

    result += "\n"

    let successCount = testResult.successCount
    if ( successCount == 1 ) {
        result += "1 Test Succeeded.\n"
    }
    else {
        result += "\(successCount.description) Tests Succeeded.\n"
    }

    let failureCount = testResult.failureCount
    if ( failureCount == 1 ) {
        result += "1 Test Failed.\n"
    }
    else {
        result += "\(failureCount.description) Tests Failed.\n"
    }

    return result

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Creates a string of blanks for given indent level.
///
private func indent( indentLevel: Int ) -> String {
    let space: Character = " "
    return String( count: 2*indentLevel, repeatedValue: space )
}

//---------------------------------------------------------------------------------------------------------------------

///
/// Accumulates the text report output for one constraint check result (recursing for a composite result).
/// - Parameter partialReport: the text report output so far.
/// - Parameter testResult: the next result to output into the report.
/// - Parameter indentLevel: the level of indentation for the next result (incremented for each composite result).
///
private func accumulateTextReport( partialReport: String, testResult : EConstraintCheckResult, indentLevel : Int ) -> String {

    // Output the result itself.
    var result = partialReport + indent(indentLevel) + testResult.message + "\n"

    // Recursively output the children of a composite result.
    if case .ConstraintCheckComposite( _, let checks ) = testResult {
        for check in checks {
            result = accumulateTextReport( result, testResult: check, indentLevel: indentLevel+1 )
        }
    }

    return result

}

//---------------------------------------------------------------------------------------------------------------------
