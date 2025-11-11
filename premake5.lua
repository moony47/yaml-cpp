project "yaml-cpp"
    kind "StaticLib"
    language "C++"
    staticruntime "On"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/**.h",
        "src/**.cpp",

        "include/**.h"
    }

    includedirs {
        "include"
    }

    defines {
        "YAML_CPP_STATIC_DEFINE"
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++23"
        buildoptions {
            "/MP"
        }
        
    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++23"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"