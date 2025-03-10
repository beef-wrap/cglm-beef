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
	/* DEPRECATED! use _copy, _ucopy versions */

	/*#define glm_vec3_dup(v, dest)         glm_vec3_copy(v, dest)
	#define glm_vec3_flipsign(v)          glm_vec3_negate(v)
	#define glm_vec3_flipsign_to(v, dest) glm_vec3_negate_to(v, dest)
	#define glm_vec3_inv(v)               glm_vec3_negate(v)
	#define glm_vec3_inv_to(v, dest)      glm_vec3_negate_to(v, dest)
	#define glm_vec3_mulv(a, b, d)        glm_vec3_mul(a, b, d)
	#define glm_vec3_step_uni(edge, x, dest) glm_vec3_steps(edge, x, dest)

	#define GLM_VEC3_ONE_INIT   .(1.0f, 1.0f, 1.0f);
	#define GLM_VEC3_ZERO_INIT  .(0.0f, 0.0f, 0.0f);

	#define GLM_VEC3_ONE  ((vec3)GLM_VEC3_ONE_INIT)
	#define GLM_VEC3_ZERO ((vec3)GLM_VEC3_ZERO_INIT)

	#define GLM_YUP       ((vec3).(0.0f,  1.0f,  0.0f))
	#define GLM_ZUP       ((vec3).(0.0f,  0.0f,  1.0f))
	#define GLM_XUP       ((vec3).(1.0f,  0.0f,  0.0f))
	#define GLM_FORWARD   ((vec3).(0.0f,  0.0f, -1.0f))

	#define GLM_XXX GLM_SHUFFLE3(0, 0, 0)
	#define GLM_YYY GLM_SHUFFLE3(1, 1, 1)
	#define GLM_ZZZ GLM_SHUFFLE3(2, 2, 2)
	#define GLM_ZYX GLM_SHUFFLE3(0, 1, 2)*/

	/*!
	 * @brief init vec3 using vec4
	 *
	 * @param[in]  v4   vector4
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3(vec4 v4, vec3 dest);

	/*!
	 * @brief copy all members of [a] to [dest]
	 *
	 * @param[in]  a    source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3_copy(vec3 a, vec3 dest);

	/*!
	 * @brief make vector zero
	 *
	 * @param[in, out]  v vector
	 */
	[CLink] public static extern void glm_vec3_zero(vec3 v);

	/*!
	 * @brief make vector one
	 *
	 * @param[in, out]  v vector
	 */
	[CLink] public static extern void glm_vec3_one(vec3 v);

	/*!
	 * @brief vec3 dot product
	 *
	 * @param[in] a vector1
	 * @param[in] b vector2
	 *
	 * @return dot product
	 */
	[CLink] public static extern float glm_vec3_dot(vec3 a, vec3 b);

	/*!
	 * @brief norm * norm (magnitude) of vec
	 *
	 * we can use this func instead of calling norm * norm, because it would call
	 * sqrtf function twice but with this func we can avoid func call, maybe this is
	 * not good name for this func
	 *
	 * @param[in] v vector
	 *
	 * @return norm * norm
	 */
	[CLink] public static extern float glm_vec3_norm2(vec3 v);

	/*!
	 * @brief euclidean norm (magnitude), also called L2 norm
	 *        this will give magnitude of vector in euclidean space
	 *
	 * @param[in] v vector
	 *
	 * @return norm
	 */
	[CLink] public static extern float glm_vec3_norm(vec3 v);

	/*!
	 * @brief L1 norm of vec3
	 * Also known as Manhattan Distance or Taxicab norm.
	 * L1 Norm is the sum of the magnitudes of the vectors in a space.
	 * It is calculated as the sum of the absolute values of the vector components.
	 * In this norm, all the components of the vector are weighted equally.
	 *
	 * This computes:
	 * R = |v[0]| + |v[1]| + |v[2]|
	 *
	 * @param[in] v vector
	 *
	 * @return L1 norm
	 */
	[CLink] public static extern float glm_vec3_norm_one(vec3 v);

	/*!
	 * @brief infinity norm of vec3
	 * Also known as Maximum norm.
	 * Infinity Norm is the largest magnitude among each element of a vector.
	 * It is calculated as the maximum of the absolute values of the vector components.
	 *
	 * This computes:
	 * inf norm = max(|v[0]|, |v[1]|, |v[2]|)
	 *
	 * @param[in] v vector
	 *
	 * @return infinity norm
	 */
	[CLink] public static extern float glm_vec3_norm_inf(vec3 v);

/*!
 * @brief add a vector to b vector store result in dest
 *
 * @param[in]  a    vector1
 * @param[in]  b    vector2
 * @param[out] dest destination vector
 */
	[CLink] public static extern void glm_vec3_add(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief add scalar to v vector store result in dest (d = v + s)
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec3_adds(vec3 v, float s, vec3 dest);

	/*!
	 * @brief subtract b vector from a vector store result in dest
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec3_sub(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief subtract scalar from v vector store result in dest (d = v - s)
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec3_subs(vec3 v, float s, vec3 dest);

	/*!
	 * @brief multiply two vectors (component-wise multiplication)
	 *
	 * @param a    vector1
	 * @param b    vector2
	 * @param dest v3 = (a[0] * b[0], a[1] * b[1], a[2] * b[2])
	 */
	[CLink] public static extern void glm_vec3_mul(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief multiply/scale vec3 vector with scalar: result = v * s
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec3_scale(vec3 v, float s, vec3 dest);

	/*!
	 * @brief make vec3 vector scale as specified: result = unit(v) * s
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec3_scale_as(vec3 v, float s, vec3 dest);

	/*!
	 * @brief div vector with another component-wise division: d = a / b
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest result = (a[0]/b[0], a[1]/b[1], a[2]/b[2])
	 */
	[CLink] public static extern void glm_vec3_div(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief div vector with scalar: d = v / s
	 *
	 * @param[in]  v    vector
	 * @param[in]  s    scalar
	 * @param[out] dest result = (a[0]/s, a[1]/s, a[2]/s)
	 */
	[CLink] public static extern void glm_vec3_divs(vec3 v, float s, vec3 dest);

	/*!
	 * @brief add two vectors and add result to sum
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += (a + b)
	 */
	[CLink] public static extern void glm_vec3_addadd(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief sub two vectors and add result to dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += (a + b)
	 */
	[CLink] public static extern void glm_vec3_subadd(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief mul two vectors and add result to dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += (a * b)
	 */
	[CLink] public static extern void glm_vec3_muladd(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief mul vector with scalar and add result to sum
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest += (a * b)
	 */
	[CLink] public static extern void glm_vec3_muladds(vec3 a, float s, vec3 dest);

	/*!
	 * @brief add max of two vectors to result/dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += max(a, b)
	 */
	[CLink] public static extern void glm_vec3_maxadd(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief add min of two vectors to result/dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest += min(a, b)
	 */
	[CLink] public static extern void glm_vec3_minadd(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief sub two vectors and sub result to dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= (a - b)
	 */
	[CLink] public static extern void glm_vec3_subsub(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief add two vectors and sub result to dest
	 *
	 * it applies += operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= (a + b)
	 */
	[CLink] public static extern void glm_vec3_addsub(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief mul two vectors and sub result to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= (a * b)
	 */
	[CLink] public static extern void glm_vec3_mulsub(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief mul vector with scalar and sub result to dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector
	 * @param[in]  s    scalar
	 * @param[out] dest dest -= (a * b)
	 */
	[CLink] public static extern void glm_vec3_mulsubs(vec3 a, float s, vec3 dest);

	/*!
	 * @brief sub max of two vectors to result/dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= max(a, b)
	 */
	[CLink] public static extern void glm_vec3_maxsub(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief sub min of two vectors to result/dest
	 *
	 * it applies -= operator so dest must be initialized
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest dest -= min(a, b)
	 */
	[CLink] public static extern void glm_vec3_minsub(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief negate vector components and store result in dest
	 *
	 * @param[in]   v     vector
	 * @param[out]  dest  result vector
	 */
	[CLink] public static extern void glm_vec3_negate_to(vec3 v, vec3 dest);

	/*!
	 * @brief negate vector components
	 *
	 * @param[in, out]  v  vector
	 */
	[CLink] public static extern void glm_vec3_negate(vec3 v);

	/*!
	 * @brief normalize vec3 and store result in same vec
	 *
	 * @param[in, out] v vector
	 */
	[CLink] public static extern void glm_vec3_normalize(vec3 v);

	/*!
	 * @brief normalize vec3 to dest
	 *
	 * @param[in]  v    source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3_normalize_to(vec3 v, vec3 dest);

	/*!
	 * @brief cross product of two vector (RH)
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3_cross(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief cross product of two vector (RH) and normalize the result
	 *
	 * @param[in]  a    vector 1
	 * @param[in]  b    vector 2
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3_crossn(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief angle between two vector
	 *
	 * @param[in] a  vector1
	 * @param[in] b  vector2
	 *
	 * @return angle as radians
	 */
	[CLink] public static extern float glm_vec3_angle(vec3 a, vec3 b);

	/*!
	 * @brief rotate vec3 around axis by angle using Rodrigues' rotation formula
	 *
	 * @param[in, out] v     vector
	 * @param[in]      axis  axis vector (must be unit vector)
	 * @param[in]      angle angle by radians
	 */
	[CLink] public static extern void glm_vec3_rotate(vec3 v, float angle, vec3 axis);

	/*!
	 * @brief apply rotation matrix to vector
	 *
	 *  matrix format should be (no perspective):
	 *   a  b  c  x
	 *   e  f  g  y
	 *   i  j  k  z
	 *   0  0  0  w
	 *
	 * @param[in]  m    affine matrix or rot matrix
	 * @param[in]  v    vector
	 * @param[out] dest rotated vector
	 */
	[CLink] public static extern void glm_vec3_rotate_m4(mat4 m, vec3 v, vec3 dest);

	/*!
	 * @brief apply rotation matrix to vector
	 *
	 * @param[in]  m    affine matrix or rot matrix
	 * @param[in]  v    vector
	 * @param[out] dest rotated vector
	 */
	[CLink] public static extern void glm_vec3_rotate_m3(mat3 m, vec3 v, vec3 dest);

	/*!
	 * @brief project a vector onto b vector
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest projected vector
	 */
	[CLink] public static extern void glm_vec3_proj(vec3 a, vec3 b, vec3 dest);

	/**
	 * @brief find center point of two vector
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest center point
	 */
	[CLink] public static extern void glm_vec3_center(vec3 a, vec3 b, vec3 dest);

	/**
	 * @brief squared distance between two vectors
	 *
	 * @param[in] a vector1
	 * @param[in] b vector2
	 * @return returns squared distance (distance * distance)
	 */
	[CLink] public static extern float glm_vec3_distance2(vec3 a, vec3 b);

	/**
	 * @brief distance between two vectors
	 *
	 * @param[in] a vector1
	 * @param[in] b vector2
	 * @return returns distance
	 */
	[CLink] public static extern float glm_vec3_distance(vec3 a, vec3 b);

	/*!
	 * @brief max values of vectors
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3_maxv(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief min values of vectors
	 *
	 * @param[in]  a    vector1
	 * @param[in]  b    vector2
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3_minv(vec3 a, vec3 b, vec3 dest);

	/*!
	 * @brief possible orthogonal/perpendicular vector
	 *
	 * @param[in]  v    vector
	 * @param[out] dest orthogonal/perpendicular vector
	 */
	[CLink] public static extern void glm_vec3_ortho(vec3 v, vec3 dest);

	/*!
	 * @brief clamp vector's individual members between min and max values
	 *
	 * @param[in, out]  v      vector
	 * @param[in]       minVal minimum value
	 * @param[in]       maxVal maximum value
	 */
	[CLink] public static extern void glm_vec3_clamp(vec3 v, float minVal, float maxVal);

	/*!
	 * @brief linear interpolation between two vectors
	 *
	 * formula:  from + s * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount)
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec3_lerp(vec3 from, vec3 to, float t, vec3 dest);

	/*!
	 * @brief linear interpolation between two vectors (clamped)
	 *
	 * formula:  from + s * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount) clamped between 0 and 1
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec3_lerpc(vec3 from, vec3 to, float t, vec3 dest);

	/*!
	 * @brief linear interpolation between two vectors
	 *
	 * formula:  from + s * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount)
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec3_mix(vec3 from, vec3 to, float t, vec3 dest);

	/*!
	 * @brief linear interpolation between two vectors (clamped)
	 *
	 * formula:  from + s * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount) clamped between 0 and 1
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec3_mixc(vec3 from, vec3 to, float t, vec3 dest);

	/*!
	 * @brief threshold function
	 *
	 * @param[in]   edge    threshold
	 * @param[in]   x       value to test against threshold
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec3_step(vec3 edge, vec3 x, vec3 dest);

	/*!
	 * @brief threshold function with a smooth transition (unidimensional)
	 *
	 * @param[in]   edge0   low threshold
	 * @param[in]   edge1   high threshold
	 * @param[in]   x       value to test against threshold
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec3_smoothstep_uni(float edge0, float edge1, vec3 x, vec3 dest);

	/*!
	 * @brief threshold function with a smooth transition
	 *
	 * @param[in]   edge0   low threshold
	 * @param[in]   edge1   high threshold
	 * @param[in]   x       value to test against threshold
	 * @param[out]  dest    destination
	 */
	[CLink] public static extern void glm_vec3_smoothstep(vec3 edge0, vec3 edge1, vec3 x, vec3 dest);

	/*!
	 * @brief smooth Hermite interpolation between two vectors
	 *
	 * formula:  from + s * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount)
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec3_smoothinterp(vec3 from, vec3 to, float t, vec3 dest);

	/*!
	 * @brief smooth Hermite interpolation between two vectors (clamped)
	 *
	 * formula:  from + s * (to - from)
	 *
	 * @param[in]   from from value
	 * @param[in]   to   to value
	 * @param[in]   t    interpolant (amount) clamped between 0 and 1
	 * @param[out]  dest destination
	 */
	[CLink] public static extern void glm_vec3_smoothinterpc(vec3 from, vec3 to, float t, vec3 dest);

	/*!
	 * @brief swizzle vector components
	 *
	 * you can use existing masks e.g. GLM_XXX, GLM_ZYX
	 *
	 * @param[in]  v    source
	 * @param[in]  mask mask
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_vec3_swizzle(vec3 v, c_int mask, vec3 dest);

	/*!
	 * @brief vec3 cross product
	 *
	 * this is just convenient wrapper
	 *
	 * @param[in]  a source 1
	 * @param[in]  b source 2
	 * @param[out] d destination
	 */
	[CLink] public static extern void glm_cross(vec3 a, vec3 b, vec3 d);

	/*!
	 * @brief vec3 dot product
	 *
	 * this is just convenient wrapper
	 *
	 * @param[in] a vector1
	 * @param[in] b vector2
	 *
	 * @return dot product
	 */
	[CLink] public static extern float glm_dot(vec3 a, vec3 b);

	/*!
	 * @brief normalize vec3 and store result in same vec
	 *
	 * this is just convenient wrapper
	 *
	 * @param[in, out] v vector
	 */
	[CLink] public static extern void glm_normalize(vec3 v);

	/*!
	 * @brief normalize vec3 to dest
	 *
	 * this is just convenient wrapper
	 *
	 * @param[in]  v    source
	 * @param[out] dest destination
	 */
	[CLink] public static extern void glm_normalize_to(vec3 v, vec3 dest);

	/*!
	 * @brief Create three dimensional vector from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest destination vector
	 */
	[CLink] public static extern void glm_vec3_make(float* src, vec3 dest);

	/*!
	 * @brief a vector pointing in the same direction as another
	 *
	 * orients a vector to point away from a surface as defined by its normal
	 *
	 * @param[in] n      vector to orient
	 * @param[in] v      incident vector
	 * @param[in] nref   reference vector
	 * @param[out] dest  oriented vector, pointing away from the surface
	 */
	[CLink] public static extern void glm_vec3_faceforward(vec3 n, vec3 v, vec3 nref, vec3 dest);

	/*!
	 * @brief reflection vector using an incident ray and a surface normal
	 *
	 * @param[in]  v    incident vector
	 * @param[in]  n    normalized normal vector
	 * @param[out] dest reflection result
	 */
	[CLink] public static extern void glm_vec3_reflect(vec3 v, vec3 n, vec3 dest);

	/*!
	 * @brief computes refraction vector for an incident vector and a surface normal.
	 *
	 * calculates the refraction vector based on Snell's law. If total internal reflection
	 * occurs (angle too great given eta), dest is set to zero and returns false.
	 * Otherwise, computes refraction vector, stores it in dest, and returns true.
	 *
	 * @param[in]  v    normalized incident vector
	 * @param[in]  n    normalized normal vector
	 * @param[in]  eta  ratio of indices of refraction (incident/transmitted)
	 * @param[out] dest refraction vector if refraction occurs; zero vector otherwise
	 *
	 * @returns true if refraction occurs; false if total internal reflection occurs.
	 */
	[CLink] public static extern bool glm_vec3_refract(vec3 v, vec3 n, float eta, vec3 dest);
}