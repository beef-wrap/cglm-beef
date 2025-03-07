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
	#  include "simd/sse2/mat4.h"
	#endif
	
	#ifdef CGLM_AVX_FP
	#  include "simd/avx/mat4.h"
	#endif
	
	#ifdef CGLM_NEON_FP
	#  include "simd/neon/mat4.h"
	#endif
	
	#ifdef CGLM_SIMD_WASM
	#  include "simd/wasm/mat4.h"
	#endif
	
	#ifndef NDEBUG
	# include <assert.h>
	#endif*/

	/*#define GLM_MAT4_IDENTITY_INIT  {{1.0f, 0.0f, 0.0f, 0.0f},                    \
									 {0.0f, 1.0f, 0.0f, 0.0f},                    \
									 {0.0f, 0.0f, 1.0f, 0.0f},                    \
									 {0.0f, 0.0f, 0.0f, 1.0f}}
	
	#define GLM_MAT4_ZERO_INIT      {{0.0f, 0.0f, 0.0f, 0.0f},                    \
									 {0.0f, 0.0f, 0.0f, 0.0f},                    \
									 {0.0f, 0.0f, 0.0f, 0.0f},                    \
									 {0.0f, 0.0f, 0.0f, 0.0f}}*/

	/* for C only */
	//#define GLM_MAT4_IDENTITY ((mat4)GLM_MAT4_IDENTITY_INIT)
	//#define GLM_MAT4_ZERO     ((mat4)GLM_MAT4_ZERO_INIT)

	/* DEPRECATED! use _copy, _ucopy versions */
	//#define glm_mat4_udup(mat, dest) glm_mat4_ucopy(mat, dest)
	//#define glm_mat4_dup(mat, dest)  glm_mat4_copy(mat, dest)

	/* DEPRECATED! default is precise now. */
	//#define glm_mat4_inv_precise(mat, dest) glm_mat4_inv(mat, dest)

	/*!
	 * @brief copy all members of [mat] to [dest]
	 *
	 * matrix may not be aligned, u stands for unaligned, this may be useful when
	 * copying a matrix from external source e.g. asset importer...
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat4_ucopy(mat4 mat, mat4 dest);

	/*!
	 * @brief copy all members of [mat] to [dest]
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat4_copy(mat4 mat, mat4 dest);

	/*!
	 * @brief make given matrix identity. It is identical with below, 
	 *        but it is more easy to do that with this func especially for members
	 *        e.g. glm_mat4_identity(aStruct->aMatrix);
	 *
	 * @code
	 * glm_mat4_copy(GLM_MAT4_IDENTITY, mat); // C only
	 *
	 * // or
	 * mat4 mat = GLM_MAT4_IDENTITY_INIT;
	 * @endcode
	 *
	 * @param[in, out]  mat  destination
	 */
	[CLink] public static extern void glm_mat4_identity(mat4 mat);

	/*!
	 * @brief make given matrix array's each element identity matrix
	 *
	 * @param[in, out]  mat   matrix array (must be aligned (16/32)
	 *                        if alignment is not disabled)
	 *
	 * @param[in]       count count of matrices
	 */
	[CLink] public static extern void glm_mat4_identity_array(mat4* mat, size_t count);

	/*!
	 * @brief make given matrix zero.
	 *
	 * @param[in, out]  mat  matrix
	 */
	[CLink] public static extern void glm_mat4_zero(mat4 mat);

	/*!
	 * @brief copy upper-left of mat4 to mat3
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat4_pick3(mat4 mat, mat3 dest);

	/*!
	 * @brief copy upper-left of mat4 to mat3 (transposed)
	 *
	 * the postfix t stands for transpose
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat4_pick3t(mat4 mat, mat3 dest);

	/*!
	 * @brief copy mat3 to mat4's upper-left
	 *
	 * @param[in]  mat  source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_mat4_ins3(mat3 mat, mat4 dest);

	/*!
	 * @brief multiply m1 and m2 to dest
	 *
	 * m1, m2 and dest matrices can be same matrix, it is possible to write this:
	 *
	 * @code
	 * mat4 m = GLM_MAT4_IDENTITY_INIT;
	 * glm_mat4_mul(m, m, m);
	 * @endcode
	 *
	 * @param[in]  m1   left matrix
	 * @param[in]  m2   right matrix
	 * @param[out] dest destination matrix
	 */
	[CLink] public static extern void glm_mat4_mul(mat4 m1, mat4 m2, mat4 dest);

	/*!
	 * @brief mupliply N mat4 matrices and store result in dest
	 *
	 * this function lets you multiply multiple (more than two or more...) matrices
	 * <br><br>multiplication will be done in loop, this may reduce instructions
	 * size but if <b>len</b> is too small then compiler may unroll whole loop,
	 * usage:
	 * @code
	 * mat m1, m2, m3, m4, res;
	 *
	 * glm_mat4_mulN((mat4 *[]){&m1, &m2, &m3, &m4}, 4, res);
	 * @endcode
	 *
	 * @warning matrices parameter is pointer array not mat4 array!
	 *
	 * @param[in]  matrices mat4 * array
	 * @param[in]  len      matrices count
	 * @param[out] dest     result
	 */
	[CLink] public static extern void glm_mat4_mulN(mat4[]* matrices, uint32_t len, mat4 dest);

	/*!
	 * @brief multiply mat4 with vec4 (column vector) and store in dest vector
	 *
	 * @param[in]  m    mat4 (left)
	 * @param[in]  v    vec4 (right, column vector)
	 * @param[out] dest vec4 (result, column vector)
	 */
	[CLink] public static extern void glm_mat4_mulv(mat4 m, vec4 v, vec4 dest);

	/*!
	 * @brief trace of matrix
	 *
	 * sum of the elements on the main diagonal from upper left to the lower right
	 *
	 * @param[in]  m matrix
	 */
	[CLink] public static extern float glm_mat4_trace(mat4 m);

	/*!
	 * @brief trace of matrix (rotation part)
	 *
	 * sum of the elements on the main diagonal from upper left to the lower right
	 *
	 * @param[in]  m matrix
	 */
	[CLink] public static extern float glm_mat4_trace3(mat4 m);

	/*!
	 * @brief convert mat4's rotation part to quaternion
	 *
	 * @param[in]  m    affine matrix
	 * @param[out] dest destination quaternion
	 */
	[CLink] public static extern void glm_mat4_quat(mat4 m, versor dest);

	/*!
	 * @brief multiply vector with mat4
	 *
	 * actually the result is vec4, after multiplication the last component
	 * is trimmed. if you need it don't use this func.
	 *
	 * @param[in]  m    mat4(affine transform)
	 * @param[in]  v    vec3
	 * @param[in]  last 4th item to make it vec4
	 * @param[out] dest result vector (vec3)
	 */
	[CLink] public static extern void glm_mat4_mulv3(mat4 m, vec3 v, float last, vec3 dest);

	/*!
	 * @brief transpose mat4 and store in dest
	 *
	 * source matrix will not be transposed unless dest is m
	 *
	 * @param[in]  m    matrix
	 * @param[out] dest result
	 */
	[CLink] public static extern void glm_mat4_transpose_to(mat4 m, mat4 dest);

	/*!
	 * @brief transpose mat4 and store result in same matrix
	 *
	 * @param[in, out] m source and dest
	 */
	[CLink] public static extern void glm_mat4_transpose(mat4 m);

	/*!
	 * @brief scale (multiply with scalar) matrix without simd optimization
	 *
	 * multiply matrix with scalar
	 *
	 * @param[in, out] m matrix
	 * @param[in]      s scalar
	 */
	[CLink] public static extern void glm_mat4_scale_p(mat4 m, float s);

	/*!
	 * @brief scale (multiply with scalar) matrix
	 *
	 * multiply matrix with scalar
	 *
	 * @param[in, out] m matrix
	 * @param[in]      s scalar
	 */
	[CLink] public static extern void glm_mat4_scale(mat4 m, float s);

	/*!
	 * @brief mat4 determinant
	 *
	 * @param[in] mat matrix
	 *
	 * @return determinant
	 */
	[CLink] public static extern float glm_mat4_det(mat4 mat);

	/*!
	 * @brief inverse mat4 and store in dest
	 *
	 * @param[in]  mat  matrix
	 * @param[out] dest inverse matrix
	 */
	[CLink] public static extern void glm_mat4_inv(mat4 mat, mat4 dest);

	/*!
	 * @brief inverse mat4 and store in dest
	 *
	 * this func uses reciprocal approximation without extra corrections
	 * e.g Newton-Raphson. this should work faster than normal,
	 * to get more precise use glm_mat4_inv version.
	 *
	 * NOTE: You will lose precision, glm_mat4_inv is more accurate
	 *
	 * @param[in]  mat  matrix
	 * @param[out] dest inverse matrix
	 */
	[CLink] public static extern void glm_mat4_inv_fast(mat4 mat, mat4 dest);

	/*!
	 * @brief swap two matrix columns
	 *
	 * @param[in,out] mat  matrix
	 * @param[in]     col1 col1
	 * @param[in]     col2 col2
	 */
	[CLink] public static extern void glm_mat4_swap_col(mat4 mat, int col1, int col2);

	/*!
	 * @brief swap two matrix rows
	 *
	 * @param[in,out] mat  matrix
	 * @param[in]     row1 row1
	 * @param[in]     row2 row2
	 */
	[CLink] public static extern void glm_mat4_swap_row(mat4 mat, int row1, int row2);

	/*!
	 * @brief helper for  R (row vector) * M (matrix) * C (column vector)
	 *
	 * rmc stands for Row * Matrix * Column
	 *
	 * the result is scalar because R * M = Matrix1x4 (row vector),
	 * then Matrix1x4 * Vec4 (column vector) = Matrix1x1 (Scalar)
	 *
	 * @param[in]  r   row vector or matrix1x4
	 * @param[in]  m   matrix4x4
	 * @param[in]  c   column vector or matrix4x1
	 *
	 * @return scalar value e.g. B(s)
	 */
	[CLink] public static extern float glm_mat4_rmc(vec4 r, mat4 m, vec4 c);

	/*!
	 * @brief Create mat4 matrix from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest matrix
	 */
	[CLink] public static extern void glm_mat4_make(float* src, mat4 dest);
}