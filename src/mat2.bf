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
	/*#ifdef CGLM_SSE_FP
	#  include "simd/sse2/mat2.h"
	#endif
	
	#ifdef CGLM_NEON_FP
	#  include "simd/neon/mat2.h"
	#endif
	
	#ifdef CGLM_SIMD_WASM
	#  include "simd/wasm/mat2.h"
	#endif
	
	#define GLM_MAT2_IDENTITY_INIT  {{1.0f, 0.0f}, {0.0f, 1.0f}}
	#define GLM_MAT2_ZERO_INIT      {{0.0f, 0.0f}, {0.0f, 0.0f}}
	
	/* for C only */
	#define GLM_MAT2_IDENTITY ((mat2)GLM_MAT2_IDENTITY_INIT)
	#define GLM_MAT2_ZERO     ((mat2)GLM_MAT2_ZERO_INIT)*/

	/*!
	 * @brief copy all members of [mat] to [dest]
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat2_copy(mat2 mat, mat2 dest);

	/*!
	 * @brief make given matrix identity. It is identical with below,
	 *        but it is more easy to do that with this func especially for members
	 *        e.g. glm_mat2_identity(aStruct->aMatrix);
	 *
	 * @code
	 * glm_mat2_copy(GLM_MAT2_IDENTITY, mat); // C only
	 *
	 * // or
	 * mat2 mat = GLM_MAT2_IDENTITY_INIT;
	 * @endcode
	 *
	 * @param[in, out]  mat  destination
	 */
	[CLink] public static extern void glm_mat2_identity(mat2 mat);

	/*!
	 * @brief make given matrix array's each element identity matrix
	 *
	 * @param[in, out]  mat   matrix array (must be aligned (16)
	 *                        if alignment is not disabled)
	 *
	 * @param[in]       count count of matrices
	 */
	[CLink] public static extern void glm_mat2_identity_array(mat2* mat, size_t count);

	/*!
	 * @brief make given matrix zero.
	 *
	 * @param[in, out]  mat  matrix
	 */
	[CLink] public static extern void glm_mat2_zero(mat2 mat);

	/*!
	 * @brief multiply m1 and m2 to dest
	 *
	 * m1, m2 and dest matrices can be same matrix, it is possible to write this:
	 *
	 * @code
	 * mat2 m = GLM_MAT2_IDENTITY_INIT;
	 * glm_mat2_mul(m, m, m);
	 * @endcode
	 *
	 * @param[in]  m1   left matrix
	 * @param[in]  m2   right matrix
	 * @param[out] dest destination matrix
	 */
	[CLink] public static extern void glm_mat2_mul(mat2 m1, mat2 m2, mat2 dest);

	/*!
	 * @brief transpose mat2 and store in dest
	 *
	 * source matrix will not be transposed unless dest is m
	 *
	 * @param[in]  m     matrix
	 * @param[out] dest  result
	 */
	[CLink] public static extern void glm_mat2_transpose_to(mat2 m, mat2 dest);

	/*!
	 * @brief transpose mat2 and store result in same matrix
	 *
	 * @param[in, out] m source and dest
	 */
	[CLink] public static extern void glm_mat2_transpose(mat2 m);

	/*!
	 * @brief multiply mat2 with vec2 (column vector) and store in dest vector
	 *
	 * @param[in]  m    mat2 (left)
	 * @param[in]  v    vec2 (right, column vector)
	 * @param[out] dest vec2 (result, column vector)
	 */
	[CLink] public static extern void glm_mat2_mulv(mat2 m, vec2 v, vec2 dest);

	/*!
	 * @brief trace of matrix
	 *
	 * sum of the elements on the main diagonal from upper left to the lower right
	 *
	 * @param[in]  m matrix
	 */
	[CLink] public static extern float glm_mat2_trace(mat2 m);

	/*!
	 * @brief scale (multiply with scalar) matrix
	 *
	 * multiply matrix with scalar
	 *
	 * @param[in, out] m matrix
	 * @param[in]      s scalar
	 */
	[CLink] public static extern void glm_mat2_scale(mat2 m, float s);

	/*!
	 * @brief mat2 determinant
	 *
	 * @param[in] mat matrix
	 *
	 * @return determinant
	 */
	[CLink] public static extern float glm_mat2_det(mat2 mat);

	/*!
	 * @brief inverse mat2 and store in dest
	 *
	 * @param[in]  mat  matrix
	 * @param[out] dest inverse matrix
	 */
	[CLink] public static extern void glm_mat2_inv(mat2 mat, mat2 dest);

	/*!
	 * @brief swap two matrix columns
	 *
	 * @param[in,out] mat  matrix
	 * @param[in]     col1 col1
	 * @param[in]     col2 col2
	 */
	[CLink] public static extern void glm_mat2_swap_col(mat2 mat, c_int col1, c_int col2);

	/*!
	 * @brief swap two matrix rows
	 *
	 * @param[in,out] mat  matrix
	 * @param[in]     row1 row1
	 * @param[in]     row2 row2
	 */
	[CLink] public static extern void glm_mat2_swap_row(mat2 mat, c_int row1, c_int row2);

	/*!
	 * @brief helper for  R (row vector) * M (matrix) * C (column vector)
	 *
	 * rmc stands for Row * Matrix * Column
	 *
	 * the result is scalar because R * M = Matrix1x2 (row vector),
	 * then Matrix1x2 * Vec2 (column vector) = Matrix1x1 (Scalar)
	 *
	 * @param[in]  r   row vector or matrix1x2
	 * @param[in]  m   matrix2x2
	 * @param[in]  c   column vector or matrix2x1
	 *
	 * @return scalar value e.g. Matrix1x1
	 */
	[CLink] public static extern float glm_mat2_rmc(vec2 r, mat2 m, vec2 c);

	/*!
	 * @brief Create mat2 matrix from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest matrix
	 */
	[CLink] public static extern void glm_mat2_make(float* src, mat2 dest);
}