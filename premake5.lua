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

        includedirs { "vendor/SDL2/include/" }
        libdirs { "vendor/SDL2/lib/x64/" }

        links { "SDL2main", "SDL2" }
