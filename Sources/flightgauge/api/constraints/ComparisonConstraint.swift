//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

///
/// Typical higher order constraint that produces standard messages for comparing an actual and comparable value.
///
public class ComparisonConstraint<T>
    : AdjectivalConstraint<T> {

    public required init(
        checkCondition: ( T ) throws -> Bool,
        comparisonText: String,
        comparableValue: T
    ) {
        let adjective: String = "\( comparisonText ) \( comparableValue )";

        super.init( checkCondition: checkCondition, adjective: adjective )
    }
}

