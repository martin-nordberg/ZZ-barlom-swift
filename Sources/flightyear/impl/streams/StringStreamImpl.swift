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

    private let _indexOfFirstChar : String.CharacterView.Index

    private var _indexOfLastCharPlus1 : String.CharacterView.Index

    private var _line : Int

    private var _lineBegin : String.CharacterView.Index

    private var _name : String

    private var _stateTag : Int

    ///
    /// Constructs a new input stream that will read the given string.
    ///
    public init( text : String, startIndex: Int = 0, length: Int = -1 ) {

        self._chars = text
        self._index = text.characters.startIndex.advancedBy( startIndex )
        self._indexOfFirstChar = self._index
        self._lineBegin = self._index;
        self._line = 1
        self._name = ""
        self._stateTag = 0

        if ( length >= 0 ) {
            self._indexOfLastCharPlus1 = self._index.advancedBy( length )
        }
        else {
            self._indexOfLastCharPlus1 = text.characters.endIndex
        }

    }

    public var column : Int {

        get {
            return self._lineBegin.distanceTo( self._index ) + 1
        }

    }

    // TODO: indexToken

    public var isBeginningOfStream : Bool {
        return self._index == self._indexOfFirstChar
    }

    public var isEndOfStream : Bool {
        return self._index == self._indexOfLastCharPlus1
    }

    public var line : Int {
        return self._line
    }

    public func match( char: Character ) -> Bool {
        return !self.isEndOfStream && self._chars[self._index] == char
    }

    public func matchString( chars: String ) -> Bool {
        var pos = self._index
        for char in chars.characters {
            if ( pos == self._indexOfLastCharPlus1 || self._chars[pos] != char ) {
                return false
            }
            pos = pos.advancedBy( 1 )
        }
        return true
    }

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

    public func read() -> Character {
        if ( self.isEndOfStream ) {
            return END_OF_STREAM_CHAR
        }

        let result = self._chars[self._index]

        self._stateTag += 1
        self._index = self._index.advancedBy( 1 )

        return result
    }

    public func readCharOrNewline() -> Character {
        if ( self.skipNewline() ) {
            return "\n"
        }
        return self.read()
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

    public func skipString( chars: String ) -> Bool {
        if ( self.matchString( chars ) ) {
            self._index = self._index.advancedBy( chars.characters.count )
            self._stateTag += 1;
            return true
        }
        return false
    }

    // TODO: skipAndPeek

    // TODO: skipCaseFolded

    public func skipNewline() -> Bool {
        if ( !self.match( "\n" ) && !self.match( "\r\n" ) && !self.match( "\r" ) ) {
            return false;
        }

        self._index = self._index.advancedBy( 1 )
        self._lineBegin = self._index
        self._line += 1
        self._stateTag += 1;
        return true;
    }

    public func skipWhitespace() -> Bool {
        var result = false
        var more = true

        while ( more ) {
            switch self.peek() {
                case " ":
                    fallthrough
                case "\t":
                    self.skip()
                    result = true
                case "\r":
                    fallthrough
                case "\r\n":
                    fallthrough
                case "\n":
                    self.skipNewline()
                    result = true
                default:
                    more = false
            }
        }

        return result
    }

    public var stateTag : Int {
        return self._stateTag
    }

    // TODO: seek



}
