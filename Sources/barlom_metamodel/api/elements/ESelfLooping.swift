//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Flag for the allowed self-loops of an edge type.
///
public enum ESelfLooping {

    /// An abstract edge type is not constrained for self looping.
    case SelfLoopsUnconstrained

    /// An edge type does not allow self loops.
    case SelfLoopsNotAllowed

    /// An edge type does allow self loops.
    case SelfLoopsAllowed

    /// Determines whether this self looping is allowed.
    public var isAllowed: Bool? {
        get {
            switch self {
                case SelfLoopsAllowed: return true
                case SelfLoopsNotAllowed: return false
                case SelfLoopsUnconstrained: return nil
            }
        }
    }

    /// Determines whether this self looping is not allowed.
    public var isNotAllowed: Bool? {
        get {
            switch self {
                case SelfLoopsAllowed: return false
                case SelfLoopsNotAllowed: return true
                case SelfLoopsUnconstrained: return nil
            }
        }
    }

    /// Determines whether this self looping is unconstrained.
    public var isUnconstrained: Bool {
        get {
            return self == SelfLoopsUnconstrained
        }
    }

    /// Constructs a new self looping from a boolean value (true = allowed, false = not allowed, nil = unconstrained).
    public static func fromBool( isAcyclic value: Bool? ) -> ESelfLooping {
        if let value = value {
            return value ? SelfLoopsAllowed : SelfLoopsNotAllowed
        }
        return SelfLoopsUnconstrained
    }

}
