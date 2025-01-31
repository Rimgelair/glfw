project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "off"
	warnings "off"

    targetdir("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
    objdir("%{wks.location}/bin/int" .. OutputDir .. "/%{prj.name}")

    files {
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
        "src/platform.c",
        "src/null_init.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c"
    }

    includedirs {
        "include"
    }

    filter "system:windows"
        systemversion "latest"
        
        files {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_module.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines { 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "system:macosx"
        systemversion "latest"
        
        files {
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/cocoa_time.c",
            "src/posix_thread.c",
            "src/posix_module.c",
            "src/nsgl_context.m",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines { 
            "_GLFW_COCOA"
        }

		links
		{
		  "Cocoa.framework",
		  "OpenGL.framework",
		  "IOKit.framework",
		  "CoreFoundation.framework",
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
