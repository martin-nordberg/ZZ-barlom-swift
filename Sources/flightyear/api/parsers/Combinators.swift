//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Parser combinators.
///


infix operator >* { associativity left }

///
///The parser p1 >* p2 applies the parsers p1 and p2 in sequence and returns the result of p2.
///
public func >* <TResult>( parser1: ( BaseCharStream -> Reply<TResult> ), parser2: ( BaseCharStream -> Reply<TResult> ) ) -> ( BaseCharStream -> Reply<TResult> ) {

    func parse( input: BaseCharStream ) -> Reply<TResult> {
        let reply1 = parser1( input )
        if ( reply1.status == .Ok ) {
            let reply2 = parser2( input )
            return reply2
        }
        else {
            return reply1
        }
    }

    return parse

}


let psample1 = skipChar( "A" ) >* skipChar( "B" )

let psample2 = psample1 >* psample1

let psample3 = spaces1 >* eof

