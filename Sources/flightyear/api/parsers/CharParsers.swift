//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Basic parsers for reading single characters.
///

//---------------------------------------------------------------------------------------------------------------------

///
/// Parses any single character except end-of-stream. Consumes '\r' or '\r\n' as '\n'.
///
public func anyChar( input: BaseCharStream ) -> Reply<Character> {

    let ch = input.readCharOrNewline()

    if ( ch != END_OF_STREAM_CHAR ) {
        return Reply( ch )
    }

    return Reply( status: .Error, error: .Unexpected( "end of input" ) )

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Parses the character c and returns result. If c = '\r' or c = '\n' then pchar c will parse any one newline
/// ("\n", "\r\n" or "\r") and return result.
///
func charReturn<TResult>( ch: Character, result: TResult ) -> ( BaseCharStream -> Reply<TResult> ) {

    switch ch {

        case "\r":
            return newlineReturn( result );

        case "\n":
            return newlineReturn( result );

        default:
            func parse( input: BaseCharStream ) -> Reply<TResult> {
                if ( input.skip( ch ) ) {
                    return Reply( result )
                }
                return Reply( status: .Error, error: .ExpectedChar( ch ) )
            }

            return parse

    }

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Parses the char c and returns c. If c = '\r' or c = '\n' then pchar c will parse any one newline ("\n", "\r\n"
/// or "\r") and return c.
///
public func pchar( ch: Character ) -> ( BaseCharStream -> Reply<Character> ) {

    return charReturn( ch, result: ch )

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Skips any single character except end-of-stream. Consumes '\r' or '\r\n' as '\n'.
///
public func skipAnyChar( input: BaseCharStream ) -> Reply<()> {

    let ch = input.readCharOrNewline()

    if ( ch != END_OF_STREAM_CHAR ) {
        return Reply( () )
    }

    return Reply( status: .Error, error: .Unexpected( "end of input" ) )

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Parses the char c and returns (). If c = '\r' or c = '\n' then pchar c will parse any one newline ("\n", "\r\n"
/// or "\r") and return ().
///
public func skipChar( ch: Character ) -> ( BaseCharStream -> Reply<()> ) {

    return charReturn( ch, result: () )

}

//---------------------------------------------------------------------------------------------------------------------


