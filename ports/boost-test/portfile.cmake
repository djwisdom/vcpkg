# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/test
    REF boost-${VERSION}
    SHA512 e9ec6fca96e580789d7c58f77fc3a6895a3e5bef43bb4cc5f021503c03e5ec13fb448b01a0dc66c55aa6d9242fa26701085930e87ddcd83e00e0ccec44b8a5a0
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "release")
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/manual-link")
    file(GLOB MONITOR_LIBS ${CURRENT_PACKAGES_DIR}/lib/*_exec_monitor*)
    file(COPY ${MONITOR_LIBS} DESTINATION "${CURRENT_PACKAGES_DIR}/lib/manual-link")
    file(REMOVE ${MONITOR_LIBS})
endif()

if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "debug")
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/lib/manual-link")
    file(GLOB DEBUG_MONITOR_LIBS ${CURRENT_PACKAGES_DIR}/debug/lib/*_exec_monitor*)
    file(COPY ${DEBUG_MONITOR_LIBS} DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib/manual-link")
    file(REMOVE ${DEBUG_MONITOR_LIBS})
endif()
