//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Parser combinators.
///

//---------------------------------------------------------------------------------------------------------------------


infix operator >* { associativity left }

///
///The parser p1 >* p2 applies the parsers p1 and p2 in sequence and returns the result of p2.
///
public func >* <TResult1,TResult2>(
    parser1: ( BaseCharStream -> Reply<TResult1> ),
    parser2: ( BaseCharStream -> Reply<TResult2> )
) -> ( BaseCharStream -> Reply<TResult2> ) {

    func parse( input: BaseCharStream ) -> Reply<TResult2> {
        let reply1 = parser1( input )
        if ( reply1.status == .Ok ) {
            let reply2 = parser2( input )
            return reply2
        }
        else {
            return Reply( status: reply1.status, errors: reply1.errors )
        }
    }

    return parse

}

//---------------------------------------------------------------------------------------------------------------------


