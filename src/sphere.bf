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
	  Sphere Representation in cglm: [center.x, center.y, center.z, radii]
	
	  You could use this representation or you can convert it to vec4 before call
	  any function
	 */

	/*!
	 * @brief helper for getting sphere radius
	 *
	 * @param[in]   s  sphere
	 *
	 * @return returns radii
	 */
	[CLink] public static extern float glm_sphere_radii(vec4 s);

	/*!
	 * @brief apply transform to sphere, it is just wrapper for glm_mat4_mulv3
	 *
	 * @param[in]  s    sphere
	 * @param[in]  m    transform matrix
	 * @param[out] dest transformed sphere
	 */
	[CLink] public static extern void glm_sphere_transform(vec4 s, mat4 m, vec4 dest);

	/*!
	 * @brief merges two spheres and creates a new one
	 *
	 * two sphere must be in same space, for instance if one in world space then
	 * the other must be in world space too, not in local space.
	 *
	 * @param[in]  s1   sphere 1
	 * @param[in]  s2   sphere 2
	 * @param[out] dest merged/extended sphere
	 */
	[CLink] public static extern void glm_sphere_merge(vec4 s1, vec4 s2, vec4 dest);

	/*!
	 * @brief check if two sphere intersects
	 *
	 * @param[in]   s1  sphere
	 * @param[in]   s2  other sphere
	 */
	[CLink] public static extern bool glm_sphere_sphere(vec4 s1, vec4 s2);

	/*!
	 * @brief check if sphere intersects with point
	 *
	 * @param[in]   s      sphere
	 * @param[in]   point  point
	 */
	[CLink] public static extern bool glm_sphere_point(vec4 s, vec3 point);
}