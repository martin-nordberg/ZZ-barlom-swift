//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Class representing a parsing result.
///
public class Reply<TResult> {

    /// The errors that occurred in this parsing result (or empty for success).
    public let errors : [EErrorMessage]

    /// The value of this parse result.
    public let result : TResult?

    /// The success status of this parse result.
    public let status : EReplyStatus

    ///
    /// Constructs a new successful reply with given value.
    ///
    public init( _ result : TResult ) {
        self.result = result
        self.status = EReplyStatus.Ok
        self.errors = []
    }

    ///
    /// Constructs a new error result with a single given message.
    ///
    public init( status : EReplyStatus, error : EErrorMessage ) {
        self.result = nil
        self.status = status
        self.errors = [error]
    }

    ///
    /// Constructs a new error result with given error messages.
    ///
    public init( status : EReplyStatus, errors : [EErrorMessage] ) {
        self.result = nil
        self.status = status
        self.errors = errors
    }

}

//---------------------------------------------------------------------------------------------------------------------

