//
// Created by mnordberg on 2/24/16.
//

import flightgauge

///
/// Type synonym for the callback function passed to an imperative test for collecting the results.
///
public typealias Outcomes = ([ConstraintCheckResult]) -> ()

///
/// A specification consisting of a collection of test functions that return outcomes.
///
public protocol ImperativeSpecification : Specification {

    /// The title of this specification.
    var title : String { get }

    /// The individual tests within this specification.
    var tests : [ String: ( Outcomes ) -> () ] { get }

}

extension ImperativeSpecification {

    ///
    /// Executes this specification, returning a constraint check result.
    ///
    public func check() -> ConstraintCheckResult {

        var testResults : [ConstraintCheckResult] = []
        var specResults : [ConstraintCheckResult] = []

        func outcomes( moreResults: [ConstraintCheckResult] ) {
            testResults.appendContentsOf( moreResults )
        }

        for (testTitle,testFunction) in self.tests {
            testResults = []

            testFunction( outcomes )

            specResults.append( .ConstraintCheckComposite( message: testTitle, checks: testResults ) )
        }

        return .ConstraintCheckComposite( message: self.title, checks: specResults );

    }

}