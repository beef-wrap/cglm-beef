/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

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
	/*!
	* @brief creates NEW translate transform matrix by v vector
	*
	* @param[out]  m  affine transform
	* @param[in]   v  translate vector [x, y, z]
	*/
	[CLink] public static extern void glm_translate_make(mat4 m, vec3 v);

	/*!
	* @brief scale existing transform matrix by v vector
	*        and store result in dest
	*
	* @param[in]  m    affine transform
	* @param[in]  v    scale vector [x, y, z]
	* @param[out] dest scaled matrix
	*/
	[CLink] public static extern void glm_scale_to(mat4 m, vec3 v, mat4 dest);

	/*!
	* @brief creates NEW scale matrix by v vector
	*
	* @param[out]  m  affine transform
	* @param[in]   v  scale vector [x, y, z]
	*/
	[CLink] public static extern void glm_scale_make(mat4 m, vec3 v);

	/*!
	* @brief scales existing transform matrix by v vector
	*        and stores result in same matrix
	*
	* @param[in, out]  m  affine transform
	* @param[in]       v  scale vector [x, y, z]
	*/
	[CLink] public static extern void glm_scale(mat4 m, vec3 v);

	/*!
	* @brief applies uniform scale to existing transform matrix v = [s, s, s]
	*        and stores result in same matrix
	*
	* @param[in, out]  m  affine transform
	* @param[in]       s  scale factor
	*/
	[CLink] public static extern void glm_scale_uni(mat4 m, float s);

	/*!
	* @brief creates NEW rotation matrix by angle and axis
	*
	* axis will be normalized so you don't need to normalize it
	*
	* @param[out] m     affine transform
	* @param[in]  angle angle (radians)
	* @param[in]  axis  axis
	*/
	[CLink] public static extern void glm_rotate_make(mat4 m, float angle, vec3 axis);

	/*!
	* @brief decompose scale vector
	*
	* @param[in]  m  affine transform
	* @param[out] s  scale vector (Sx, Sy, Sz)
	*/
	[CLink] public static extern void glm_decompose_scalev(mat4 m, vec3 s);

	/*!
	* @brief returns true if matrix is uniform scaled. This is helpful for
	*        creating normal matrix.
	*
	* @param[in] m m
	*
	* @return boolean
	*/
	[CLink] public static extern bool glm_uniscaled(mat4 m);

	/*!
	* @brief decompose rotation matrix (mat4) and scale vector [Sx, Sy, Sz]
	*        DON'T pass projected matrix here
	*
	* @param[in]  m affine transform
	* @param[out] r rotation matrix
	* @param[out] s scale matrix
	*/
	[CLink] public static extern void glm_decompose_rs(mat4 m, mat4 r, vec3 s);

	/*!
	* @brief decompose affine transform, TODO: extract shear factors.
	*        DON'T pass projected matrix here
	*
	* @param[in]  m affine transform
	* @param[out] t translation vector
	* @param[out] r rotation matrix (mat4)
	* @param[out] s scaling vector [X, Y, Z]
	*/
	[CLink] public static extern void glm_decompose(mat4 m, vec4 t, mat4 r, vec3 s);
}