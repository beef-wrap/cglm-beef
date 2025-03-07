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
	/*#define GLM_MAT2X4_ZERO_INIT {{0.0f, 0.0f, 0.0f, 0.0f}, {0.0f, 0.0f, 0.0f, 0.0f}}
	
	/* for C only */
	#define GLM_MAT2X4_ZERO GLM_MAT2X4_ZERO_INIT*/

	/*!
	 * @brief copy all members of [mat] to [dest]
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat2x4_copy(mat2x4 mat, mat2x4 dest);

	/*!
	 * @brief make given matrix zero.
	 *
	 * @param[in, out]  mat  matrix
	 */
	[CLink] public static extern void glm_mat2x4_zero(mat2x4 mat);

	/*!
	 * @brief Create mat2x4 matrix from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest matrix
	 */
	[CLink] public static extern void glm_mat2x4_make(float* src, mat2x4 dest);

	/*!
	 * @brief multiply m1 and m2 to dest
	 *
	 * @code
	 * glm_mat2x4_mul(mat2x4, mat4x2, mat4);
	 * @endcode
	 *
	 * @param[in]  m1   left matrix (mat2x4)
	 * @param[in]  m2   right matrix (mat4x2)
	 * @param[out] dest destination matrix (mat4)
	 */
	[CLink] public static extern void glm_mat2x4_mul(mat2x4 m1, mat4x2 m2, mat4 dest);

	/*!
	 * @brief multiply matrix with column vector and store in dest column vector
	 *
	 * @param[in]  m    matrix (left)
	 * @param[in]  v    vector (right, column vector)
	 * @param[out] dest result vector
	 */
	[CLink] public static extern void glm_mat2x4_mulv(mat2x4 m, vec2 v, vec4 dest);

	/*!
	 * @brief transpose matrix and store in dest
	 *
	 * @param[in]  m     matrix
	 * @param[out] dest  result
	 */
	[CLink] public static extern void glm_mat2x4_transpose(mat2x4 m, mat4x2 dest);

	/*!
	 * @brief scale (multiply with scalar) matrix
	 *
	 * multiply matrix with scalar
	 *
	 * @param[in, out] m matrix
	 * @param[in]    s scalar
	 */
	[CLink] public static extern void glm_mat2x4_scale(mat2x4 m, float s);
}