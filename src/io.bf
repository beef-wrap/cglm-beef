/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

using System;
using System.Interop;

namespace cglm;

extension cglm
{
  /*
  cglm tried to enable print functions in debug mode and disable them in
  release/production mode to eliminate printing costs.
  
  if you need to force enable then define CGLM_DEFINE_PRINTS macro not DEBUG one
  
  Print functions are enabled if:
  
  - DEBUG or _DEBUG macro is defined (mostly defined automatically in debugging)
  - CGLM_DEFINE_PRINTS macro is defined including release/production
	which makes enabled printing always
  - glmc_ calls for io are always prints

  */

  /* DEPRECATED: CGLM_NO_PRINTS_NOOP (use CGLM_DEFINE_PRINTS) */

  // #if !defined(NDEBUG) \
  //   || defined(CGLM_DEFINE_PRINTS) || defined(CGLM_LIB_SRC) \
  //   || defined(CGLM_NO_PRINTS_NOOP)

// #ifndef CGLM_PRINT_PRECISION
// #  define CGLM_PRINT_PRECISION    5
// #endif

// #ifndef CGLM_PRINT_MAX_TO_SHORT
// #  define CGLM_PRINT_MAX_TO_SHORT 1e5f
// #endif

// #ifndef GLM_TESTS_NO_COLORFUL_OUTPUT
// #  ifndef CGLM_PRINT_COLOR
// #    define CGLM_PRINT_COLOR        "\033[36m"
// #  endif
// #  ifndef CGLM_PRINT_COLOR_RESET
// #    define CGLM_PRINT_COLOR_RESET  "\033[0m"
// #  endif
// #else
// #  ifndef CGLM_PRINT_COLOR
// #    define CGLM_PRINT_COLOR
// #  endif
// #  ifndef CGLM_PRINT_COLOR_RESET
// #    define CGLM_PRINT_COLOR_RESET
// #  endif
// #endif

	/*!
	* @brief prints current SIMD path in general
	*
	* @param[in] ostream    stream to print e.g. stdout, stderr, FILE ...
	*/
	[CLink] public static extern void glm_arch_print(FILE* ostream);

	/*!
	* @brief prints current SIMD path in general
	*
	* @param[in] ostream    stream to print e.g. stdout, stderr, FILE ...
	*/
	[CLink] public static extern void glm_arch_print_name(FILE* ostream);

	[CLink] public static extern void glm_mat4_print(mat4 matrix, FILE* ostream);

	[CLink] public static extern void glm_mat3_print(mat3 matrix, FILE* ostream);

	[CLink] public static extern void glm_mat2_print(mat2 matrix, FILE* ostream);

	[CLink] public static extern void glm_vec4_print(vec4 vec, FILE* ostream);

	[CLink] public static extern void glm_ivec4_print(ivec4 vec, FILE* ostream);

	[CLink] public static extern void glm_vec3_print(vec3 vec, FILE* ostream);

	[CLink] public static extern void glm_ivec3_print(ivec3 vec, FILE* ostream);

	[CLink] public static extern void glm_vec2_print(vec2 vec, FILE* ostream);

	[CLink] public static extern void glm_ivec2_print(ivec2 vec, FILE* ostream);

	[CLink] public static extern void glm_versor_print(versor vec, FILE* ostream);

	[CLink] public static extern void glm_aabb_print(vec3[2] bbox, char* tag, FILE* ostream);

	/* NOOP: Remove print from DEBUG */
	// #define glm_mat4_print(v, s) (void)v; (void)s;
	// #define glm_mat3_print(v, s) (void)v; (void)s;
	// #define glm_mat2_print(v, s) (void)v; (void)s;
	// #define glm_vec4_print(v, s) (void)v; (void)s;
	// #define glm_ivec4_print(v, s) (void)v; (void)s;
	// #define glm_vec3_print(v, s) (void)v; (void)s;
	// #define glm_ivec3_print(v, s) (void)v; (void)s;
	// #define glm_vec2_print(v, s) (void)v; (void)s;
	// #define glm_ivec2_print(v, s) (void)v; (void)s;
	// #define glm_versor_print(v, s) (void)v; (void)s;
	// #define glm_aabb_print(v, t, s) (void)v; (void)t; (void)s;
	// #define glm_arch_print(s) (void)s;
	// #define glm_arch_print_name(s) (void)s;
}