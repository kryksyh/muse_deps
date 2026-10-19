set(DEP_KIND source)

function(tracktion_add_to_build)
    if(TARGET tracktion::tracktion_engine)
        return()
    endif()

    get_property(_src GLOBAL PROPERTY tracktion_SOURCE_DIR)
    add_subdirectory("${_src}/juce" "${CMAKE_BINARY_DIR}/tracktion/juce" EXCLUDE_FROM_ALL)
    add_subdirectory("${_src}/tracktion_engine/modules" "${CMAKE_BINARY_DIR}/tracktion/modules" EXCLUDE_FROM_ALL)

    if(APPLE)
        set(_license_destination audacity.app/Contents/Resources/licenses/tracktion)
    else()
        set(_license_destination licenses/tracktion)
    endif()
    install(FILES "${_src}/tracktion_engine/LICENSE.md" DESTINATION "${_license_destination}")
    install(FILES "${_src}/juce/LICENSE.md" DESTINATION "${_license_destination}/juce")
    install(DIRECTORY "${_src}/rubberband/" DESTINATION "${_license_destination}/rubberband"
        FILES_MATCHING PATTERN "COPYING*" PATTERN "LICENSE*" PATTERN "LICENCE*")
    install(DIRECTORY "${_src}/tracktion_engine/modules/" DESTINATION "${_license_destination}/modules"
        FILES_MATCHING PATTERN "LICENSE*" PATTERN "LICENCE*" PATTERN "COPYING*" PATTERN "*Licence*" PATTERN "*License*")
    install(DIRECTORY "${_src}/juce/modules/" DESTINATION "${_license_destination}/juce/modules"
        FILES_MATCHING PATTERN "LICENSE*" PATTERN "LICENCE*" PATTERN "COPYING*" PATTERN "*Licence*" PATTERN "*License*")
endfunction()
