//
// Created by martin on 1/12/16.
//

import XCTest

class VertexSpec {

    func testName() {
        let v = Vertex( "the name" )
        XCTAssertEqual( v.name, "the name", "should have name initialized" )
    }

}
