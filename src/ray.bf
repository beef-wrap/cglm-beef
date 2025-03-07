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
	/*!
	 * @brief Möller–Trumbore ray-triangle intersection algorithm
	 * 
	 * @param[in] origin         origin of ray
	 * @param[in] direction      direction of ray
	 * @param[in] v0             first vertex of triangle
	 * @param[in] v1             second vertex of triangle
	 * @param[in] v2             third vertex of triangle
	 * @param[in, out] d         distance to intersection
	 * @return whether there is intersection
	 */
	[CLink] public static extern bool glm_ray_triangle(vec3 origin, vec3 direction, vec3 v0, vec3 v1, vec3 v2, float* d);

	/*!
	 * @brief ray sphere intersection
	 *
	 * returns false if there is no intersection if true:
	 *
	 * - t1 > 0, t2 > 0: ray intersects the sphere at t1 and t2 both ahead of the origin
	 * - t1 < 0, t2 > 0: ray starts inside the sphere, exits at t2
	 * - t1 < 0, t2 < 0: no intersection ahead of the ray ( returns false )
	 * - the caller can check if the intersection points (t1 and t2) fall within a
	 *   specific range (for example, tmin < t1, t2 < tmax) to determine if the
	 *   intersections are within a desired segment of the ray
	 *
	 * @param[in]  origin ray origin
	 * @param[out] dir    normalized ray direction
	 * @param[in]  s      sphere  [center.x, center.y, center.z, radii]
	 * @param[in]  t1     near point1 (closer to origin)
	 * @param[in]  t2     far point2 (farther from origin)
	 *
	 * @returns whether there is intersection
	 */
	[CLink] public static extern bool glm_ray_sphere(vec3 origin, vec3 dir, vec4 s, float* t1, float* t2);

	/*!
	 * @brief point using t by 𝐏(𝑡)=𝐀+𝑡𝐛
	 *
	 * @param[in]  orig  origin of ray
	 * @param[in]  dir   direction of ray
	 * @param[in]  t     parameter
	 * @param[out] point point at t
	 */
	[CLink] public static extern void glm_ray_at(vec3 orig, vec3 dir, float t, vec3 point);
}