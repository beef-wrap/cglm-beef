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

	/*#ifdef CGLM_SSE_FP
	#  include "simd/sse2/mat3.h"
	#endif
	
	#ifdef CGLM_SIMD_WASM
	#  include "simd/wasm/mat3.h"
	#endif
	
	#define GLM_MAT3_IDENTITY_INIT  {{1.0f, 0.0f, 0.0f},                          \
									 {0.0f, 1.0f, 0.0f},                          \
									 {0.0f, 0.0f, 1.0f}}
	#define GLM_MAT3_ZERO_INIT      {{0.0f, 0.0f, 0.0f},                          \
									 {0.0f, 0.0f, 0.0f},                          \
									 {0.0f, 0.0f, 0.0f}}*/


	/* for C only */
	//#define GLM_MAT3_IDENTITY ((mat3)GLM_MAT3_IDENTITY_INIT)
	//#define GLM_MAT3_ZERO     ((mat3)GLM_MAT3_ZERO_INIT)

	/* DEPRECATED! use _copy, _ucopy versions */
	//#define glm_mat3_dup(mat, dest) glm_mat3_copy(mat, dest)

	/*!
	 * @brief copy all members of [mat] to [dest]
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat3_copy(mat3 mat, mat3 dest);

	/*!
	 * @brief make given matrix identity. It is identical with below,
	 *        but it is more easy to do that with this func especially for members
	 *        e.g. glm_mat3_identity(aStruct->aMatrix);
	 *
	 * @code
	 * glm_mat3_copy(GLM_MAT3_IDENTITY, mat); // C only
	 *
	 * // or
	 * mat3 mat = GLM_MAT3_IDENTITY_INIT;
	 * @endcode
	 *
	 * @param[in, out]  mat  destination
	 */
	[CLink] public static extern void glm_mat3_identity(mat3 mat);

	/*!
	 * @brief make given matrix array's each element identity matrix
	 *
	 * @param[in, out]  mat   matrix array (must be aligned (16/32)
	 *                        if alignment is not disabled)
	 *
	 * @param[in]       count count of matrices
	 */
	[CLink] public static extern void glm_mat3_identity_array(mat3* mat, size_t count);

	/*!
	 * @brief make given matrix zero.
	 *
	 * @param[in, out]  mat  matrix
	 */
	[CLink] public static extern void glm_mat3_zero(mat3 mat);

	/*!
	 * @brief multiply m1 and m2 to dest
	 *
	 * m1, m2 and dest matrices can be same matrix, it is possible to write this:
	 *
	 * @code
	 * mat3 m = GLM_MAT3_IDENTITY_INIT;
	 * glm_mat3_mul(m, m, m);
	 * @endcode
	 *
	 * @param[in]  m1   left matrix
	 * @param[in]  m2   right matrix
	 * @param[out] dest destination matrix
	 */
	[CLink] public static extern void glm_mat3_mul(mat3 m1, mat3 m2, mat3 dest);

	/*!
	 * @brief transpose mat3 and store in dest
	 *
	 * source matrix will not be transposed unless dest is m
	 *
	 * @param[in]  m     matrix
	 * @param[out] dest  result
	 */
	[CLink] public static extern void glm_mat3_transpose_to(mat3 m, mat3 dest);

	/*!
	 * @brief transpose mat3 and store result in same matrix
	 *
	 * @param[in, out] m source and dest
	 */
	[CLink] public static extern void glm_mat3_transpose(mat3 m);

	/*!
	 * @brief multiply mat3 with vec3 (column vector) and store in dest vector
	 *
	 * @param[in]  m    mat3 (left)
	 * @param[in]  v    vec3 (right, column vector)
	 * @param[out] dest vec3 (result, column vector)
	 */
	[CLink] public static extern void glm_mat3_mulv(mat3 m, vec3 v, vec3 dest);

	/*!
	 * @brief trace of matrix
	 *
	 * sum of the elements on the main diagonal from upper left to the lower right
	 *
	 * @param[in]  m matrix
	 */
	[CLink] public static extern float glm_mat3_trace(mat3 m);

	/*!
	 * @brief convert mat3 to quaternion
	 *
	 * @param[in]  m    rotation matrix
	 * @param[out] dest destination quaternion
	 */
	[CLink] public static extern void glm_mat3_quat(mat3 m, versor dest);

	/*!
	 * @brief scale (multiply with scalar) matrix
	 *
	 * multiply matrix with scalar
	 *
	 * @param[in, out] m matrix
	 * @param[in]      s scalar
	 */
	[CLink] public static extern void glm_mat3_scale(mat3 m, float s);

	/*!
	 * @brief mat3 determinant
	 *
	 * @param[in] mat matrix
	 *
	 * @return determinant
	 */
	[CLink] public static extern float glm_mat3_det(mat3 mat);

	/*!
	 * @brief inverse mat3 and store in dest
	 *
	 * @param[in]  mat  matrix
	 * @param[out] dest inverse matrix
	 */
	[CLink] public static extern void glm_mat3_inv(mat3 mat, mat3 dest);

	/*!
	 * @brief swap two matrix columns
	 *
	 * @param[in,out] mat  matrix
	 * @param[in]     col1 col1
	 * @param[in]     col2 col2
	 */
	[CLink] public static extern void glm_mat3_swap_col(mat3 mat, int col1, int col2);

	/*!
	 * @brief swap two matrix rows
	 *
	 * @param[in,out] mat  matrix
	 * @param[in]     row1 row1
	 * @param[in]     row2 row2
	 */
	[CLink] public static extern void glm_mat3_swap_row(mat3 mat, int row1, int row2);

	/*!
	 * @brief helper for  R (row vector) * M (matrix) * C (column vector)
	 *
	 * rmc stands for Row * Matrix * Column
	 *
	 * the result is scalar because R * M = Matrix1x3 (row vector),
	 * then Matrix1x3 * Vec3 (column vector) = Matrix1x1 (Scalar)
	 *
	 * @param[in]  r   row vector or matrix1x3
	 * @param[in]  m   matrix3x3
	 * @param[in]  c   column vector or matrix3x1
	 *
	 * @return scalar value e.g. Matrix1x1
	 */
	[CLink] public static extern float glm_mat3_rmc(vec3 r, mat3 m, vec3 c);

	/*!
	 * @brief Create mat3 matrix from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest matrix
	 */
	[CLink] public static extern void glm_mat3_make(float*  src, mat3 dest);

}