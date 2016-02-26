//
// Barlom package manifest.
//

import PackageDescription

let package = Package(
    name: "Barlom",
    targets: [
        Target(
            name: "barlom_metamodel",
            dependencies: [
                .Target( name: "flightgear" )
            ]
        ),
        Target(
            name: "barlom_metamodel_api",
            dependencies: [
                .Target( name: "flightgear" )
            ]
        ),
        Target(
            name: "flightgauge"
        ),
        Target(
            name: "flightgear",
            dependencies: [
            ]
        ),
        Target(
            name: "flightgear_specs",
            dependencies: [
                .Target( name: "flightgauge" ),
                .Target( name: "flightgear" ),
                .Target( name: "flightspec" )
            ]
        ),
        Target(
            name: "flightspec",
            dependencies: [
                .Target( name: "flightgauge" )
            ]
        ),
        Target(
            name: "flightyear"
        ),
        Target(
            name: "main",
            dependencies: [
                .Target( name: "barlom_metamodel" ),
                .Target( name: "barlom_metamodel_api" ),
                .Target( name: "flightgauge" ),
                .Target( name: "flightgear" ),
                .Target( name: "flightgear_specs" ),
                .Target( name: "flightspec" ),
                .Target( name: "flightyear" )
            ]
        )
    ],
    dependencies: [
    ]
)


