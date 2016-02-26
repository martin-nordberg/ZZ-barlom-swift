cmake_minimum_required(VERSION 3.4)
project(barlom)

add_custom_target(
        CLEAN rm -r .build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)

add_custom_target(
        BARLOM swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES Sources/main/main.swift
)