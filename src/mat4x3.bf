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
	/*#define GLM_MAT4X3_ZERO_INIT {{0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f}, \
								  {0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f}}

	/* for C only */
	#define GLM_MAT4X3_ZERO GLM_MAT4X3_ZERO_INIT*/

	/*!
	 * @brief copy all members of [mat] to [dest]
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat4x3_copy(mat4x3 mat, mat4x3 dest);

	/*!
	 * @brief make given matrix zero.
	 *
	 * @param[in, out]  mat  matrix
	 */
	[CLink] public static extern void glm_mat4x3_zero(mat4x3 mat);

	/*!
	 * @brief Create mat4x3 matrix from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest matrix
	 */
	[CLink] public static extern void glm_mat4x3_make(float* src, mat4x3 dest);

	/*!
	 * @brief multiply m1 and m2 to dest
	 *
	 * @code
	 * glm_mat4x3_mul(mat4x3, mat3x4, mat3);
	 * @endcode
	 *
	 * @param[in]  m1   left matrix (mat4x3)
	 * @param[in]  m2   right matrix (mat3x4)
	 * @param[out] dest destination matrix (mat3)
	 */
	[CLink] public static extern void glm_mat4x3_mul(mat4x3 m1, mat3x4 m2, mat3 dest);

	/*!
	 * @brief multiply matrix with column vector and store in dest column vector
	 *
	 * @param[in]  m    matrix (left)
	 * @param[in]  v    vector (right, column vector)
	 * @param[out] dest result vector
	 */
	[CLink] public static extern void glm_mat4x3_mulv(mat4x3 m, vec4 v, vec3 dest);

	/*!
	 * @brief transpose matrix and store in dest
	 *
	 * @param[in]  m     matrix
	 * @param[out] dest  result
	 */
	[CLink] public static extern void glm_mat4x3_transpose(mat4x3 m, mat3x4 dest);

	/*!
	 * @brief scale (multiply with scalar) matrix
	 *
	 * multiply matrix with scalar
	 *
	 * @param[in, out] m matrix
	 * @param[in]    s scalar
	 */
	[CLink] public static extern void glm_mat4x3_scale(mat4x3 m, float s);
}