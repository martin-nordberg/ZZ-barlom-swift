//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgear_specs
import flightspec
import flightyear_specs

print( runTextReport( checkSpecification(
    CompositeSpecification(
        title:"All Specifications",
        childSpecifications: [
            allFlightGearSpecs,
            allFlightYearSpecs
        ]
    )
) ) )
