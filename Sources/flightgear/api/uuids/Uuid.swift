//
// (C) Copyright 2016 Martin E. Nordberg III
// Apache 2.0 License
//

//---------------------------------------------------------------------------------------------------------------------

///
/// Simple UUID class.
///
public class Uuid: Equatable, CustomStringConvertible {

    /// The sixteen bytes of the UUID.
    private let bytes: [UInt8]

    ///
    /// Initializes a UUID from a string of the form 00112233-4455-6677-8899-AABBCCDDEEFF.
    ///
    /// @param value the UUID in standard hex string form
    ///
    public init( _ value: String ) {
        var theBytes: [UInt8] = []

        // 00112233
        var start = value.startIndex
        var end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        // -4455
        start = end.advancedBy( 1 )
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        // -6677
        start = end.advancedBy( 1 )
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        // -8899
        start = end.advancedBy( 1 )
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        // -AABBCCDDEEFF
        start = end.advancedBy( 1 )
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        start = end
        end = start.advancedBy( 2 )
        theBytes.append( UInt8( value[start ..< end], radix: 16 )! )

        self.bytes = theBytes
    }

    ///
    /// Converts a UUID to a string of the form 00112233-4455-6677-8899-AABBCCDDEEFF.
    ///
    public var description: String {
        get {
            return self.byteToHex( self.bytes[0] ) +
                self.byteToHex( self.bytes[1] ) +
                self.byteToHex( self.bytes[2] ) +
                self.byteToHex( self.bytes[3] ) + "-" +
                self.byteToHex( self.bytes[4] ) +
                self.byteToHex( self.bytes[5] ) + "-" +
                self.byteToHex( self.bytes[6] ) +
                self.byteToHex( self.bytes[7] ) + "-" +
                self.byteToHex( self.bytes[8] ) +
                self.byteToHex( self.bytes[9] ) + "-" +
                self.byteToHex( self.bytes[10] ) +
                self.byteToHex( self.bytes[11] ) +
                self.byteToHex( self.bytes[12] ) +
                self.byteToHex( self.bytes[13] ) +
                self.byteToHex( self.bytes[14] ) +
                self.byteToHex( self.bytes[15] )
        }
    }

    /// Converts a byte to its hex representation
    private func byteToHex( byte: UInt8 ) -> String {
        let result = String(byte, radix: 16, uppercase: true)
        if ( byte < 16 ) {
            return "0" + result
        }
        return result
    }

}

//---------------------------------------------------------------------------------------------------------------------

///
/// Checks whether two UUIDs are the same.
///
public func ==( lhs: Uuid, rhs: Uuid ) -> Bool {
    return lhs.bytes == rhs.bytes
}

//---------------------------------------------------------------------------------------------------------------------


