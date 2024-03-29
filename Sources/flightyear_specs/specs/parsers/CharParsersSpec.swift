//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

import flightgauge
import flightspec
import flightyear

//---------------------------------------------------------------------------------------------------------------------

///
/// Specification for parsing a stream one character at a time
///

public class CharParsersSpec: ImperativeSpecification {

    public var title = "Single Character Parsing"

    public var tests : Tests = [

        "A string can be parsed as a sequence of any characters.": { outcomes in

            let stream = makeStringStream( "abcd" )

            let parse = anyChar >* anyChar >* anyChar >* anyChar

            let outcome = parse(stream)

            outcomes( [
                expect( outcome.status == .Ok, named: "parse status is OK", toBe: aBoolean.thatIsTrue ),
                expect( outcome.result , named: "parse result", toBe: aCharacter.equalTo( "d" ) )
            ] )

        },

        "A string can be parsed as specific single characters.": { outcomes in

            let stream = makeStringStream( "abcd" )

            let parse = pchar("a") >* pchar("b") >* pchar("c") >* pchar("d")

            let outcome = parse(stream)

            outcomes( [
                expect( outcome.status == .Ok, named: "parse status is OK", toBe: aBoolean.thatIsTrue ),
                expect( outcome.result , named: "parse result", toBe: aCharacter.equalTo( "d" ) )
            ] )

        },

        "An invalid string parsed as specific single characters shows a correct error.": { outcomes in

            let stream = makeStringStream( "abxd" )

            let parse = pchar("a") >* pchar("b") >* pchar("c") >* pchar("d")

            let outcome = parse(stream)

            outcomes( [
                expect( outcome.status == .Error, named: "parse status is error", toBe: aBoolean.thatIsTrue ),
                expect( outcome.errors[0].text , named: "parse error", toBe: aString.equalTo( "Expected 'c'." ) ),
                expect( stream.peek(), named: "next unread character", toBe: aCharacter.equalTo( "x" ) )
            ] )

        },

        "A string can be parsed as specific single characters, some skipped.": { outcomes in

            let stream = makeStringStream( "abcd" )

            let parse = skipChar("a") >* skipChar("b") >* skipChar("c") >* pchar("d")

            let outcome = parse(stream)

            outcomes( [
                expect( outcome.status == .Ok, named: "parse status is OK", toBe: aBoolean.thatIsTrue ),
                expect( outcome.result , named: "parse result", toBe: aCharacter.equalTo( "d" ) )
            ] )

        },

        "An invalid string parsed as specific single characters (some skipped) shows a correct error.": { outcomes in

            let stream = makeStringStream( "abxd" )

            let parse = skipChar("a") >* skipChar("b") >* skipChar("c") >* pchar("d")

            let outcome = parse(stream)

            outcomes( [
                expect( outcome.status == .Error, named: "parse status is error", toBe: aBoolean.thatIsTrue ),
                expect( outcome.errors[0].text , named: "parse error", toBe: aString.equalTo( "Expected 'c'." ) ),
                expect( stream.peek(), named: "next unread character", toBe: aCharacter.equalTo( "x" ) )
            ] )

        },

        "A string can be parsed as any single characters, some skipped.": { outcomes in

            let stream = makeStringStream( "abcd" )

            let parse = skipAnyChar >* skipAnyChar >* skipAnyChar >* pchar("d")

            let outcome = parse(stream)

            outcomes( [
                expect( outcome.status == .Ok, named: "parse status is OK", toBe: aBoolean.thatIsTrue ),
                expect( outcome.result , named: "parse result", toBe: aCharacter.equalTo( "d" ) )
            ] )

        },

    ]

}

//---------------------------------------------------------------------------------------------------------------------
