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

namespace cglm;

extension cglm
{
	/*!
	* @brief translate existing transform matrix by v vector
	*        and stores result in same matrix
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in, out]  m  affine transform
	* @param[in]       v  translate vector [x, y, z]
	*/
	[CLink] public static extern void glm_translated(mat4 m, vec3 v);

	/*!
	* @brief translate existing transform matrix by v vector
	*        and store result in dest
	*
	* source matrix will remain same
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in]  m    affine transform
	* @param[in]  v    translate vector [x, y, z]
	* @param[out] dest translated matrix
	*/
	[CLink] public static extern void glm_translated_to(mat4 m, vec3 v, mat4 dest);

	/*!
	* @brief translate existing transform matrix by x factor
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in, out]  m  affine transform
	* @param[in]       x  x factor
	*/
	[CLink] public static extern void glm_translated_x(mat4 m, float x);

	/*!
	* @brief translate existing transform matrix by y factor
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in, out]  m  affine transform
	* @param[in]       y  y factor
	*/
	[CLink] public static extern void glm_translated_y(mat4 m, float y);

	/*!
	* @brief translate existing transform matrix by z factor
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in, out]  m  affine transform
	* @param[in]       z  z factor
	*/
	[CLink] public static extern void glm_translated_z(mat4 m, float z);

	/*!
	* @brief rotate existing transform matrix around X axis by angle
	*        and store result in dest
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in]   m      affine transform
	* @param[in]   angle  angle (radians)
	* @param[out]  dest   rotated matrix
	*/
	[CLink] public static extern void glm_rotated_x(mat4 m, float angle, mat4 dest);

	/*!
	* @brief rotate existing transform matrix around Y axis by angle
	*        and store result in dest
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in]   m      affine transform
	* @param[in]   angle  angle (radians)
	* @param[out]  dest   rotated matrix
	*/
	[CLink] public static extern void glm_rotated_y(mat4 m, float angle, mat4 dest);

	/*!
	* @brief rotate existing transform matrix around Z axis by angle
	*        and store result in dest
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in]   m      affine transform
	* @param[in]   angle  angle (radians)
	* @param[out]  dest   rotated matrix
	*/
	[CLink] public static extern void glm_rotated_z(mat4 m, float angle, mat4 dest);

	/*!
	* @brief rotate existing transform matrix around given axis by angle
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in, out]  m      affine transform
	* @param[in]       angle  angle (radians)
	* @param[in]       axis   axis
	*/
	[CLink] public static extern void glm_rotated(mat4 m, float angle, vec3 axis);

	/*!
	* @brief rotate existing transform
	*        around given axis by angle at given pivot point (rotation center)
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in, out]  m      affine transform
	* @param[in]       pivot  rotation center
	* @param[in]       angle  angle (radians)
	* @param[in]       axis   axis
	*/
	[CLink] public static extern void glm_rotated_at(mat4 m, vec3 pivot, float angle, vec3 axis);

	/*!
	* @brief rotate existing transform matrix around given axis by angle around self (doesn't affected by position)
	*
	*  this is POST transform, applies to existing transform as last transform
	*
	* @param[in, out]  m      affine transform
	* @param[in]       angle  angle (radians)
	* @param[in]       axis   axis
	*/
	[CLink] public static extern void glm_spinned(mat4 m, float angle, vec3 axis);
}