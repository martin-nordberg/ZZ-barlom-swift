//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightspec

///
/// A compositie specification for the Flight Gear module.
///
public let allFlightGearSpecs = CompositeSpecification(
    title: "Flight Gear Specifications",
    childSpecifications: [
        UuidSpec()
    ]
)
