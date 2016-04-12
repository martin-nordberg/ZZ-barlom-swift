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
public protocol BaseCharStream {

    ///
    /// The column number of the next character in the stream (1 to n).
    ///
    var column : Int { get }

    // TODO: indexToken

    ///
    /// Whether the next char in the stream is the first char. (If the stream is empty, this value is always true.)
    ///
    var isBeginningOfStream : Bool { get }

    ///
    /// Whether there is no character remaining in the stream. (If the stream is empty, this value is always true.)
    ///
    var isEndOfStream : Bool { get }

    ///
    /// The line number for the next character in the stream. (The line count starts with 1.)
    ///
    var line : Int { get }

    ///
    /// Returns true if the next character in the stream matches the specified character. (At the end of the stream
    /// always returns false.) (This method does not change the state of the stream.)
    ///
    func match( char: Character ) -> Bool

    ///
    /// Returns true if the passed string chars matches the next chars.Length stream chars.
    /// If not all the chars match or if there are not enough chars remaining in the stream, false is returned.
    /// If chars is empty, true is returned.
    /// This method does not change the state of the CharStream.
    ///
    func matchString( chars: String ) -> Bool

    // TODO: func match( regex: Regex ) -> Bool

    // TODO: matchCaseFolded

    ///
    /// This string is used in error messages to describe the input stream.
    ///
    /// Setting the same value increments the state tag by 1, independent of whether the new value is different from
    /// the previous one.
    ///
    var name : String { get set }

    ///
    /// Returns the next character without changing the state of the stream. At the end of the stream
    /// END_OF_STREAM_CHAR ('\uFFFF') is returned.
    ///
    func peek() -> Character

    // TODO: func peek( offset ) -> Character

    // TODO: peek2

    // TODO: peekString

    ///
    /// Returns the current position of the input stream
    ///
    func position() -> Position

    ///
    /// Skips over the next character in the stream. Returns the skipped char. At the end of the stream read() does
    /// not change the stream position and returns the EndOfStreamChar ('\uFFFF').
    /// When this method changes the stream position, it increments the state tag by 1; otherwise, it does not change
    /// the state tag.
    ///
    func read() -> Character

    ///
    /// Skips over any single character or standard newline ("\n", "\r\n" or "\r").
    /// This method returns '\n' when it skips a newline. Otherwise, it returns the skipped character, except at the
    /// end of the stream, where it returns END_OF_STREAM_CHAR ('\uffff').
    /// When this method skips a newline, it also registers it.
    /// When this method skips a character or newline, it increments the state tag by 1; otherwise, it does not change
    /// the state tag.
    ///
    func readCharOrNewline() -> Character

    // TODO: registerNewLine

    // TODO: registerNewLines


    ///
    /// Advances the position within the stream by 1 character, except at the end of the stream, where it does nothing.
    /// When this method changes the stream position, it increments the state tag by 1; otherwise, it does not change
    /// the state tag.
    ///
    func skip() -> Self

    ///
    /// Skips over the next character in the stream if this character matches the passed argument char. Returns true
    /// if the characters match; otherwise, false. At the end of the stream this method always returns false.
    /// When this method changes the stream position, it increments the state tag by 1; otherwise, it does not change
    /// the state tag.
    ///
    func skip( char: Character ) -> Bool

    // TODO: func skip( offset: Int )

    ///
    /// Skips over the next chars.characters.count chars in the stream if these chars match the passed string chars.
    /// Returns true if the chars match. If not all the chars match or if there are not enough chars remaining in the
    /// stream, no char is skipped and false is returned. If chars is empty, true is returned. chars must not be null.
    /// When this method changes the stream position, it increments the StateTag by 1; otherwise, it does not change
    /// the StateTag, except if chars is empty, in which case it may or may not increment the StateTag by 1.
    func skipString( chars: String ) -> Bool

    // TODO: seek

    // TODO: skipAndPeek

    // TODO: skipCaseFolded

    ///
    /// Skips over a standard newline ("\n", "\r\n" or "\r"). Returns true if a newline is skipped, otherwise false.
    /// When this method skips a newline, it also registers it.
    /// When this method skips a newline, it increments the state tag by 1, otherwise it does not change the state tag.
    ///
    func skipNewline() -> Bool

    ///
    /// Skips over any sequence of space (' '), tab ('\t') or newline ('\r', '\n') chars. Returns true if it skips at
    /// least one char, otherwise false.
    /// This method registers any skipped standard newline ("\n", "\r\n" or "\r").
    /// When this method skips at least one character, it increments the state tag by 1; otherwise, it does not change
    /// the state tag.
    func skipWhitespace() -> Bool

    ///
    /// The state tag’s purpose is to provide an efficient way to determine whether the publicly visible state of the
    /// stream has changed after a series of method calls. To determine whether a series of method calls has changed
    /// the stream, it is often enough to compare the state tag values from before and after the method calls.
    ///
    /// The StateTag property is primarily meant for use in the implementation of parser combinators.
    ///
    var stateTag : Int { get }

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Character indicating a read past the end of a stream.
///
public let END_OF_STREAM_CHAR : Character = "\u{FFFF}"

//---------------------------------------------------------------------------------------------------------------------

