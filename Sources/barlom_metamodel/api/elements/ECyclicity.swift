///
/// Flag for the allowed cyclicity of an edge type.
///

public enum ECyclicity {

  /// An abstract edge type is not constrained for cyclicity.
  case CyclicityUnconstrained

  /// An edge type does not allow cycles.
  case Acyclic

  /// An edge type does allow cycles.
  case PotentiallyCyclic

  /// Determines whether this cyclicity is acyclic.
  var isAcyclic: Bool? {
    get {
      switch self {
        case Acyclic: return true
        case PotentiallyCyclic: return false
        case CyclicityUnconstrained: return nil
      }
    }
  }

  /// Determines whether this cyclicity is potentially cyclic.
  var isPotentiallyCyclic: Bool? {
    get {
      switch self {
        case Acyclic: return false
        case PotentiallyCyclic: return true
        case CyclicityUnconstrained: return nil
      }
    }
  }

  /// Determines whether this cyclicity is unconstrained.
  var isUnconstrained: Bool {
    get {
      return self == CyclicityUnconstrained
    }
  }

  /// Constructs a new cyclicity from a boolean value (true = acyclic, false = potentially cyclic, nil = unconstrained).
  static func fromBool( isAcyclic value: Bool? ) -> ECyclicity {
    if let value = value {
      return value ? Acyclic : PotentiallyCyclic
    }
    return CyclicityUnconstrained
  }

}