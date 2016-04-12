//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Class representing a position in an input stream.
///
public class Position {

    public let name : String

    public let column: Int

    public let line: Int

    public init( name: String, line: Int, column: Int ) {
        self.name = name
        self.line = line
        self.column = column
    }

}

//---------------------------------------------------------------------------------------------------------------------

