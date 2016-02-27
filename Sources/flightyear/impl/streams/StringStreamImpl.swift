//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Base class for a character input stream.
///
/// Reference: http://www.quanttec.com/fparsec/reference/charstream.html#CharStream.members.Seek
///
public class StringStreamImpl : BaseCharStream {

    private let _chars : String

    private var _index : String.CharacterView.Index

    private var _line : Int

    // TODO: _lineBegin

    private var _name : String

    private var _stateTag : Int

    ///
    /// Constructs a new input stream that will read the given string.
    ///
    public init( text : String, index : Int, length: Int ) {

        self._chars = text
        self._index = text.characters.startIndex.advancedBy( index )
        self._line = 0
        self._name = ""
        self._stateTag = 0

        self.indexOfFirstChar = self._index

        if ( length >= 0 ) {
            self.indexOfLastCharPlus1 = self._index.advancedBy( length )
        }
        else {
            self.indexOfLastCharPlus1 = text.characters.endIndex
        }

    }

    // TODO public var column : Int

    public static let endOfStreamChar : Character = "\u{FFFF}"

    public var index : String.CharacterView.Index {
        return self._index
    }

    public let indexOfFirstChar : String.CharacterView.Index

    public var indexOfLastCharPlus1 : String.CharacterView.Index

    // TODO: indexToken

    public var isBeginningOfStream : Bool {
        return self._index == self.indexOfFirstChar
    }

    public var isEndOfStream : Bool {
        return self._index == self.indexOfLastCharPlus1
    }

    public var line : Int {
        return self._line
    }

    // TODO: lineBegin

    public func match( char: Character ) -> Bool {
        return !self.isEndOfStream && self._chars[self._index] == char
    }

    // TODO: public func match( chars: String ) -> Bool

    // TODO: public func match( regex: Regex ) -> Bool

    // TODO: matchCaseFolded

    public var name : String {
        get {
            return self._name
        }
        set {
            self._name = newValue
            self._stateTag += 1
        }
    }

    public func peek() -> Character {
        if ( self.isEndOfStream ) {
            return END_OF_STREAM_CHAR
        }
        return self._chars.characters[self._index]
    }

    // TODO: public func peek( offset ) -> Character

    // TODO: peek2

    // TODO: peekString

    // TODO: position

    public func read() -> Character {
        if ( self.isEndOfStream ) {
            return END_OF_STREAM_CHAR
        }

        let result = self._chars[self._index]

        self._stateTag += 1
        self._index = self._index.advancedBy( 1 )

        return result
    }

    // TODO: registerNewLine

    // TODO: registerNewLines

    public func skip() -> Self {
        if ( !self.isEndOfStream ) {
            self._index = self._index.advancedBy( 1 )
            self._stateTag += 1;
        }
        return self
    }

    public func skip( char: Character ) -> Bool {
        if ( self.match( char ) ) {
            self.skip()
            return true
        }
        return false
    }

    // TODO: public func skip( offset: Int )

    // TODO: public func skip( chars: String )

    // TODO: skipAndPeek

    // TODO: skipCaseFolded

    public var stateTag : Int {
        return self._stateTag
    }

    // TODO: seek



}
