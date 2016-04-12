//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Enumeration of parsing result statuses.
///
public enum EReplyStatus {

    /// A successful parse result.
    case Ok

    /// A failed parse result. Error recovery may be possible.
    case Error

    /// A failed parse result. Error recovery is not possible.
    case FatalError

}

//---------------------------------------------------------------------------------------------------------------------

