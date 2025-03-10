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
	/*
	 * IMPORTANT:
	 * ----------------------------------------------------------------------------
	 * cglm stores quat as [x, y, z, w] since v0.3.6
	 *
	 * it was [w, x, y, z] before v0.3.6 it has been changed to [x, y, z, w]
	 * with v0.3.6 version.
	 * ----------------------------------------------------------------------------
	 */

	/*#define GLM_QUAT_IDENTITY_INIT  {0.0f, 0.0f, 0.0f, 1.0f}
	#define GLM_QUAT_IDENTITY       ((versor)GLM_QUAT_IDENTITY_INIT)*/

	/*!
	 * @brief makes given quat to identity
	 *
	 * @param[in, out]  q  quaternion
	 */
	[CLink] public static extern void glm_quat_identity(versor q);

	/*!
	 * @brief make given quaternion array's each element identity quaternion
	 *
	 * @param[in, out]  q     quat array (must be aligned (16)
	 *                        if alignment is not disabled)
	 *
	 * @param[in]       count count of quaternions
	 */
	[CLink] public static extern void glm_quat_identity_array(versor*  q, size_t count);

	/*!
	 * @brief inits quaternion with raw values
	 *
	 * @param[out]  q     quaternion
	 * @param[in]   x     x
	 * @param[in]   y     y
	 * @param[in]   z     z
	 * @param[in]   w     w (real part)
	 */
	[CLink] public static extern void glm_quat_init(versor q, float x, float y, float z, float w);

	/*!
	 * @brief creates NEW quaternion with axis vector
	 *
	 * @param[out]  q     quaternion
	 * @param[in]   angle angle (radians)
	 * @param[in]   axis  axis
	 */
	[CLink] public static extern void glm_quatv(versor q, float angle, vec3 axis);

	/*!
	 * @brief creates NEW quaternion with individual axis components
	 *
	 * @param[out]  q     quaternion
	 * @param[in]   angle angle (radians)
	 * @param[in]   x     axis.x
	 * @param[in]   y     axis.y
	 * @param[in]   z     axis.z
	 */
	[CLink] public static extern void glm_quat(versor q, float angle, float x, float y, float z);

	/*!
	 * @brief copy quaternion to another one
	 *
	 * @param[in]  q     quaternion
	 * @param[out] dest  destination
	 */
	[CLink] public static extern void glm_quat_copy(versor q, versor dest);

	/*!
	 * @brief compute quaternion rotating vector A to vector B
	 *
	 * @param[in]   a     vec3 (must have unit length)
	 * @param[in]   b     vec3 (must have unit length)
	 * @param[out]  dest  quaternion (of unit length)
	 */
	[CLink] public static extern void glm_quat_from_vecs(vec3 a, vec3 b, versor dest);

	/*!
	 * @brief returns norm (magnitude) of quaternion
	 *
	 * @param[in]  q  quaternion
	 */
	[CLink] public static extern float glm_quat_norm(versor q);

	/*!
	 * @brief normalize quaternion and store result in dest
	 *
	 * @param[in]   q     quaternion to normalze
	 * @param[out]  dest  destination quaternion
	 */
	[CLink] public static extern void glm_quat_normalize_to(versor q, versor dest);

	/*!
	 * @brief normalize quaternion
	 *
	 * @param[in, out]  q  quaternion
	 */
	[CLink] public static extern void glm_quat_normalize(versor q);

	/*!
	 * @brief dot product of two quaternion
	 *
	 * @param[in]  p  quaternion 1
	 * @param[in]  q  quaternion 2
	 */
	[CLink] public static extern float glm_quat_dot(versor p, versor q);

	/*!
	 * @brief conjugate of quaternion
	 *
	 * @param[in]   q     quaternion
	 * @param[out]  dest  conjugate
	 */
	[CLink] public static extern void glm_quat_conjugate(versor q, versor dest);

	/*!
	 * @brief inverse of non-zero quaternion
	 *
	 * @param[in]   q    quaternion
	 * @param[out]  dest inverse quaternion
	 */
	[CLink] public static extern void glm_quat_inv(versor q, versor dest);

	/*!
	 * @brief add (componentwise) two quaternions and store result in dest
	 *
	 * @param[in]   p    quaternion 1
	 * @param[in]   q    quaternion 2
	 * @param[out]  dest result quaternion
	 */
	[CLink] public static extern void glm_quat_add(versor p, versor q, versor dest);

	/*!
	 * @brief subtract (componentwise) two quaternions and store result in dest
	 *
	 * @param[in]   p    quaternion 1
	 * @param[in]   q    quaternion 2
	 * @param[out]  dest result quaternion
	 */
	[CLink] public static extern void glm_quat_sub(versor p, versor q, versor dest);

	/*!
	 * @brief returns real part of quaternion
	 *
	 * @param[in]   q    quaternion
	 */
	[CLink] public static extern float glm_quat_real(versor q);

	/*!
	 * @brief returns imaginary part of quaternion
	 *
	 * @param[in]   q    quaternion
	 * @param[out]  dest imag
	 */
	[CLink] public static extern void glm_quat_imag(versor q, vec3 dest);

	/*!
	 * @brief returns normalized imaginary part of quaternion
	 *
	 * @param[in]   q    quaternion
	 */
	[CLink] public static extern void glm_quat_imagn(versor q, vec3 dest);

	/*!
	 * @brief returns length of imaginary part of quaternion
	 *
	 * @param[in]   q    quaternion
	 */
	[CLink] public static extern float glm_quat_imaglen(versor q);

	/*!
	 * @brief returns angle of quaternion
	 *
	 * @param[in]   q    quaternion
	 */
	[CLink] public static extern float glm_quat_angle(versor q);

	/*!
	 * @brief axis of quaternion
	 *
	 * @param[in]   q    quaternion
	 * @param[out]  dest axis of quaternion
	 */
	[CLink] public static extern void glm_quat_axis(versor q, vec3 dest);

	/*!
	 * @brief multiplies two quaternion and stores result in dest
	 *        this is also called Hamilton Product
	 *
	 * According to WikiPedia:
	 * The product of two rotation quaternions [clarification needed] will be
	 * equivalent to the rotation q followed by the rotation p
	 *
	 * @param[in]   p     quaternion 1
	 * @param[in]   q     quaternion 2
	 * @param[out]  dest  result quaternion
	 */
	[CLink] public static extern void glm_quat_mul(versor p, versor q, versor dest);

	/*!
	 * @brief convert quaternion to mat4
	 *
	 * @param[in]   q     quaternion
	 * @param[out]  dest  result matrix
	 */
	[CLink] public static extern void glm_quat_mat4(versor q, mat4 dest);

	/*!
	 * @brief convert quaternion to mat4 (transposed)
	 *
	 * @param[in]   q     quaternion
	 * @param[out]  dest  result matrix as transposed
	 */
	[CLink] public static extern void glm_quat_mat4t(versor q, mat4 dest);

	/*!
	 * @brief convert quaternion to mat3
	 *
	 * @param[in]   q     quaternion
	 * @param[out]  dest  result matrix
	 */
	[CLink] public static extern void glm_quat_mat3(versor q, mat3 dest);

	/*!
	 * @brief convert quaternion to mat3 (transposed)
	 *
	 * @param[in]   q     quaternion
	 * @param[out]  dest  result matrix
	 */
	[CLink] public static extern void glm_quat_mat3t(versor q, mat3 dest);

	/*!
	 * @brief interpolates between two quaternions
	 *        using linear interpolation (LERP)
	 *
	 * @param[in]   from  from
	 * @param[in]   to    to
	 * @param[in]   t     interpolant (amount)
	 * @param[out]  dest  result quaternion
	 */
	[CLink] public static extern void glm_quat_lerp(versor from, versor to, float t, versor dest);

	/*!
	 * @brief interpolates between two quaternions
	 *        using linear interpolation (LERP)
	 *
	 * @param[in]   from  from
	 * @param[in]   to    to
	 * @param[in]   t     interpolant (amount) clamped between 0 and 1
	 * @param[out]  dest  result quaternion
	 */
	[CLink] public static extern void glm_quat_lerpc(versor from, versor to, float t, versor dest);

	/*!
	 * @brief interpolates between two quaternions
	 *        taking the shortest rotation path using
	 *        normalized linear interpolation (NLERP)
	 *
	 * @param[in]   from  from
	 * @param[in]   to    to
	 * @param[in]   t     interpolant (amount)
	 * @param[out]  dest  result quaternion
	 */
	[CLink] public static extern void glm_quat_nlerp(versor from, versor to, float t, versor dest);

	/*!
	 * @brief interpolates between two quaternions
	 *        using spherical linear interpolation (SLERP)
	 *
	 * @param[in]   from  from
	 * @param[in]   to    to
	 * @param[in]   t     amount
	 * @param[out]  dest  result quaternion
	 */
	[CLink] public static extern void glm_quat_slerp(versor from, versor to, float t, versor dest);

	/*!
	 * @brief interpolates between two quaternions
	 *        using spherical linear interpolation (SLERP) and always takes the long path
	 *
	 * @param[in]   from  from
	 * @param[in]   to    to
	 * @param[in]   t     amount
	 * @param[out]  dest  result quaternion
	 */
	[CLink] public static extern void glm_quat_slerp_longest(versor from, versor to, float t, versor dest);

	/*!
	 * @brief creates view matrix using quaternion as camera orientation
	 *
	 * @param[in]   eye   eye
	 * @param[in]   ori   orientation in world space as quaternion
	 * @param[out]  dest  view matrix
	 */
	[CLink] public static extern void glm_quat_look(vec3 eye, versor ori, mat4 dest);

	/*!
	 * @brief creates look rotation quaternion
	 *
	 * @param[in]   dir   direction to look
	 * @param[in]   up    up vector
	 * @param[out]  dest  destination quaternion
	 */
	[CLink] public static extern void glm_quat_for(vec3 dir, vec3 up, versor dest);

	/*!
	 * @brief creates look rotation quaternion using source and
	 *        destination positions p suffix stands for position
	 *
	 * @param[in]   from  source point
	 * @param[in]   to    destination point
	 * @param[in]   up    up vector
	 * @param[out]  dest  destination quaternion
	 */
	[CLink] public static extern void glm_quat_forp(vec3 from, vec3 to, vec3 up, versor dest);

	/*!
	 * @brief rotate vector using using quaternion
	 *
	 * @param[in]   q     quaternion
	 * @param[in]   v     vector to rotate
	 * @param[out]  dest  rotated vector
	 */
	[CLink] public static extern void glm_quat_rotatev(versor q, vec3 v, vec3 dest);

	/*!
	 * @brief rotate existing transform matrix using quaternion
	 *
	 * @param[in]   m     existing transform matrix
	 * @param[in]   q     quaternion
	 * @param[out]  dest  rotated matrix/transform
	 */
	[CLink] public static extern void glm_quat_rotate(mat4 m, versor q, mat4 dest);

	/*!
	 * @brief rotate existing transform matrix using quaternion at pivot point
	 *
	 * @param[in, out]   m     existing transform matrix
	 * @param[in]        q     quaternion
	 * @param[out]       pivot pivot
	 */
	[CLink] public static extern void glm_quat_rotate_at(mat4 m, versor q, vec3 pivot);

	/*!
	 * @brief rotate NEW transform matrix using quaternion at pivot point
	 *
	 * this creates rotation matrix, it assumes you don't have a matrix
	 *
	 * this should work faster than glm_quat_rotate_at because it reduces
	 * one glm_translate.
	 *
	 * @param[out]  m     existing transform matrix
	 * @param[in]   q     quaternion
	 * @param[in]   pivot pivot
	 */
	[CLink] public static extern void glm_quat_rotate_atm(mat4 m, versor q, vec3 pivot);

	/*!
	 * @brief Create quaternion from pointer
	 *
	 * @param[in]  src  pointer to an array of floats
	 * @param[out] dest quaternion
	 */
	[CLink] public static extern void glm_quat_make(float*  src, versor dest);
}