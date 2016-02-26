//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Flag for the allowed multi-edges of an edge type.
///

public enum EMultiEdgedness {
    /// An abstract edge type is not constrained for multi-edgedness.
    case MultiEdgesUnconstrained

    /// An edge type does not allow multi-edges.
    case MultiEdgesNotAllowed

    /// An edge type does allow multi-edges.
    case MultiEdgesAllowed

    /// Determines whether this multi-edgedness is allowed.

    public var isAllowed: Bool? {
        get {
            switch self {
                case MultiEdgesAllowed: return true
                case MultiEdgesNotAllowed: return false
                case MultiEdgesUnconstrained: return nil
            }
        }
    }

    /// Determines whether this multi-edgedness is not allowed.

    public var isNotAllowed: Bool? {
        get {
            switch self {
                case MultiEdgesAllowed: return false
                case MultiEdgesNotAllowed: return true
                case MultiEdgesUnconstrained: return nil
            }
        }
    }

    /// Determines whether this multi-edgedness is unconstrained.

    public var isUnconstrained: Bool {
        get {
            return self == MultiEdgesUnconstrained
        }
    }

    /// Constructs a new multi-edgedness from a boolean value (true = allowed, false = not allowed, nil = unconstrained).
    public static func fromBool( isAcyclic value: Bool? ) -> EMultiEdgedness {
        if let value = value {
            return value ? MultiEdgesAllowed : MultiEdgesNotAllowed
        }
        return MultiEdgesUnconstrained
    }
}
