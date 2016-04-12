//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Sum type for possible parsing error messages.
///
public enum EErrorMessage {

    /// An expected item (e.g. "identifier") was not found.
    case Expected( String )

    /// An expected single character was not found.
    case ExpectedChar( Character )

    /// An expected string was not found.
    case ExpectedString( String )

    /// An error described by a custom message.
    case Message( String )

    /// An unexpected item was parsed.
    case Unexpected( String )

    /// An unexpected string was parsed.
    case UnexpectedString( String )

    /// Determines whether this cyclicity is acyclic.
    public var text: String {
        get {
            switch self {
                case let .Expected( item ):
                    return "Expected \( item )."
                case let .ExpectedChar( char ):
                    return "Expected '\(char)'."
                case let .ExpectedString( string ):
                    return "Expected '\( string )'."
                case let .Message( message ):
                    return message
                case let .Unexpected( item ):
                    return "Unexpected \(item)."
                case let .UnexpectedString( string ):
                    return "Unexpected: '\( string )'."
            }
        }
    }

}

//---------------------------------------------------------------------------------------------------------------------

