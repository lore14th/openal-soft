project "openal-soft"
	kind "StaticLib"
	language "C++"
	cppdialect "c++17"
	staticruntime "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs
	{
		"",
		"include",
		"common",
		"alc"
	}

	files
	{
		"config.h",
		"version.h",
		"hrtf_default.h",

		"common/alcomplex.cpp",
		"common/alcomplex.h",
		"common/alfstream.cpp",
		"common/alfstream.h",
		"common/almalloc.cpp",
		"common/almalloc.h",
		"common/alstring.cpp",
		"common/alstring.h",
		"common/dynload.cpp",
		"common/dynload.h",
		"common/polyphase_resampler.cpp",
		"common/polyphase_resampler.h",
		"common/ringbuffer.cpp",
		"common/ringbuffer.h",
		"common/strutils.cpp",
		"common/strutils.h",
		"common/threads.cpp",
		"common/threads.h",

		"common/alspan.h",

		"al/auxeffectslot.cpp",
		"al/auxeffectslot.h",
		"al/buffer.cpp",
		"al/buffer.h",
		"al/effect.cpp",
		"al/effect.h",
		"al/error.cpp",
		"al/error.h",
		"al/event.cpp",
		"al/event.h",
		"al/extension.cpp",
		"al/extension.h",
		"al/filter.cpp",
		"al/filter.h",
		"al/listener.cpp",
		"al/listener.h",
		"al/source.cpp",
		"al/source.h",
		"al/state.cpp",

		"al/al.h",
		"al/alc.h",
		"al/efx.h",

		"alc/alc.cpp",
		"alc/alu.cpp",
		"alc/alu.h",
		"alc/alconfig.cpp",
		"alc/alconfig.h",
		"alc/bformatdec.cpp",
		"alc/bformatdec.h",
		"alc/buffer_storage.cpp",
		"alc/buffer_storage.h",
		"alc/converter.cpp",
		"alc/converter.h",
		"alc/effectslot.cpp",
		"alc/effectslot.h",
		"alc/helpers.cpp",
		"alc/hrtf.cpp",
		"alc/hrtf.h",
		"alc/panning.cpp",
		"alc/uiddefs.cpp",
		"alc/voice.cpp",
		"alc/voice.h",
		"alc/backends/base.cpp",
		"alc/backends/base.h",
		"alc/backends/loopback.cpp",
		"alc/backends/loopback.h",
		"alc/backends/winmm.cpp",
		"alc/backends/winmm.h",
		"alc/backends/dsound.cpp",
		"alc/backends/dsound.h",
		"alc/backends/wasapi.cpp",
		"alc/backends/wasapi.h",
		"alc/backends/wave.cpp",
		"alc/backends/wave.h",
		"alc/backends/null.cpp",
		"alc/backends/null.h",

		"core/ambdec.cpp",
		"core/ambdec.h",
		"core/bs2b.cpp",
		"core/bs2b.h",
		"core/bsinc_tables.cpp",
		"core/bsinc_tables.h",
		"core/cpu_caps.cpp",
		"core/cpu_caps.h",
		"core/devformat.cpp",
		"core/devformat.h",
		"core/except.cpp",
		"core/except.h",
		"core/filters/biquad.cpp",
		"core/filters/biquad.h",
		"core/filters/nfc.cpp",
		"core/filters/nfc.h",
		"core/filters/splitter.cpp",
		"core/filters/splitter.h",
		"core/fmt_traits.cpp",
		"core/fmt_traits.h",
		"core/fpu_ctrl.cpp",
		"core/fpu_ctrl.h",
		"core/logging.cpp",
		"core/logging.h",
		"core/mastering.cpp",
		"core/mastering.h",
		"core/uhjfilter.cpp",
		"core/uhjfilter.h",
		"core/mixer/mixer_c.cpp",
		"core/mixer/mixer_sse.cpp",
		"core/mixer/mixer_sse2.cpp",
		"core/mixer/mixer_sse3.cpp",
		"core/mixer/mixer_sse41.cpp",

		"core/ambidefs.h",

		"alc/effects/autowah.cpp",
		"alc/effects/chorus.cpp",
		"alc/effects/compressor.cpp",
		"alc/effects/convolution.cpp",
		"alc/effects/dedicated.cpp",
		"alc/effects/distortion.cpp",
		"alc/effects/echo.cpp",
		"alc/effects/equalizer.cpp",
		"alc/effects/fshifter.cpp",
		"alc/effects/modulator.cpp",
		"alc/effects/null.cpp",
		"alc/effects/pshifter.cpp",
		"alc/effects/reverb.cpp",
		"alc/effects/vmorpher.cpp",

		"al/effects/autowah.cpp",
		"al/effects/chorus.cpp",
		"al/effects/compressor.cpp",
		"al/effects/convolution.cpp",
		"al/effects/dedicated.cpp",
		"al/effects/distortion.cpp",
		"al/effects/echo.cpp",
		"al/effects/equalizer.cpp",
		"al/effects/fshifter.cpp",
		"al/effects/modulator.cpp",
		"al/effects/null.cpp",
		"al/effects/pshifter.cpp",
		"al/effects/reverb.cpp",
		"al/effects/vmorpher.cpp",
	}

	excludes
	{
		"alc/mixer/mixer_neon.cpp"
	}

	defines
	{
		"AL_LIBTYPE_STATIC",
		"RESTRICT=__restrict",
		"_GNU_SOURCE"
	}

	disablewarnings { "5030", "4065", "4834" }
	
	filter "system:windows"
		systemversion "latest"

		defines
		{
			"WIN32",
			"_WINDOWS",
			"AL_BUILD_LIBRARY",
			"AL_ALEXT_PROTOTYPES",
			"_WIN32",
			"_WIN32_WINNT=0x0502",
			"_CRT_SECURE_NO_WARNINGS",
			"NOMINMAX",
			--"CMAKE_INTDIR=\"Debug\"",
			"OpenAL_EXPORTS"
		}

		links
		{
			"winmm"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "On"

	filter "configurations:Distribution"
		runtime "Release"
		optimize "On"
		symbols "Off"