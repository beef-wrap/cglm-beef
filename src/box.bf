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
	 * @brief apply transform to Axis-Aligned Bounding Box
	 *
	 * @param[in]  box  bounding box
	 * @param[in]  m    transform matrix
	 * @param[out] dest transformed bounding box
	 */
	[CLink] public static extern void glm_aabb_transform(vec3[2] box_, mat4 m, vec3[2] dest);

	/*!
	 * @brief merges two AABB bounding box and creates new one
	 *
	 * two box must be in same space, if one of box is in different space then
	 * you should consider to convert it's space by glm_box_space
	 *
	 * @param[in]  box1 bounding box 1
	 * @param[in]  box2 bounding box 2
	 * @param[out] dest merged bounding box
	 */
	[CLink] public static extern void glm_aabb_merge(vec3[2] box_1, vec3[2] box_2, vec3[2] dest);

	/*!
	 * @brief crops a bounding box with another one.
	 *
	 * this could be useful for getting a bbox which fits with view frustum and
	 * object bounding boxes. In this case you crop view frustum box with objects
	 * box
	 *
	 * @param[in]  box     bounding box 1
	 * @param[in]  cropBox crop box
	 * @param[out] dest    cropped bounding box
	 */
	[CLink] public static extern void glm_aabb_crop(vec3[2] box_, vec3[2] cropBox, vec3[2] dest);

	/*!
	 * @brief crops a bounding box with another one.
	 *
	 * this could be useful for getting a bbox which fits with view frustum and
	 * object bounding boxes. In this case you crop view frustum box with objects
	 * box
	 *
	 * @param[in]  box      bounding box
	 * @param[in]  cropBox  crop box
	 * @param[in]  clampBox minimum box
	 * @param[out] dest     cropped bounding box
	 */
	[CLink] public static extern void glm_aabb_crop_until(vec3[2] box_, vec3[2] cropBox, vec3[2] clampBox, vec3[2] dest);

	/*!
	 * @brief check if AABB intersects with frustum planes
	 *
	 * this could be useful for frustum culling using AABB.
	 *
	 * OPTIMIZATION HINT:
	 *  if planes order is similar to LEFT, RIGHT, BOTTOM, TOP, NEAR, FAR
	 *  then this method should run even faster because it would only use two
	 *  planes if object is not inside the two planes
	 *  fortunately cglm extracts planes as this order! just pass what you got!
	 *
	 * @param[in]  box     bounding box
	 * @param[in]  planes  frustum planes
	 */
	[CLink] public static extern bool glm_aabb_frustum(vec3[2] box_, vec4[6] planes);

	/*!
	 * @brief invalidate AABB min and max values
	 *
	 * @param[in, out]  box bounding box
	 */
	[CLink] public static extern void glm_aabb_invalidate(vec3[2] box_);

	/*!
	 * @brief check if AABB is valid or not
	 *
	 * @param[in]  box bounding box
	 */
	[CLink] public static extern bool glm_aabb_isvalid(vec3[2] box_);

	/*!
	 * @brief distance between of min and max
	 *
	 * @param[in]  box bounding box
	 */
	[CLink] public static extern float glm_aabb_size(vec3[2] box_);

	/*!
	 * @brief radius of sphere which surrounds AABB
	 *
	 * @param[in]  box bounding box
	 */
	[CLink] public static extern float glm_aabb_radius(vec3[2] box_);


	/*!
	 * @brief computes center point of AABB
	 *
	 * @param[in]   box  bounding box
	 * @param[out]  dest center of bounding box
	 */
	[CLink] public static extern void glm_aabb_center(vec3[2] box_, vec3 dest);

	/*!
	 * @brief check if two AABB intersects
	 *
	 * @param[in]   box    bounding box
	 * @param[in]   other  other bounding box
	 */
	[CLink] public static extern bool glm_aabb_aabb(vec3[2] box_, vec3[2] other);

	/*!
	 * @brief check if AABB intersects with sphere
	 *
	 * https://github.com/erich666/GraphicsGems/blob/master/gems/BoxSphere.c
	 * Solid Box - Solid Sphere test.
	 *
	 * Sphere Representation in cglm: [center.x, center.y, center.z, radii]
	 *
	 * @param[in]   box    solid bounding box
	 * @param[in]   s      solid sphere
	 */
	[CLink] public static extern bool glm_aabb_sphere(vec3[2] box_, vec4 s);

	/*!
	 * @brief check if point is inside of AABB
	 *
	 * @param[in]   box    bounding box
	 * @param[in]   point  point
	 */
	[CLink] public static extern bool glm_aabb_point(vec3[2] box_, vec3 point);

	/*!
	* @brief check if AABB contains other AABB
	*
	* @param[in]   box    bounding box
	* @param[in]   other  other bounding box
	*/
	[CLink] public static extern bool glm_aabb_contains(vec3[2] box_, vec3[2] other);
}