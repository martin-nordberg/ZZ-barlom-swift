//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Enumerated outcome for a constraint check.
///
public enum ConstraintCheckResult {

    /// A successfully satisfied constraint.
    case ConstraintCheckSuccess( message:String )

    /// A failed constraint.
    case ConstraintCheckFailure( message:String )

    /// A failed constraint where an optional value was unecpectedly missing.
    case ConstraintCheckUnexpectedNull( message:String )

    /// A failed constraint where an exception occurred during the constrant check.
    case ConstraintCheckUnexpectedException( message:String, error:ErrorType )

    /// A composite constraint check.
    case ConstraintCheckComposite( message:String, checks:[ConstraintCheckResult] )


    /// Determines the success of a constrant check result
    public var isSuccess: Bool {
        get {
            switch self {
                case .ConstraintCheckSuccess:
                    return true
                case let .ConstraintCheckComposite( _, checks ):
                    for check in checks {
                        if !check.isSuccess {
                            return false
                        }
                    }
                    return true
                default:
                    return false
            }
        }
    }

    /// Gets the message for a constraint check result.
    public var message: String {
        get {
            switch self {
                case let .ConstraintCheckSuccess( message ):
                    return message
                case let .ConstraintCheckFailure( message ):
                    return message
                case let .ConstraintCheckUnexpectedNull( message ):
                    return message
                case let .ConstraintCheckUnexpectedException( message, _ ):
                    return message
                case let .ConstraintCheckComposite( message, _ ):
                    return message
            }
        }
    }

    /// Count of the number of failed checks in this possibly composite result.
    public var failureCount : Int {
        get {
            switch self {
                case .ConstraintCheckSuccess( _ ):
                    return 0
                case let .ConstraintCheckComposite( _, checks ):
                    return checks.reduce( 0, combine: { (count:Int,constraint:ConstraintCheckResult) -> Int in count + constraint.failureCount } )
                default:
                    return 1
            }
        }
    }

    /// Count of the number of successful checks in this possibly composite result.
    public var successCount : Int {
        get {
            switch self {
                case .ConstraintCheckSuccess( _ ):
                    return 1
                case let .ConstraintCheckComposite( _, checks ):
                    return checks.reduce( 0, combine: { (count:Int,constraint:ConstraintCheckResult) -> Int in count + constraint.successCount } )
                default:
                    return 0
            }
        }
    }

}
