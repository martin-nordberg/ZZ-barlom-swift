//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgauge

///
/// A specification composed of child specifications.
///
public class CompositeSpecification : Specification {

    private let _title: String
    private let _childSpecifications: [Specification]

    public init( title: String, childSpecifications: [Specification] ) {
        self._title = title
        self._childSpecifications = childSpecifications
    }

    ///
    /// Executes this specification, returning a constraint check result.
    ///
    public func check() -> ConstraintCheckResult {

        var childResults : [ConstraintCheckResult] = []

        for childSpec in self._childSpecifications {
            childResults.append( childSpec.check() )
        }

        return .ConstraintCheckComposite( message: self._title, checks: childResults )

    }


}
