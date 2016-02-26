//
// Created by martin on 1/8/16.
//

import barlom_metamodel_api
import flightgauge
import flightgear
import flightgear_specs
import flightspec


let v = Vertex( "BARLOM (api) vertex" )

print( "Hello " + v.name + " world!" )


func sample( a: Int ) {

    constrain( a ).toBe( anInteger.thatIsPositive )

    let result = -a

    guarantee( result, named: "result" ).toBe( anInteger.thatIsNegative )
}

sample( 1 )


func uuidTest( uuidStr: String ) {

    let uuid = Uuid( uuidStr )

    guarantee( uuid.description ).toBe( aString.equalTo( uuidStr ) )
}

uuidTest( "00112233-4455-6677-8899-AABBCCDDEEFF" )
uuidTest( "00110233-0455-0677-0899-0ABB0CDD0EFF" )


class UuidSpec: ImperativeSpecification {

    var title = "UUID Specification"

    static func test1( outcomes : Outcomes ) {
        let uuid = Uuid( "00112233-4455-6677-8899-AABBCCDDEEFF" )
        outcomes( [
            expect( uuid.description, named: "UUID description" ).toBe( aString.equalTo( "00112233-4455-6677-8899-AABBCCDDEEFF" ) ),
            .ConstraintCheckSuccess( message: "Obviously" )
        ] )
    }

    static func test2( outcomes : Outcomes ) {
        let uuid = Uuid( "00110233-0455-0677-0899-0ABB0CDD0EFF" )
        outcomes( [
            expect( uuid.description, named: "UUID description" ).toBe( aString.equalTo( "00112233-4455-6677-8899-AABBCCDDEEFF" ) ),
            .ConstraintCheckSuccess( message: "Obviously" )
        ] )
    }

    var tests = [
        "First Test": UuidSpec.test1,
        "Second Test": UuidSpec.test2
    ]

}

print( runTextReport( checkSpecification( CompositeSpecification( title:"Example Spec", childSpecifications: [UuidSpec(), UuidSpec()] ) ) ) )

print( runTextReport( checkSpecification( CompositeSpecification( title:"All Specifications", childSpecifications: [allFlightGearSpecs] ) ) ) )
