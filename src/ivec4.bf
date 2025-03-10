/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

using System;
using System.c_Interop;

namespace cglm_Beef;

extension cglm
{
	const vec4 GLM_IVEC4_ONE_INIT   = .(1, 1, 1, 1);
	const vec4 GLM_IVEC4_ZERO_INIT  = .(0, 0, 0, 0);

	/*!
	 * @brief init ivec4 using ivec3
	 *
	 * @param[in]  v3   vector3
	 * @param[in]  last last item
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4(ivec3 v3, c_int last, ivec4 dest);

	/*!
	 * @brief copy all members of [a] to [dest]
	 *
	 * @param[in]  a    source vector
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_copy(ivec4 a, ivec4 dest);

	/*!
	 * @brief set all members of [v] to zero
	 *
	 * @param[out] v vector
	 */
	[CLink] public static extern void  glm_ivec4_zero(ivec4 v);

	/*!
	 * @brief set all members of [v] to one
	 *
	 * @param[out] v vector
	 */
	[CLink] public static extern void glm_ivec4_one(ivec4 v);

	/*!
	 * @brief add vector [a] to vector [b] and store result in [dest]
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_add(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief add scalar s to vector [v] and store result in [dest]
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_adds(ivec4 v, c_int s, ivec4 dest);

	/*!
	 * @brief subtract vector [b] from vector [a] and store result in [dest]
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_sub(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief subtract scalar s from vector [v] and store result in [dest]
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_subs(ivec4 v, c_int s, ivec4 dest);

	/*!
	 * @brief multiply vector [a] with vector [b] and store result in [dest]
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_mul(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief multiply vector [a] with scalar s and store result in [dest]
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_scale(ivec4 v, c_int s, ivec4 dest);

	/*!
	 * @brief add vector [a] with vector [b] and add result to vector [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest += (a + b)
	 */
	[CLink] public static extern void glm_ivec4_addadd(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief add scalar [s] onto vector [a] and add result to vector [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest += (a + s)
	 */
	[CLink] public static extern void glm_ivec4_addadds(ivec4 a, c_int s, ivec4 dest);

	/*!
	 * @brief subtract vector [a] from vector [b] and add result to [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest += (a - b)  
	 */
	[CLink] public static extern void glm_ivec4_subadd(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief subtract scalar [s] from vector [a] and add result to [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    first
	 * @param[in]  s    scalar
	 * @param[out] dest dest += (a - s)
	 */
	[CLink] public static extern void glm_ivec4_subadds(ivec4 a, c_int s, ivec4 dest);

	/*!
	 * @brief multiply vector [a] with vector [b] and add result to [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest += (a * b)
	 */
	[CLink] public static extern void glm_ivec4_muladd(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief multiply vector [a] with scalar [s] and add result to [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest += (a * s)
	 */
	[CLink] public static extern void glm_ivec4_muladds(ivec4 a, c_int s, ivec4 dest);

	/*!
	 * @brief add maximum of vector [a] and vector [b] to vector [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest += max(a, b)
	 */
	[CLink] public static extern void glm_ivec4_maxadd(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief add minimum of vector [a] and vector [b] to vector [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest += min(a, b)
	 */
	[CLink] public static extern void glm_ivec4_minadd(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief subtract vector [a] from vector [b] and subtract result from [dest]
	 *
	 * applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest -= (a - b)
	 */
	[CLink] public static extern void glm_ivec4_subsub(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief subtract scalar [s] from vector [a] and subtract result from [dest]
	 *
	 * applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest -= (a - s)
	 */
	[CLink] public static extern void glm_ivec4_subsubs(ivec4 a, c_int s, ivec4 dest);

	/*!
	 * @brief add vector [a] to vector [b] and subtract the result from [dest]
	 *
	 * applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  b    scalar
	 * @param[out] dest dest -= (a + b)
	 */
	[CLink] public static extern void glm_ivec4_addsub(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief add scalar [s] to vector [a] and subtract the result from [dest]
	 *
	 * applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest -= (a + b)
	 */
	[CLink] public static extern void glm_ivec4_addsubs(ivec4 a, c_int s, ivec4 dest);

	/*!
	 * @brief multiply vector [a] and vector [b] and subtract the result from [dest]
	 *
	 * applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  b    scalar
	 * @param[out] dest dest -= (a * b)
	 */
	[CLink] public static extern void glm_ivec4_mulsub(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief multiply vector [a] with scalar [s] and subtract the result from [dest]
	 *
	 * applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest -= (a * s)
	 */
	[CLink] public static extern void glm_ivec4_mulsubs(ivec4 a, c_int s, ivec4 dest);

	/*!
	 * @brief subtract maximum of vector [a] and vector [b] from vector [dest]
	 *
	 * applies += operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest -= max(a, b)
	 */
	[CLink] public static extern void glm_ivec4_maxsub(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief subtract minimum of vector [a] and vector [b] from vector [dest]
	 *
	 * applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest dest -= min(a, b)
	 */
	[CLink] public static extern void glm_ivec4_minsub(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief squared distance between two vectors
	 *
	 * @param[in] a first vector
	 * @param[in] b second vector
	 * @return returns squared distance (distance * distance)
	 */
	[CLink] public static extern c_int glm_ivec4_distance2(ivec4 a, ivec4 b);

	/*!
	 * @brief distance between two vectors
	 *
	 * @param[in] a first vector
	 * @param[in] b second vector
	 * @return returns distance
	 */
	[CLink] public static extern float glm_ivec4_distance(ivec4 a, ivec4 b);

	/*!
	 * @brief set each member of dest to greater of vector a and b
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest destination
	 */
	[CLink] public static extern void
		glm_ivec4_maxv(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief set each member of dest to lesser of vector a and b
	 *
	 * @param[in]  a    first vector
	 * @param[in]  b    second vector
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_ivec4_minv(ivec4 a, ivec4 b, ivec4 dest);

	/*!
	 * @brief clamp each member of [v] between minVal and maxVal (inclusive)
	 *
	 * @param[in, out] v      vector
	 * @param[in]      minVal minimum value
	 * @param[in]      maxVal maximum value
	 */
	[CLink] public static extern void glm_ivec4_clamp(ivec4 v, c_int minVal, c_int maxVal);

	/*!
	 * @brief absolute value of v
	 *
	 * @param[in]	v	vector
	 * @param[out]	dest	destination
	 */
	[CLink] public static extern void glm_ivec4_abs(ivec4 v, ivec4 dest);
}