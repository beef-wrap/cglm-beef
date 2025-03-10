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
	// #ifndef CGLM_CLIPSPACE_INCLUDE_ALL
	// #  if CGLM_CONFIG_CLIP_CONTROL == CGLM_CLIP_CONTROL_LH_ZO
	// #    include "clipspace/ortho_lh_zo.h"
	// #    include "clipspace/persp_lh_zo.h"
	// #    include "clipspace/view_lh_zo.h"
	// #  elif CGLM_CONFIG_CLIP_CONTROL == CGLM_CLIP_CONTROL_LH_NO
	// #    include "clipspace/ortho_lh_no.h"
	// #    include "clipspace/persp_lh_no.h"
	// #    include "clipspace/view_lh_no.h"
	// #  elif CGLM_CONFIG_CLIP_CONTROL == CGLM_CLIP_CONTROL_RH_ZO
	// #    include "clipspace/ortho_rh_zo.h"
	// #    include "clipspace/persp_rh_zo.h"
	// #    include "clipspace/view_rh_zo.h"
	// #  elif CGLM_CONFIG_CLIP_CONTROL == CGLM_CLIP_CONTROL_RH_NO
	// #    include "clipspace/ortho_rh_no.h"
	// #    include "clipspace/persp_rh_no.h"
	// #    include "clipspace/view_rh_no.h"
	// #  endif
	// #else
	// #  include "clipspace/ortho_lh_zo.h"
	// #  include "clipspace/persp_lh_zo.h"
	// #  include "clipspace/ortho_lh_no.h"
	// #  include "clipspace/persp_lh_no.h"
	// #  include "clipspace/ortho_rh_zo.h"
	// #  include "clipspace/persp_rh_zo.h"
	// #  include "clipspace/ortho_rh_no.h"
	// #  include "clipspace/persp_rh_no.h"
	// #  include "clipspace/view_lh_zo.h"
	// #  include "clipspace/view_lh_no.h"
	// #  include "clipspace/view_rh_zo.h"
	// #  include "clipspace/view_rh_no.h"
	// #endif

	/*!
	 * @brief set up perspective peprojection matrix
	 *
	 * @param[in]  left    viewport.left
	 * @param[in]  right   viewport.right
	 * @param[in]  bottom  viewport.bottom
	 * @param[in]  top     viewport.top
	 * @param[in]  nearZ   near clipping plane
	 * @param[in]  farZ    far clipping plane
	 * @param[out] dest    result matrix
	 */
	[CLink] public static extern void glm_frustum(float left, float right, float bottom,  float top, float nearZ,   float farZ, mat4  dest);

	/*!
	 * @brief set up orthographic projection matrix
	 *
	 * @param[in]  left    viewport.left
	 * @param[in]  right   viewport.right
	 * @param[in]  bottom  viewport.bottom
	 * @param[in]  top     viewport.top
	 * @param[in]  nearZ   near clipping plane
	 * @param[in]  farZ    far clipping plane
	 * @param[out] dest    result matrix
	 */
	[CLink] public static extern void glm_ortho(float left, float right, float bottom,  float top, float nearZ,   float farZ, mat4  dest);

	/*!
	 * @brief set up orthographic projection matrix using bounding box
	 *
	 * bounding box (AABB) must be in view space
	 *
	 * @param[in]  box   AABB
	 * @param[out] dest  result matrix
	 */
	[CLink] public static extern void glm_ortho_aabb(vec3[2] box_, mat4 dest);

	/*!
	 * @brief set up orthographic projection matrix using bounding box
	 *
	 * bounding box (AABB) must be in view space
	 *
	 * @param[in]  box     AABB
	 * @param[in]  padding padding
	 * @param[out] dest    result matrix
	 */
	[CLink] public static extern void glm_ortho_aabb_p(vec3[2] box_, float padding, mat4 dest);

	/*!
	 * @brief set up orthographic projection matrix using bounding box
	 *
	 * bounding box (AABB) must be in view space
	 *
	 * @param[in]  box     AABB
	 * @param[in]  padding padding for near and far
	 * @param[out] dest    result matrix
	 */
	[CLink] public static extern void glm_ortho_aabb_pz(vec3[2] box_, float padding, mat4 dest);

	/*!
	 * @brief set up unit orthographic projection matrix
	 *
	 * @param[in]  aspect aspect ration ( width / height )
	 * @param[out] dest   result matrix
	 */
	[CLink] public static extern void glm_ortho_default(float aspect, mat4 dest);

	/*!
	 * @brief set up orthographic projection matrix with given CUBE size
	 *
	 * @param[in]  aspect aspect ratio ( width / height )
	 * @param[in]  size   cube size
	 * @param[out] dest   result matrix
	 */
	[CLink] public static extern void glm_ortho_default_s(float aspect, float size, mat4 dest);

	/*!
	 * @brief set up perspective projection matrix
	 *
	 * @param[in]  fovy    field of view angle
	 * @param[in]  aspect  aspect ratio ( width / height )
	 * @param[in]  nearZ   near clipping plane
	 * @param[in]  farZ    far clipping planes
	 * @param[out] dest    result matrix
	 */
	[CLink] public static extern void glm_perspective(float fovy, float aspect, float nearZ, float farZ, mat4 dest);

	/*!
	 * @brief extend perspective projection matrix's far distance
	 *
	 * this function does not guarantee far >= near, be aware of that!
	 *
	 * @param[in, out] proj      projection matrix to extend
	 * @param[in]      deltaFar  distance from existing far (negative to shink)
	 */
	[CLink] public static extern void glm_persp_move_far(mat4 proj, float deltaFar);

	/*!
	 * @brief set up perspective projection matrix with default near/far
	 *        and angle values
	 *
	 * @param[in]  aspect aspect ratio ( width / height )
	 * @param[out] dest   result matrix
	 */
	[CLink] public static extern void glm_perspective_default(float aspect, mat4 dest);

	/*!
	 * @brief resize perspective matrix by aspect ratio ( width / height )
	 *        this makes very easy to resize proj matrix when window /viewport
	 *        reized
	 *
	 * @param[in]      aspect aspect ratio ( width / height )
	 * @param[in, out] proj   perspective projection matrix
	 */
	[CLink] public static extern void glm_perspective_resize(float aspect, mat4 proj);

	/*!
	 * @brief set up view matrix
	 *
	 * NOTE: The UP vector must not be parallel to the line of sight from
	 *       the eye point to the reference point
	 *
	 * @param[in]  eye    eye vector
	 * @param[in]  center center vector
	 * @param[in]  up     up vector
	 * @param[out] dest   result matrix
	 */
	[CLink] public static extern void glm_lookat(vec3 eye, vec3 center, vec3 up, mat4 dest);

	/*!
	 * @brief set up view matrix
	 *
	 * convenient wrapper for lookat: if you only have direction not target self
	 * then this might be useful. Because you need to get target from direction.
	 *
	 * NOTE: The UP vector must not be parallel to the line of sight from
	 *       the eye point to the reference point
	 *
	 * @param[in]  eye    eye vector
	 * @param[in]  dir    direction vector
	 * @param[in]  up     up vector
	 * @param[out] dest   result matrix
	 */
	[CLink] public static extern void glm_look(vec3 eye, vec3 dir, vec3 up, mat4 dest);

	/*!
	 * @brief set up view matrix
	 *
	 * convenient wrapper for look: if you only have direction and if you don't
	 * care what UP vector is then this might be useful to create view matrix
	 *
	 * @param[in]  eye    eye vector
	 * @param[in]  dir    direction vector
	 * @param[out] dest   result matrix
	 */
	[CLink] public static extern void glm_look_anyup(vec3 eye, vec3 dir, mat4 dest);

	/*!
	 * @brief decomposes frustum values of perspective projection.
	 *
	 * @param[in]  proj    perspective projection matrix
	 * @param[out] nearZ   near
	 * @param[out] farZ    far
	 * @param[out] top     top
	 * @param[out] bottom  bottom
	 * @param[out] left    left
	 * @param[out] right   right
	 */
	[CLink] public static extern void glm_persp_decomp(mat4 proj, float* nearZ, float* farZ, float* top,   float* bottom, float* left,  float* right);

	/*!
	 * @brief decomposes frustum values of perspective projection.
	 *        this makes easy to get all values at once
	 *
	 * @param[in]  proj   perspective projection matrix
	 * @param[out] dest   array
	 */
	[CLink] public static extern void glm_persp_decompv(mat4 proj, float[6] dest);

	/*!
	 * @brief decomposes left and right values of perspective projection.
	 *        x stands for x axis (left / right axis)
	 *
	 * @param[in]  proj  perspective projection matrix
	 * @param[out] left  left
	 * @param[out] right right
	 */
	[CLink] public static extern void glm_persp_decomp_x(mat4 proj, float* left, float* right);

	/*!
	 * @brief decomposes top and bottom values of perspective projection.
	 *        y stands for y axis (top / bottom axis)
	 *
	 * @param[in]  proj   perspective projection matrix
	 * @param[out] top    top
	 * @param[out] bottom bottom
	 */
	[CLink] public static extern void glm_persp_decomp_y(mat4 proj, float* top, float* bottom);

	/*!
	 * @brief decomposes near and far values of perspective projection.
	 *        z stands for z axis (near / far axis)
	 *
	 * @param[in]  proj    perspective projection matrix
	 * @param[out] nearZ   near
	 * @param[out] farZ    far
	 */
	[CLink] public static extern void glm_persp_decomp_z(mat4 proj, float* nearZ, float* farZ);

	/*!
	 * @brief decomposes far value of perspective projection.
	 *
	 * @param[in]  proj   perspective projection matrix
	 * @param[out] farZ   far
	 */
	[CLink] public static extern void glm_persp_decomp_far(mat4 proj, float* farZ);

	/*!
	 * @brief decomposes near value of perspective projection.
	 *
	 * @param[in]  proj   perspective projection matrix
	 * @param[out] nearZ  near
	 */
	[CLink] public static extern void glm_persp_decomp_near(mat4 proj, float* nearZ);

	/*!
	 * @brief returns sizes of near and far planes of perspective projection
	 *
	 * @param[in]  proj perspective projection matrix
	 * @param[in]  fovy fovy (see brief)
	 * @param[out] dest sizes order: [Wnear, Hnear, Wfar, Hfar]
	 */
	[CLink] public static extern void glm_persp_sizes(mat4 proj, float fovy, vec4 dest);
}