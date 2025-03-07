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
	/*#define GLM_MAT4X2_ZERO_INIT {{0.0f, 0.0f}, {0.0f, 0.0f}, {0.0f, 0.0f}, {0.0f, 0.0f}}
	
	/* for C only */
	#define GLM_MAT4X2_ZERO GLM_MAT4X2_ZERO_INIT*/

	/*!
	 * @brief copy all members of [mat] to [dest]
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat4x2_copy(mat4x2 mat, mat4x2 dest);

	/*!
	 * @brief make given matrix zero.
	 *
	 * @param[in, out]  mat  matrix
	 */
	[CLink] public static extern void glm_mat4x2_zero(mat4x2 mat);

	/*!
	 * @brief Create mat4x2 matrix from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest matrix
	 */
	[CLink] public static extern void glm_mat4x2_make(float* src, mat4x2 dest);

	/*!
	 * @brief multiply m1 and m2 to dest
	 *
	 * @code
	 * glm_mat4x2_mul(mat4x2, mat2x4, mat2);
	 * @endcode
	 *
	 * @param[in]  m1   left matrix (mat4x2)
	 * @param[in]  m2   right matrix (mat2x4)
	 * @param[out] dest destination matrix (mat2)
	 */
	[CLink] public static extern void glm_mat4x2_mul(mat4x2 m1, mat2x4 m2, mat2 dest);

	/*!
	 * @brief multiply matrix with column vector and store in dest column vector
	 *
	 * @param[in]  m    matrix (left)
	 * @param[in]  v    vector (right, column vector)
	 * @param[out] dest result vector
	 */
	[CLink] public static extern void glm_mat4x2_mulv(mat4x2 m, vec4 v, vec2 dest);

	/*!
	 * @brief transpose matrix and store in dest
	 *
	 * @param[in]  m     matrix
	 * @param[out] dest  result
	 */
	[CLink] public static extern void glm_mat4x2_transpose(mat4x2 m, mat2x4 dest);

	/*!
	 * @brief scale (multiply with scalar) matrix
	 *
	 * multiply matrix with scalar
	 *
	 * @param[in, out] m matrix
	 * @param[in]    s scalar
	 */
	[CLink] public static extern void glm_mat4x2_scale(mat4x2 m, float s);
}