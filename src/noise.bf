/*
* Copyright (c), Recep Aslantas.
*
* MIT License (MIT), http://opensource.org/licenses/MIT
* Full license can be found in the LICENSE file
*
* Based on the work of Stefan Gustavson and Ashima Arts on "webgl-noise":
* https://github.com/stegu/webgl-noise
* Following Stefan Gustavson's paper "Simplex noise demystified":
* http://www.itn.liu.se/~stegu/simplexnoise/simplexnoise.pdf
* 
* Implementation based on glm::perlin function:
* https://github.com/g-truc/glm/blob/master/glm/gtc/noise.inl
*/

using System;
using System.Interop;

namespace cglm;

extension cglm
{
	/* ============================================================================
	 * Classic perlin noise
	 * ============================================================================
	 */

	/*!
	 * @brief Classic perlin noise
	 *
	 * @param[in]  point  4D vector
	 * @returns           perlin noise value
	 */
	[CLink] public static extern float glm_perlin_vec4(vec4 point);


	/*!
	 * @brief Classic perlin noise
	 *
	 * @param[in]  point  3D vector
	 * @returns           perlin noise value
	 */
	[CLink] public static extern float glm_perlin_vec3(vec3 point);

	/*!
	 * @brief Classic perlin noise
	 *
	 * @param[in]  point  2D vector
	 * @returns           perlin noise value
	 */
	[CLink] public static extern float glm_perlin_vec2(vec2 point);
}