//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Class representing a parsing result.
///
public class Reply<TResult> {

    public let errors : [EErrorMessage]

    public let result : TResult?

    public let status : EReplyStatus

    public init( _ result : TResult ) {
        self.result = result
        self.status = EReplyStatus.Ok
        self.errors = []
    }

    public init( status : EReplyStatus, error : EErrorMessage ) {
        self.result = nil
        self.status = status
        self.errors = [error]
    }

}

