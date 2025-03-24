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
  NOTE:
	angles must be passed as [X-Angle, Y-Angle, Z-angle] order
	For instance you don't pass angles as [Z-Angle, X-Angle, Y-angle] to
	glm_euler_zxy function, All RELATED functions accept angles same order
	which is [X, Y, Z].
  */

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
	* if you have axis order like vec3 orderVec = [0, 1, 2] or [0, 2, 1]...
	* vector then you can convert it to this enum by doing this:
	* @code
	* glm_euler_seq order;
	* order = orderVec[0] | orderVec[1] << 2 | orderVec[2] << 4;
	* @endcode
	* you may need to explicit cast if required
	*/
	public enum glm_euler_seq : c_int
	{
		GLM_EULER_XYZ = 0 << 0 | 1 << 2 | 2 << 4,
		GLM_EULER_XZY = 0 << 0 | 2 << 2 | 1 << 4,
		GLM_EULER_YZX = 1 << 0 | 2 << 2 | 0 << 4,
		GLM_EULER_YXZ = 1 << 0 | 0 << 2 | 2 << 4,
		GLM_EULER_ZXY = 2 << 0 | 0 << 2 | 1 << 4,
		GLM_EULER_ZYX = 2 << 0 | 1 << 2 | 0 << 4
	}

	[CLink] public static extern glm_euler_seq glm_euler_order(int[3] ord);

	/*!
	* @brief extract euler angles (in radians) using xyz order
	*
	* @param[in]  m    affine transform
	* @param[out] dest angles vector [x, y, z]
	*/
	[CLink] public static extern void glm_euler_angles(mat4 m, vec3 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler_xyz(vec3 angles, mat4 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler(vec3 angles, mat4 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler_xzy(vec3 angles, mat4 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler_yxz(vec3 angles, mat4 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler_yzx(vec3 angles, mat4 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler_zxy(vec3 angles, mat4 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler_zyx(vec3 angles, mat4 dest);

	/*!
	* @brief build rotation matrix from euler angles
	*
	* @param[in]  angles angles as vector [Xangle, Yangle, Zangle]
	* @param[in]  ord    euler order
	* @param[out] dest   rotation matrix
	*/
	[CLink] public static extern void glm_euler_by_order(vec3 angles, glm_euler_seq ord, mat4 dest);

	/*!
	* @brief creates NEW quaternion using rotation angles and does
	*        rotations in x y z order (roll pitch yaw)
	* 
	* @param[in]   angles angles x y z (radians)
	* @param[out]  dest   quaternion
	*/
	[CLink] public static extern void glm_euler_xyz_quat(vec3 angles, versor dest);

	/*!
	* @brief creates NEW quaternion using rotation angles and does
	*        rotations in x z y order (roll yaw pitch)
	* 
	* @param[in]   angles angles x y z (radians)
	* @param[out]  dest   quaternion
	*/
	[CLink] public static extern void glm_euler_xzy_quat(vec3 angles, versor dest);

	/*!
	* @brief creates NEW quaternion using rotation angles and does
	*        rotations in y x z order (pitch roll yaw)
	* 
	* @param[in]   angles angles x y z (radians)
	* @param[out]  dest   quaternion
	*/
	[CLink] public static extern void glm_euler_yxz_quat(vec3 angles, versor dest);

	/*!
	* @brief creates NEW quaternion using rotation angles and does
	*        rotations in y z x order (pitch yaw roll)
	* 
	* @param[in]   angles angles x y z (radians)
	* @param[out]  dest   quaternion
	*/
	[CLink] public static extern void glm_euler_yzx_quat(vec3 angles, versor dest);

	/*!
	* @brief creates NEW quaternion using rotation angles and does
	*        rotations in z x y order (yaw roll pitch)
	* 
	* @param[in]   angles angles x y z (radians)
	* @param[out]  dest   quaternion
	*/
	[CLink] public static extern void glm_euler_zxy_quat(vec3 angles, versor dest);

	/*!
	* @brief creates NEW quaternion using rotation angles and does
	*        rotations in z y x order (yaw pitch roll)
	* 
	* @param[in]   angles angles x y z (radians)
	* @param[out]  dest   quaternion
	*/
	[CLink] public static extern void glm_euler_zyx_quat(vec3 angles, versor dest);
}