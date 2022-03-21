workspace "SDLGame"
    platforms { "Windows" }
    configurations { "Debug", "Release" }
    flags "MultiProcessorCompile"

project "SDLGame"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    
    targetdir "bin/%{cfg.system}-%{cfg.buildcfg}/%{cfg.architecture}"
    objdir "bin-int/%{cfg.system}-%{cfg.buildcfg}/%{cfg.architecture}"

    files { "src/**.cpp", "include/**.h", }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
    
    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
    

    filter "platforms:Windows"
        system "Windows"
        architecture "x86_64"


    filter "system:windows"
        system "Windows"

        includedirs { <SDL2 INCLUDE PATH> }
        libdirs { <SDL2 x64 LIB PATH> }

        links { "SDL2main", "SDL2" }
