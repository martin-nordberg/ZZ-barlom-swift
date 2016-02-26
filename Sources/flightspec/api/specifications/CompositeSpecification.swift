//
// Created by mnordberg on 2/24/16.
//

import flightgauge

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
