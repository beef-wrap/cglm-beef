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
	/*#ifndef CGLM_CLIPSPACE_INCLUDE_ALL
	#  if CGLM_CONFIG_CLIP_CONTROL & CGLM_CLIP_CONTROL_ZO_BIT
	#    include "clipspace/project_zo.h"
	#  elif CGLM_CONFIG_CLIP_CONTROL & CGLM_CLIP_CONTROL_NO_BIT
	#    include "clipspace/project_no.h"
	#  endif
	#else
	#  include "clipspace/project_zo.h"
	#  include "clipspace/project_no.h"
	#endif*/

	/*!
	 * @brief maps the specified viewport coordinates into specified space [1]
	 *        the matrix should contain projection matrix.
	 *
	 * if you don't have ( and don't want to have ) an inverse matrix then use
	 * glm_unproject version. You may use existing inverse of matrix in somewhere
	 * else, this is why glm_unprojecti exists to save save inversion cost
	 *
	 * [1] space:
	 *  1- if m = invProj:     View Space
	 *  2- if m = invViewProj: World Space
	 *  3- if m = invMVP:      Object Space
	 *
	 * You probably want to map the coordinates into object space
	 * so use invMVP as m
	 *
	 * Computing viewProj:
	 *   glm_mat4_mul(proj, view, viewProj);
	 *   glm_mat4_mul(viewProj, model, MVP);
	 *   glm_mat4_inv(viewProj, invMVP);
	 *
	 * @param[in]  pos      point/position in viewport coordinates
	 * @param[in]  invMat   matrix (see brief)
	 * @param[in]  vp       viewport as [x, y, width, height]
	 * @param[out] dest     unprojected coordinates
	 */
	[CLink] public static extern void glm_unprojecti(vec3 pos, mat4 invMat, vec4 vp, vec3 dest);

	/*!
	 * @brief maps the specified viewport coordinates into specified space [1]
	 *        the matrix should contain projection matrix.
	 *
	 * this is same as glm_unprojecti except this function get inverse matrix for
	 * you.
	 *
	 * [1] space:
	 *  1- if m = proj:     View Space
	 *  2- if m = viewProj: World Space
	 *  3- if m = MVP:      Object Space
	 *
	 * You probably want to map the coordinates into object space
	 * so use MVP as m
	 *
	 * Computing viewProj and MVP:
	 *   glm_mat4_mul(proj, view, viewProj);
	 *   glm_mat4_mul(viewProj, model, MVP);
	 *
	 * @param[in]  pos      point/position in viewport coordinates
	 * @param[in]  m        matrix (see brief)
	 * @param[in]  vp       viewport as [x, y, width, height]
	 * @param[out] dest     unprojected coordinates
	 */
	[CLink] public static extern void glm_unproject(vec3 pos, mat4 m, vec4 vp, vec3 dest);

	/*!
	 * @brief map object coordinates to window coordinates
	 *
	 * Computing MVP:
	 *   glm_mat4_mul(proj, view, viewProj);
	 *   glm_mat4_mul(viewProj, model, MVP);
	 *
	 * @param[in]  pos      object coordinates
	 * @param[in]  m        MVP matrix
	 * @param[in]  vp       viewport as [x, y, width, height]
	 * @param[out] dest     projected coordinates
	 */
	[CLink] public static extern void glm_project(vec3 pos, mat4 m, vec4 vp, vec3 dest);

	/*!
	 * @brief map object's z coordinate to window coordinates
	 *
	 * Computing MVP:
	 *   glm_mat4_mul(proj, view, viewProj);
	 *   glm_mat4_mul(viewProj, model, MVP);
	 *
	 * @param[in]  v  object coordinates
	 * @param[in]  m  MVP matrix
	 *
	 * @returns projected z coordinate
	 */
	[CLink] public static extern float glm_project_z(vec3 v, mat4 m);

	/*!
	 * @brief define a picking region
	 *
	 * @param[in]  center   center [x, y] of a picking region in window coordinates
	 * @param[in]  size     size [width, height] of the picking region in window coordinates
	 * @param[in]  vp       viewport as [x, y, width, height]
	 * @param[out] dest     projected coordinates
	 */
	[CLink] public static extern void glm_pickmatrix(vec2 center, vec2 size, vec4 vp, mat4 dest);
}