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
	/*!
	* @brief translate existing 2d transform matrix by v vector
	*        and stores result in same matrix
	*
	* @param[in, out]  m  affine transform
	* @param[in]       v  translate vector [x, y]
	*/
	[CLink] public static extern void glm_translate2d(mat3 m, vec2 v);

	/*!
	* @brief translate existing 2d transform matrix by v vector
	*        and store result in dest
	*
	* source matrix will remain same
	*
	* @param[in]  m    affine transform
	* @param[in]  v    translate vector [x, y]
	* @param[out] dest translated matrix
	*/
	[CLink] public static extern void glm_translate2d_to(mat3 m, vec2 v, mat3 dest);

	/*!
	* @brief translate existing 2d transform matrix by x factor
	*
	* @param[in, out]  m  affine transform
	* @param[in]       x  x factor
	*/
	[CLink] public static extern void glm_translate2d_x(mat3 m, float x);

	/*!
	* @brief translate existing 2d transform matrix by y factor
	*
	* @param[in, out]  m  affine transform
	* @param[in]       y  y factor
	*/
	[CLink] public static extern void glm_translate2d_y(mat3 m, float y);

	/*!
	* @brief creates NEW translate 2d transform matrix by v vector
	*
	* @param[out]  m  affine transform
	* @param[in]   v  translate vector [x, y]
	*/
	[CLink] public static extern void glm_translate2d_make(mat3 m, vec2 v);

	/*!
	* @brief scale existing 2d transform matrix by v vector
	*        and store result in dest
	*
	* @param[in]  m    affine transform
	* @param[in]  v    scale vector [x, y]
	* @param[out] dest scaled matrix
	*/
	[CLink] public static extern void glm_scale2d_to(mat3 m, vec2 v, mat3 dest);

	/*!
	* @brief creates NEW 2d scale matrix by v vector
	*
	* @param[out]  m  affine transform
	* @param[in]   v  scale vector [x, y]
	*/
	[CLink] public static extern void glm_scale2d_make(mat3 m, vec2 v);

	/*!
	* @brief scales existing 2d transform matrix by v vector
	*        and stores result in same matrix
	*
	* @param[in, out]  m  affine transform
	* @param[in]       v  scale vector [x, y]
	*/
	[CLink] public static extern void glm_scale2d(mat3 m, vec2 v);

	/*!
	* @brief applies uniform scale to existing 2d transform matrix v = [s, s]
	*        and stores result in same matrix
	*
	* @param[in, out]  m  affine transform
	* @param[in]       s  scale factor
	*/
	[CLink] public static extern void glm_scale2d_uni(mat3 m, float s);

	/*!
	* @brief creates NEW rotation matrix by angle around Z axis
	*
	* @param[out] m     affine transform
	* @param[in]  angle angle (radians)
	*/
	[CLink] public static extern void glm_rotate2d_make(mat3 m, float angle);

	/*!
	* @brief rotate existing 2d transform matrix around Z axis by angle
	*         and store result in same matrix
	*
	* @param[in, out]  m      affine transform
	* @param[in]       angle  angle (radians)
	*/
	[CLink] public static extern void glm_rotate2d(mat3 m, float angle);

	/*!
	* @brief rotate existing 2d transform matrix around Z axis by angle
	*        and store result in dest
	*
	* @param[in]  m      affine transform
	* @param[in]  angle  angle (radians)
	* @param[out] dest   destination
	*/
	[CLink] public static extern void glm_rotate2d_to(mat3 m, float angle, mat3 dest);
}