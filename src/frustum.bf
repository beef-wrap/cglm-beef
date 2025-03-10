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
	const c_int GLM_LBN = 0; /* left  bottom near */
	const c_int GLM_LTN = 1; /* left  top    near */
	const c_int GLM_RTN = 2; /* right top    near */
	const c_int GLM_RBN = 3; /* right bottom near */

	const c_int GLM_LBF = 4; /* left  bottom far  */
	const c_int GLM_LTF = 5; /* left  top    far  */
	const c_int GLM_RTF = 6; /* right top    far  */
	const c_int GLM_RBF = 7; /* right bottom far  */

	const c_int GLM_LEFT   = 0;
	const c_int GLM_RIGHT  = 1;
	const c_int GLM_BOTTOM = 2;
	const c_int GLM_TOP    = 3;
	const c_int GLM_NEAR   = 4;
	const c_int GLM_FAR    = 5;

#if !GLM_CUSTOM_CLIPSPACE
	/* you can override clip space coords
	but you have to provide all with same name
	e.g.: define GLM_CSCOORD_LBN {0.0f, 0.0f, 1.0f, 1.0f} */

	/* near */
	const vec4 GLM_CSCOORD_LBN = .(-1.0f, -1.0f, -1.0f, 1.0f);
	const vec4 GLM_CSCOORD_LTN = .(-1.0f,  1.0f, -1.0f, 1.0f);
	const vec4 GLM_CSCOORD_RTN = .(1.0f,  1.0f, -1.0f, 1.0f);
	const vec4 GLM_CSCOORD_RBN = .(1.0f, -1.0f, -1.0f, 1.0f);

	/* far */
	const vec4 GLM_CSCOORD_LBF = .(-1.0f, -1.0f,  1.0f, 1.0f);
	const vec4 GLM_CSCOORD_LTF = .(-1.0f,  1.0f,  1.0f, 1.0f);
	const vec4 GLM_CSCOORD_RTF = .(1.0f,  1.0f,  1.0f, 1.0f);
	const vec4 GLM_CSCOORD_RBF = .(1.0f, -1.0f,  1.0f, 1.0f);
#endif

	/*!
	 * @brief extracts view frustum planes
	 *
	 * planes' space:
	 *  1- if m = proj:     View Space
	 *  2- if m = viewProj: World Space
	 *  3- if m = MVP:      Object Space
	 *
	 * You probably want to extract planes in world space so use viewProj as m
	 * Computing viewProj:
	 *   glm_mat4_mul(proj, view, viewProj);
	 *
	 * Exracted planes order: [left, right, bottom, top, near, far]
	 *
	 * @param[in]  m    matrix (see brief)
	 * @param[out] dest extracted view frustum planes (see brief)
	 */
	[CLink] public static extern void glm_frustum_planes(mat4 m, vec4[6] dest);

	/*!
	 * @brief extracts view frustum corners using clip-space coordinates
	 *
	 * corners' space:
	 *  1- if m = invViewProj: World Space
	 *  2- if m = invMVP:      Object Space
	 *
	 * You probably want to extract corners in world space so use invViewProj
	 * Computing invViewProj:
	 *   glm_mat4_mul(proj, view, viewProj);
	 *   ...
	 *   glm_mat4_inv(viewProj, invViewProj);
	 *
	 * if you have a near coord at i index, you can get it's far coord by i + 4
	 *
	 * Find center coordinates:
	 *   for (j = 0; j < 4; j++) {
	 *     glm_vec3_center(corners[i], corners[i + 4], centerCorners[i]);
	 *   }
	 *
	 * @param[in]  invMat matrix (see brief)
	 * @param[out] dest   exracted view frustum corners (see brief)
	 */
	[CLink] public static extern void glm_frustum_corners(mat4 invMat, vec4[8] dest);

	/*!
	 * @brief finds center of view frustum
	 *
	 * @param[in]  corners view frustum corners
	 * @param[out] dest    view frustum center
	 */
	[CLink] public static extern void glm_frustum_center(vec4[8] corners, vec4 dest);

	/*!
	 * @brief finds bounding box of frustum relative to given matrix e.g. view mat
	 *
	 * @param[in]  corners view frustum corners
	 * @param[in]  m       matrix to convert existing conners
	 * @param[out] box     bounding box as array [min, max]
	 */
	[CLink] public static extern void glm_frustum_box(vec4[8] corners, mat4 m, vec3[2] box_);

	/*!
	 * @brief finds planes corners which is between near and far planes (parallel)
	 *
	 * this will be helpful if you want to split a frustum e.g. CSM/PSSM. This will
	 * find planes' corners but you will need to one more plane.
	 * Actually you have it, it is near, far or created previously with this func ;)
	 *
	 * @param[in]  corners view  frustum corners
	 * @param[in]  splitDist     split distance
	 * @param[in]  farDist       far distance (zFar)
	 * @param[out] planeCorners  plane corners [LB, LT, RT, RB]
	 */
	[CLink] public static extern void glm_frustum_corners_at(vec4[8] corners, float splitDist, float farDist, vec4[4] planeCorners);
}