//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Basic parsers for reading white space.
///

///
/// Parses the end of input.
///
func eof( input: BaseCharStream ) -> Reply<()> {
    if ( input.isEndOfStream ) {
        return Reply( () )
    }
    return Reply( status: .Error, error: .Expected( "end of input" ) )
}

///
/// Parses one of '\r', '\n', '\r\n'. Returns '\n'.
///
let newline = newlineReturn( "\n" )

///
/// Parses one of '\r', '\n', '\r\n'. Returns the given result.
///
func newlineReturn<TResult>( result: TResult ) -> ( BaseCharStream -> Reply<TResult> ) {

    func parse( input: BaseCharStream ) -> Reply<TResult> {
        if ( input.skipNewline() ) {
            return Reply( result )
        }
        return Reply( status: .Error, error: .Expected( "new line" ) )
    }

    return parse

}

///
/// Parses one of '\r', '\n', '\r\n'. Returns ().
///
let skipNewline = newlineReturn( () )

///
/// Skips over any sequence of zero or more whitespaces: space (' '), tab ('\t'), carriage return ('\r'), or newline ('\n').
///
func spaces( input: BaseCharStream ) -> Reply<()> {
    input.skipWhitespace()
    return Reply( () )
}

///
/// Skips over any sequence of one or more whitespaces: space (' '), tab ('\t'), carriage return ('\r'), or newline ('\n').
///
func spaces1( input: BaseCharStream ) -> Reply<()> {
    if ( input.skipWhitespace() ) {
        return Reply( ( ) )
    }
    return Reply( status: .Error, error: .Expected( "whitespace" ) )
}




