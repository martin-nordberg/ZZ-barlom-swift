//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Base class for a character input stream.
///
/// Reference: http://www.quanttec.com/fparsec/reference/charstream.html#CharStream.members.Seek
///
public protocol CharStream
    : BaseCharStream {

    associatedtype TUserState

    // TODO: func backtrackTo

    // TODO: func createSubstream

    // TODO: func readFrom

    // TODO: var state { get }

    var userState : TUserState { get set }

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Builds a character stream that reads from a given string.
/// TODO: return CharStream
///
public func makeStringStream( text : String, startIndex : Int = 0, length: Int = -1 ) -> BaseCharStream {

    return StringStreamImpl( text: text, startIndex: startIndex, length: length )

}

//---------------------------------------------------------------------------------------------------------------------

