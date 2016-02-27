//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Base class for a character input stream.
///
/// Reference: http://www.quanttec.com/fparsec/reference/charstream.html#CharStream.members.Seek
///
public protocol BaseCharStream {

    // TODO var column : Int

    var index : String.CharacterView.Index { get }

    var indexOfFirstChar : String.CharacterView.Index { get }

    var indexOfLastCharPlus1 : String.CharacterView.Index { get }

    // TODO: indexToken

    var isBeginningOfStream : Bool { get }

    var isEndOfStream : Bool { get }

    var line : Int { get }

    // TODO: lineBegin

    func match( char: Character ) -> Bool

    // TODO: func match( chars: String ) -> Bool

    // TODO: func match( regex: Regex ) -> Bool

    // TODO: matchCaseFolded

    var name : String { get set }

    func peek() -> Character

    // TODO: func peek( offset ) -> Character

    // TODO: peek2

    // TODO: peekString

    // TODO: position

    func read() -> Character

    // TODO: registerNewLine

    // TODO: registerNewLines

    func skip() -> Self

    func skip( char: Character ) -> Bool

    // TODO: func skip( offset: Int )

    // TODO: func skip( chars: String )

    // TODO: seek

    // TODO: skipAndPeek

    // TODO: skipCaseFolded

    var stateTag : Int { get }

}

public let END_OF_STREAM_CHAR : Character = "\u{FFFF}"

