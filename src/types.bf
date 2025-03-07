/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

using System;
using System.Interop;

namespace cglm_Beef;

extension cglm
{
	typealias FILE 			= void*;
	typealias char 			= c_char;
	typealias size_t 		= uint32;
	typealias uint32_t		= uint32;

	typealias ivec2         = int[2];
	typealias ivec3         = int[3];
	typealias ivec4         = int[4];

	typealias vec2          = float[2];
	typealias vec3          = float[3];
	typealias vec4          = float[4];

	typealias versor        = vec4; /* |x, y, z, w| -> w is the last */

	typealias mat2          = vec2[2];
	typealias mat2x3        = vec3[2]; /* [col (2), row (3)] */
	typealias mat2x4        = vec4[2]; /* [col (2), row (4)] */

	typealias mat3          = vec3[3];
	typealias mat3x2        = vec2[3]; /* [col (3), row (2)] */
	typealias mat3x4        = vec4[3]; /* [col (3), row (4)] */

	typealias mat4          = vec4[4];
	typealias mat4x2        = vec2[4]; /* [col (4), row (2)] */
	typealias mat4x3        = vec3[4]; /* [col (4), row (3)] */

	/*
	Important: cglm stores quaternion as [x, y, z, w] in memory since v0.4.0 
	it was [w, x, y, z] before v0.4.0 ( v0.3.5 and earlier ). w is real part.
	*/

	const float GLM_E         = 2.71828182845904523536028747135266250f; /* e           */
	const float GLM_LOG2E     = 1.44269504088896340735992468100189214f; /* log2(e)     */
	const float GLM_LOG10E    = 0.434294481903251827651128918916605082f; /* log10(e)    */
	const float GLM_LN2       = 0.693147180559945309417232121458176568f; /* loge(2)     */
	const float GLM_LN10      = 2.30258509299404568401799145468436421f; /* loge(10)    */
	const float GLM_PI        = 3.14159265358979323846264338327950288f; /* pi          */
	const float GLM_PI_2      = 1.57079632679489661923132169163975144f; /* pi/2        */
	const float GLM_PI_4      = 0.785398163397448309615660845819875721f; /* pi/4        */
	const float GLM_1_PI      = 0.318309886183790671537767526745028724f; /* 1/pi        */
	const float GLM_2_PI      = 0.636619772367581343075535053490057448f; /* 2/pi        */
	const float GLM_2_SQRTPI  = 1.12837916709551257389615890312154517f; /* 2/sqrt(pi)  */
	const float GLM_SQRT2     = 1.41421356237309504880168872420969808f; /* sqrt(2)     */
	const float GLM_SQRT1_2   = 0.707106781186547524400844362104849039f; /* 1/sqrt(2)   */

	const float GLM_Ef        = (.)GLM_E;
	const float GLM_LOG2Ef    = (.)GLM_LOG2E;
	const float GLM_LOG10Ef   = (.)GLM_LOG10E;
	const float GLM_LN2f      = (.)GLM_LN2;
	const float GLM_LN10f     = (.)GLM_LN10;
	const float GLM_PIf       = (.)GLM_PI;
	const float GLM_PI_2f     = (.)GLM_PI_2;
	const float GLM_PI_4f     = (.)GLM_PI_4;
	const float GLM_1_PIf     = (.)GLM_1_PI;
	const float GLM_2_PIf     = (.)GLM_2_PI;
	const float GLM_2_SQRTPIf = (.)GLM_2_SQRTPI;
	const float GLM_SQRT2f    = (.)GLM_SQRT2;
	const float GLM_SQRT1_2f  = (.)GLM_SQRT1_2;
}