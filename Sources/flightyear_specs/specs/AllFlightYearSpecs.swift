//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightspec

//---------------------------------------------------------------------------------------------------------------------

public let allFlightYearSpecs = CompositeSpecification(

    title: "Flight Year Specifications",

    childSpecifications: [
        StringStreamBeginningEndSpec(),
        StringStreamCharacterReadingSpec(),
        CharParsersSpec()
    ]

)

//---------------------------------------------------------------------------------------------------------------------

