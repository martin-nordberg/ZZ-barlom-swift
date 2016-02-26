//
// Created by mnordberg on 2/25/16.
//

import flightspec

public let allFlightGearSpecs = CompositeSpecification(
    title: "Flight Gear Specifications",
    childSpecifications: [
        UuidSpec()
    ]
)
