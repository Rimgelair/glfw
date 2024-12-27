project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "off"
	warnings "off"

    targetdir("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
    objdir("%{wks.location}/bin/int" .. OutputDir .. "/%{prj.name}")

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",

        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/internal.h",
        "src/platform.h",
        "src/vulkan.h",
        "src/window.c",
        "src/egl_context.c",
        "src/osmesa_context.c",

        "src/null_platform.h",
        "src/null_joystick.h",
        "src/null_init.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c",
    }

	filter "system:macosx"
		pic "On"

		files
		{
            "src/cocoa_platform.h",
            "src/cocoa_joystick.h",
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/nsgl_context.m",
		}

		defines
		{
			"_GLFW_COCOA"
		}

   filter "configurations:Debug"
        defines { "DEBUG", "TZ_DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "TZ_RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "TZ_DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"
