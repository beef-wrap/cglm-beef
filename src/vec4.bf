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
	/* DEPRECATED! functions */
	/*#define glm_vec4_dup3(v, dest)         glm_vec4_copy3(v, dest)
	#define glm_vec4_dup(v, dest)          glm_vec4_copy(v, dest)
	#define glm_vec4_flipsign(v)           glm_vec4_negate(v)
	#define glm_vec4_flipsign_to(v, dest)  glm_vec4_negate_to(v, dest)
	#define glm_vec4_inv(v)                glm_vec4_negate(v)
	#define glm_vec4_inv_to(v, dest)       glm_vec4_negate_to(v, dest)
	#define glm_vec4_mulv(a, b, d)         glm_vec4_mul(a, b, d)
	#define glm_vec4_step_uni(edge, x, dest) glm_vec4_steps(edge, x, dest)
	
	#define GLM_VEC4_ONE_INIT   {1.0f, 1.0f, 1.0f, 1.0f}
	#define GLM_VEC4_BLACK_INIT {0.0f, 0.0f, 0.0f, 1.0f}
	#define GLM_VEC4_ZERO_INIT  {0.0f, 0.0f, 0.0f, 0.0f}
	
	#define GLM_VEC4_ONE        ((vec4)GLM_VEC4_ONE_INIT)
	#define GLM_VEC4_BLACK      ((vec4)GLM_VEC4_BLACK_INIT)
	#define GLM_VEC4_ZERO       ((vec4)GLM_VEC4_ZERO_INIT)
	
	#define GLM_XXXX GLM_SHUFFLE4(0, 0, 0, 0)
	#define GLM_YYYY GLM_SHUFFLE4(1, 1, 1, 1)
	#define GLM_ZZZZ GLM_SHUFFLE4(2, 2, 2, 2)
	#define GLM_WWWW GLM_SHUFFLE4(3, 3, 3, 3)
	#define GLM_WZYX GLM_SHUFFLE4(0, 1, 2, 3)*/

	/*!
	 * @brief init vec4 using vec3
	 *
	 * @param[in]  v3   vector3
	 * @param[in]  last last item
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4(vec3 v3, float last, vec4 dest);

	/*!
	 * @brief copy first 3 members of [a] to [dest]
	 *
	 * @param[in]  a    source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4_copy3(vec4 a, vec3 dest);

	/*!
	 * @brief copy all members of [a] to [dest]
	 *
	 * @param[in]  v    source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4_copy(vec4 v, vec4 dest);

	/*!
	 * @brief copy all members of [a] to [dest]
	 *
	 * alignment is not required
	 *
	 * @param[in]  v    source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4_ucopy(vec4 v, vec4 dest);

	/*!
	 * @brief make vector zero
	 *
	 * @param[in, out]  v vector
	 */
	[CLink] public static extern void glm_vec4_zero(vec4 v);

	/*!
	 * @brief make vector one
	 *
	 * @param[in, out]  v vector
	 */
	[CLink] public static extern void glm_vec4_one(vec4 v);

	/*!
	 * @brief vec4 dot product
	 *
	 * @param[in] a vector1
	 * @param[in] b vector2
	 *
	 * @return dot product
	 */
	[CLink] public static extern float glm_vec4_dot(vec4 a, vec4 b);

	/*!
	 * @brief norm * norm (magnitude) of vec
	 *
	 * we can use this func instead of calling norm * norm, because it would call
	 * sqrtf function twice but with this func we can avoid func call, maybe this is
	 * not good name for this func
	 *
	 * @param[in] v vec4
	 *
	 * @return norm * norm
	 */
	[CLink] public static extern float glm_vec4_norm2(vec4 v);

	/*!
	 * @brief euclidean norm (magnitude), also called L2 norm
	 *        this will give magnitude of vector in euclidean space
	 *
	 * @param[in] v vector
	 *
	 * @return norm
	 */
	[CLink] public static extern float glm_vec4_norm(vec4 v);

	/*!
	 * @brief L1 norm of vec4
	 * Also known as Manhattan Distance or Taxicab norm.
	 * L1 Norm is the sum of the magnitudes of the vectors in a space.
	 * It is calculated as the sum of the absolute values of the vector components.
	 * In this norm, all the components of the vector are weighted equally.
	 *
	 * This computes:
	 * L1 norm = |v[0]| + |v[1]| + |v[2]| + |v[3]|
	 *
	 * @param[in] v vector
	 *
	 * @return L1 norm
	 */
	[CLink] public static extern float glm_vec4_norm_one(vec4 v);

	/*!
	 * @brief infinity norm of vec4
	 * Also known as Maximum norm.
	 * Infinity Norm is the largest magnitude among each element of a vector.
	 * It is calculated as the maximum of the absolute values of the vector components.
	 *
	 * This computes:
	 * inf norm = max(|v[0]|, |v[1]|, |v[2]|, |v[3]|)
	 *
	 * @param[in] v vector
	 *
	 * @return infinity norm
	 */
	[CLink] public static extern float glm_vec4_norm_inf(vec4 v);

	/*!
	 * @brief add b vector to a vector store result in dest
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_add(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief add scalar to v vector store result in dest (d = v + vec(s))
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_adds(vec4 v, float s, vec4 dest);

	/*!
	 * @brief subtract b vector from a vector store result in dest (d = a - b)
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_sub(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief subtract scalar from v vector store result in dest (d = v - vec(s))
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_subs(vec4 v, float s, vec4 dest);

	/*!
	 * @brief multiply two vectors (component-wise multiplication)
	 *
	 * @param a    vector1
	 * @param b    vector2
	 * @param dest dest = (a[0] * b[0], a[1] * b[1], a[2] * b[2], a[3] * b[3])
	 */
	[CLink] public static extern void glm_vec4_mul(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief multiply/scale vec4 vector with scalar: result = v * s
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_scale(vec4 v, float s, vec4 dest);

	/*!
	 * @brief make vec4 vector scale as specified: result = unit(v) * s
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_scale_as(vec4 v, float s, vec4 dest);

	/*!
	 * @brief div vector with another component-wise division: d = a / b
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest result = (a[0]/b[0], a[1]/b[1], a[2]/b[2], a[3]/b[3])
	 */
	[CLink] public static extern void glm_vec4_div(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief div vec4 vector with scalar: d = v / s
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_divs(vec4 v, float s, vec4 dest);

	/*!
	 * @brief add two vectors and add result to sum
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += (a + b)
	 */
	[CLink] public static extern void glm_vec4_addadd(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief sub two vectors and add result to dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += (a - b)
	 */
	[CLink] public static extern void glm_vec4_subadd(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief mul two vectors and add result to dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += (a * b)
	 */
	[CLink] public static extern void glm_vec4_muladd(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief mul vector with scalar and add result to sum
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest += (a * b)
	 */
	[CLink] public static extern void glm_vec4_muladds(vec4 a, float s, vec4 dest);

	/*!
	 * @brief add max of two vectors to result/dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += max(a, b)
	 */
	[CLink] public static extern void glm_vec4_maxadd(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief add min of two vectors to result/dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += min(a, b)
	 */
	[CLink] public static extern void glm_vec4_minadd(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief sub two vectors and sub result to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= (a - b)
	 */
	[CLink] public static extern void glm_vec4_subsub(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief add two vectors and sub result to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= (a + b)
	 */
	[CLink] public static extern void glm_vec4_addsub(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief mul two vectors and sub result to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= (a * b)
	 */
	[CLink] public static extern void glm_vec4_mulsub(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief mul vector with scalar and sub result to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest -= (a * b)
	 */
	[CLink] public static extern void glm_vec4_mulsubs(vec4 a, float s, vec4 dest);

	/*!
	 * @brief sub max of two vectors to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= max(a, b)
	 */
	[CLink] public static extern void glm_vec4_maxsub(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief sub min of two vectors to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= min(a, b)
	 */
	[CLink] public static extern void glm_vec4_minsub(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief negate vector components and store result in dest
	 *
	 * @param[in]  v     vector
	 * @param[out] dest  result vector
	 */
	[CLink] public static extern void glm_vec4_negate_to(vec4 v, vec4 dest);

	/*!
	 * @brief flip sign of all vec4 members
	 *
	 * @param[in, out]  v  vector
	 */
	[CLink] public static extern void glm_vec4_negate(vec4 v);

	/*!
	 * @brief normalize vec4 to dest
	 *
	 * @param[in]  v    source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4_normalize_to(vec4 v, vec4 dest);

	/*!
	 * @brief normalize vec4 and store result in same vec
	 *
	 * @param[in, out] v vector
	 */
	[CLink] public static extern void glm_vec4_normalize(vec4 v);

	/**
	 * @brief distance between two vectors
	 *
	 * @param[in] a vector1
	 * @param[in] b vector2
	 * @return returns distance
	 */
	[CLink] public static extern float glm_vec4_distance(vec4 a, vec4 b);

	/**
	 * @brief squared distance between two vectors
	 *
	 * @param[in] a vector1
	 * @param[in] b vector2
	 * @return returns squared distance
	 */
	[CLink] public static extern float glm_vec4_distance2(vec4 a, vec4 b);

	/*!
	 * @brief max values of vectors
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4_maxv(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief min values of vectors
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4_minv(vec4 a, vec4 b, vec4 dest);

	/*!
	 * @brief clamp vector's individual members between min and max values
	 *
	 * @param[in, out]  v      vector
	 * @param[in]       minVal minimum value
	 * @param[in]       maxVal maximum value
	 */
	[CLink] public static extern void glm_vec4_clamp(vec4 v, float minVal, float maxVal);

	/*!
	 * @brief linear interpolation between two vectors
	 *
	 * formula:  from + t * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount)
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec4_lerp(vec4 from, vec4 to, float t, vec4 dest);

	/*!
	 * @brief linear interpolation between two vectors (clamped)
	 *
	 * formula:  from + t * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount) clamped between 0 and 1
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec4_lerpc(vec4 from, vec4 to, float t, vec4 dest);

	/*!
	 * @brief linear interpolation between two vectors
	 *
	 * formula:  from + t * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount)
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec4_mix(vec4 from, vec4 to, float t, vec4 dest);

	/*!
	 * @brief linear interpolation between two vectors (clamped)
	 *
	 * formula:  from + t * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount) clamped between 0 and 1
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec4_mixc(vec4 from, vec4 to, float t, vec4 dest);

	/*!
	 * @brief threshold function
	 *
	 * @param[in]   edge    threshold
	 * @param[in]   x       value to test against threshold
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec4_step(vec4 edge, vec4 x, vec4 dest);

	/*!
	 * @brief threshold function with a smooth transition (unidimensional)
	 *
	 * @param[in]   edge0   low threshold
	 * @param[in]   edge1   high threshold
	 * @param[in]   x       value to test against threshold
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec4_smoothstep_uni(float edge0, float edge1, vec4 x, vec4 dest);

	/*!
	 * @brief threshold function with a smooth transition
	 *
	 * @param[in]   edge0   low threshold
	 * @param[in]   edge1   high threshold
	 * @param[in]   x       value to test against threshold
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec4_smoothstep(vec4 edge0, vec4 edge1, vec4 x, vec4 dest);

	/*!
	 * @brief smooth Hermite interpolation between two vectors
	 *
	 * formula:  t^2 * (3 - 2*t)
	 *
	 * @param[in]   from    from value
	 * @param[in]   to      to value
	 * @param[in]   t       interpolant (amount)
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec4_smoothinterp(vec4 from, vec4 to, float t, vec4 dest);

	/*!
	 * @brief smooth Hermite interpolation between two vectors (clamped)
	 *
	 * formula:  t^2 * (3 - 2*t)
	 *
	 * @param[in]   from    from value
	 * @param[in]   to      to value
	 * @param[in]   t       interpolant (amount) clamped between 0 and 1
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec4_smoothinterpc(vec4 from, vec4 to, float t, vec4 dest);

	/*!
	 * @brief helper to fill vec4 as [S^3, S^2, S, 1]
	 *
	 * @param[in]   s    parameter
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec4_cubic(float s, vec4 dest);

	/*!
	 * @brief swizzle vector components
	 *
	 * you can use existing masks e.g. GLM_XXXX, GLM_WZYX
	 *
	 * @param[in]  v    source
	 * @param[in]  mask mask
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec4_swizzle(vec4 v, c_int mask, vec4 dest);

	/*!
	 * @brief Create four dimensional vector from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec4_make(float* src, vec4 dest);
	/*!
	 * @brief reflection vector using an incident ray and a surface normal
	 *
	 * @param[in]  v    incident vector
	 * @param[in]  n    normalized normal vector
	 * @param[out] dest destination vector for the reflection result
	 */
	[CLink] public static extern void glm_vec4_reflect(vec4 v, vec4 n, vec4 dest);

	/*!
	 * @brief computes refraction vector for an incident vector and a surface normal.
	 *
	 * calculates the refraction vector based on Snell's law. If total internal reflection
	 * occurs (angle too great given eta), dest is set to zero and returns false.
	 * Otherwise, computes refraction vector, stores it in dest, and returns true.
	 *
	 * this implementation does not explicitly preserve the 'w' component of the
	 * incident vector 'I' in the output 'dest', users requiring the preservation of
	 * the 'w' component should manually adjust 'dest' after calling this function.
	 *
	 * @param[in]  v    normalized incident vector
	 * @param[in]  n    normalized normal vector
	 * @param[in]  eta  ratio of indices of refraction (incident/transmitted)
	 * @param[out] dest refraction vector if refraction occurs; zero vector otherwise
	 *
	 * @returns true if refraction occurs; false if total internal reflection occurs.
	 */
	[CLink] public static extern bool glm_vec4_refract(vec4 v, vec4 n, float eta, vec4 dest);
}