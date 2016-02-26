//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgauge
import flightspec
import flightyear

public class CharStreamSpec: ImperativeSpecification {

    public var title = "CharStream Specification"

    static func test1( outcomes : Outcomes ) {
        outcomes( [
            .ConstraintCheckSuccess( message: "TO DO" )
        ] )
    }

    public var tests = [
        "TO DO.": CharStreamSpec.test1
    ]

}