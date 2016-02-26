///
/// Interface to a specification that returns a ConstraintCheckResult
///

import flightgauge

public protocol Specification {

    ///
    /// Executes this specification, returning a constraint check result.
    ///
    func check() -> ConstraintCheckResult

}

public func checkSpecification( specification : Specification ) -> ConstraintCheckResult {
    return specification.check()
}