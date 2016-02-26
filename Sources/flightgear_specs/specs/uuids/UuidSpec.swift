//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgauge
import flightgear
import flightspec

///
/// Speciifcation for class Uuid
///
public class UuidSpec: ImperativeSpecification {

    public var title = "UUID Specification"

    static func testDescriptionA( outcomes : Outcomes ) {
        let uuid = Uuid( "00112233-4455-6677-8899-AABBCCDDEEFF" )
        outcomes( [
            expect( uuid.description, named: "UUID description" ).toBe( aString.equalTo( "00112233-4455-6677-8899-AABBCCDDEEFF" ) )
        ] )
    }

    static func testDescriptionB( outcomes : Outcomes ) {
        let uuid = Uuid( "00110233-0455-0677-0899-0ABB0CDD0EFF" )
        outcomes( [
            expect( uuid.description, named: "UUID description" ).toBe( aString.equalTo( "00110233-0455-0677-0899-0ABB0CDD0EFF" ) )
        ] )
    }

    public var tests = [
        "UUIDs are self-describing (A).": UuidSpec.testDescriptionA,
        "UUIDs are self-describing (B).": UuidSpec.testDescriptionB
    ]

}