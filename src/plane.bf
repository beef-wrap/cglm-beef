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
	/*
	 Plane equation:  Ax + By + Cz + D = 0;
	
	 It stored in vec4 as [A, B, C, D]. (A, B, C) is normal and D is distance
	*/

	/*!
	 * @brief normalizes a plane
	 *
	 * @param[in, out] plane plane to normalize
	 */
	[CLink] public static extern void glm_plane_normalize(vec4 plane);
}