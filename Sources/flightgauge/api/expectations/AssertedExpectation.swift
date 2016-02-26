/// Adapter class wraps an expectation and throws an assertion if it fails when checked.

public class AssertedExpectation<T> {

    private let expectation: AnyExpectation<T>

    private let file: StaticString

    private let line: UInt

    init( _ expectation: AnyExpectation<T>, _ file: StaticString, _ line: UInt ) {
        self.expectation = expectation;
        self.file = file
        self.line = line
    }

    /// Performs a constraint check, giving back a constraint check result.
    public func toBe( @autoclosure constraint: () -> AnyConstraint<T> ) {
#if !NDEBUG
        let result = expectation.toBe( constraint() );

        if ( !result.isSuccess ) {
            fatalError( result.message, file: self.file, line: self.line );
        }
#endif
    }

    /// Performs a constraint check if a value exists; gives back a constraint check result,
    /// succeeding if the tested actual value does not exist."
    public func toOptionallyBe( @autoclosure constraint: () -> AnyConstraint<T> ) {
#if !NDEBUG
        let result = expectation.toOptionallyBe( constraint() );

        if ( !result.isSuccess ) {
            fatalError( result.message, file: self.file, line: self.line );
        }
#endif
    }

    /// Performs a constraint check on a value that is expected to not exist.
    public func toNotExist() {
#if !NDEBUG
        let result = expectation.toNotExist();

        if ( !result.isSuccess ) {
            fatalError( result.message );
        }
#endif
    }
}
