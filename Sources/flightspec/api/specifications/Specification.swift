//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgauge

//---------------------------------------------------------------------------------------------------------------------

///
/// Interface to a specification that returns a ConstraintCheckResult
///
public protocol Specification {

    ///
    /// Executes this specification, returning a constraint check result.
    ///
    func check() -> EConstraintCheckResult

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Executes the given specification.
/// - Parameter specification: the specification to execute.
/// - Returns: the result of checking the constraints imposed by the spec.
///
public func checkSpecification( specification : Specification ) -> EConstraintCheckResult {
    return specification.check()
}

//---------------------------------------------------------------------------------------------------------------------

