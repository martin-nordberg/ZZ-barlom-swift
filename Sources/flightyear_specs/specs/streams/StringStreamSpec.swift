//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgauge
import flightspec
import flightyear

public class StringStreamBeginningEndSpec: ImperativeSpecification {

    public var title = "String Stream Beginning/End Determination"

    public var tests : Tests = [

        "A freshly built string stream is at the beginning.": { outcomes in

            let stream = makeStringStream( "some text" )

            outcomes( [
                expect( stream.isBeginningOfStream, named: "isBeginningOfStream" ).toBe( aBoolean.thatIsTrue )
            ] )

        },

        "A once read string stream is not at the beginning.": { outcomes in

            let stream = makeStringStream( "some text" )

            stream.read()

            outcomes( [
                expect( stream.isBeginningOfStream, named: "isBeginningOfStream" ).toBe( aBoolean.thatIsFalse )
            ] )

        },

        "A fully read string stream is at the end.": { outcomes in

            let stream = makeStringStream( "some text" )

            for i in 0..<9 {
                stream.read()
            }

            outcomes( [
                expect( stream.isBeginningOfStream, named: "isBeginningOfStream" ).toBe( aBoolean.thatIsFalse ),
                expect( stream.isEndOfStream, named: "isEndOfStream" ).toBe( aBoolean.thatIsTrue )
            ] )

        },

        "An empty string stream is at the beginning and at the end.": { outcomes in

            let stream = makeStringStream( "" )

            outcomes( [
                expect( stream.isBeginningOfStream, named: "isBeginningOfStream" ).toBe( aBoolean.thatIsTrue ),
                expect( stream.isEndOfStream, named: "isEndOfStream" ).toBe( aBoolean.thatIsTrue )
            ] )

        }

    ]

}

public class StringStreamCharacterReadingSpec: ImperativeSpecification {

    public var title = "String Stream Character Reading"

    public var tests : Tests = [

        "A string can be read one character at a time.": { outcomes in

            let stream = makeStringStream( "some text" )

            outcomes( [
                expect( stream.read() ).toBe( aCharacter.equalTo( "s" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "o" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "m" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( " " ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "t" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "x" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "t" ) )
            ] )

        },

        "A string can be matched one character at a time.": { outcomes in

            let stream = makeStringStream( "some text" )

            outcomes( [
                expect( stream.match("q") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.match("s") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.match("s") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "s" ) ),
                expect( stream.match("o") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "o" ) ),
                expect( stream.match("m") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.match("m") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "m" ) ),
                expect( stream.match("e") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.match("x") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.match("j") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.match(" ") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( " " ) ),
                expect( stream.match("t") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "t" ) ),
                expect( stream.match("e") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.match("w") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.match("x") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "x" ) ),
                expect( stream.match("t") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.match("t") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "t" ) ),
            ] )

        },

        "A string can be skipped one character at a time.": { outcomes in

            let stream = makeStringStream( "some text" )

            outcomes( [
                expect( stream.skip("q") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.skip("s") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("o") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("m") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("e") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("x") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.skip("j") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.skip(" ") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("t") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("e") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("w") ).toBe( aBoolean.thatIsFalse ),
                expect( stream.skip("x") ).toBe( aBoolean.thatIsTrue ),
                expect( stream.skip("t") ).toBe( aBoolean.thatIsTrue ),
            ] )

        },

        "A string can be read and peeked one character at a time.": { outcomes in

            let stream = makeStringStream( "some text" )

            outcomes( [
                expect( stream.peek() ).toBe( aCharacter.equalTo( "s" ) ),
                expect( stream.peek() ).toBe( aCharacter.equalTo( "s" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "s" ) ),
                expect( stream.peek() ).toBe( aCharacter.equalTo( "o" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "o" ) ),
                expect( stream.peek() ).toBe( aCharacter.equalTo( "m" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "m" ) ),
                expect( stream.peek() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( " " ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "t" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.peek() ).toBe( aCharacter.equalTo( "x" ) ),
                expect( stream.peek() ).toBe( aCharacter.equalTo( "x" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "x" ) ),
                expect( stream.read() ).toBe( aCharacter.equalTo( "t" ) )
            ] )

        },

        "A string can be read and skipped one character at a time.": { outcomes in

            let stream = makeStringStream( "some text" )

            outcomes( [
                expect( stream.read() ).toBe( aCharacter.equalTo( "s" ) ),
                expect( stream.skip().read() ).toBe( aCharacter.equalTo( "m" ) ),
                expect( stream.skip().read() ).toBe( aCharacter.equalTo( " " ) ),
                expect( stream.skip().read() ).toBe( aCharacter.equalTo( "e" ) ),
                expect( stream.skip().read() ).toBe( aCharacter.equalTo( "t" ) ),
            ] )

        }
    ]

}

