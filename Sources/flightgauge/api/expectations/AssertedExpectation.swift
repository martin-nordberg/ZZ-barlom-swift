//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Adapter class wraps an expectation and throws an assertion if it fails when checked.
///
public class AssertedExpectation<T> {

    private let _expectation: AnyExpectation<T>

    private let _file: StaticString

    private let _line: UInt

    init( _ expectation: AnyExpectation<T>, _ file: StaticString, _ line: UInt ) {
        self._expectation = expectation;
        self._file = file
        self._line = line
    }

    /// Performs a constraint check, giving back a constraint check result.
    public func toBe( @autoclosure constraint: () -> AnyConstraint<T> ) {
#if !NDEBUG
        let result = _expectation.toBe( constraint() );

        if ( !result.isSuccess ) {
            fatalError( result.message, file: self._file, line: self._line );
        }
#endif
    }

    /// Performs a constraint check if a value exists; gives back a constraint check result,
    /// succeeding if the tested actual value does not exist."
    public func toOptionallyBe( @autoclosure constraint: () -> AnyConstraint<T> ) {
#if !NDEBUG
        let result = _expectation.toOptionallyBe( constraint() );

        if ( !result.isSuccess ) {
            fatalError( result.message, file: self._file, line: self._line );
        }
#endif
    }

    /// Performs a constraint check on a value that is expected to not exist.
    public func toNotExist() {
#if !NDEBUG
        let result = _expectation.toNotExist();

        if ( !result.isSuccess ) {
            fatalError( result.message );
        }
#endif
    }
}

//---------------------------------------------------------------------------------------------------------------------
