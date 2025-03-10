/*
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
 */

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
	// /* DEPRECATED! use _diag */
	// #define glm_aabb2d_size(aabb)         glm_aabb2d_diag(aabb)

	/*!
	* @brief make [aabb] zero
	*
	* @param[in, out]  aabb aabb
	*/
	[CLink] public static extern void glm_aabb2d_zero(vec2[2] aabb);

	/*!
	* @brief copy all members of [aabb] to [dest]
	*
	* @param[in]  aabb source
	* @param[out] dest destination
	*/
	[CLink] public static extern void glm_aabb2d_copy(vec2[2] aabb, vec2[2] dest);

	/*!
	* @brief apply transform to Axis-Aligned Bounding aabb
	*
	* @param[in]  aabb  bounding aabb
	* @param[in]  m    transform matrix
	* @param[out] dest transformed bounding aabb
	*/
	[CLink] public static extern void glm_aabb2d_transform(vec2[2] aabb, mat3 m, vec2[2] dest);

	/*!
	* @brief merges two AABB bounding aabb and creates new one
	*
	* two aabb must be in same space, if one of aabb is in different space then
	* you should consider to convert it's space by glm_aabb_space
	*
	* @param[in]  aabb1 bounding aabb 1
	* @param[in]  aabb2 bounding aabb 2
	* @param[out] dest merged bounding aabb
	*/
	[CLink] public static extern void glm_aabb2d_merge(vec2[2] aabb1, vec2[2] aabb2, vec2[2] dest);

	/*!
	* @brief crops a bounding aabb with another one.
	*
	* this could be useful for getting a baabb which fits with view frustum and
	* object bounding aabbes. In this case you crop view frustum aabb with objects
	* aabb
	*
	* @param[in]  aabb     bounding aabb 1
	* @param[in]  cropAabb crop aabb
	* @param[out] dest     cropped bounding aabb
	*/
	[CLink] public static extern void glm_aabb2d_crop(vec2[2] aabb, vec2[2] cropAabb, vec2[2] dest);

	/*!
	* @brief crops a bounding aabb with another one.
	*
	* this could be useful for getting a baabb which fits with view frustum and
	* object bounding aabbes. In this case you crop view frustum aabb with objects
	* aabb
	*
	* @param[in]  aabb      bounding aabb
	* @param[in]  cropAabb  crop aabb
	* @param[in]  clampAabb minimum aabb
	* @param[out] dest      cropped bounding aabb
	*/
	[CLink] public static extern void glm_aabb2d_crop_until(vec2[2] aabb, vec2[2] cropAabb, vec2[2] clampAabb, vec2[2] dest);

	/*!
	* @brief invalidate AABB min and max values
	*
	* @param[in, out]  aabb bounding aabb
	*/
	[CLink] public static extern void glm_aabb2d_invalidate(vec2[2] aabb);

	/*!
	* @brief check if AABB is valid or not
	*
	* @param[in]  aabb bounding aabb
	*/
	[CLink] public static extern bool glm_aabb2d_isvalid(vec2[2] aabb);

	/*!
	* @brief distance between of min and max
	*
	* @param[in]  aabb bounding aabb
	*/
	[CLink] public static extern float glm_aabb2d_diag(vec2[2] aabb);

	/*!
	* @brief size of aabb
	*
	* @param[in]  aabb bounding aabb
	* @param[out]  dest size
	*/
	[CLink] public static extern void glm_aabb2d_sizev(vec2[2] aabb, vec2 dest);

	/*!
	* @brief radius of sphere which surrounds AABB
	*
	* @param[in]  aabb bounding aabb
	*/
	[CLink] public static extern float glm_aabb2d_radius(vec2[2] aabb);

	/*!
	* @brief computes center point of AABB
	*
	* @param[in]   aabb  bounding aabb
	* @param[out]  dest center of bounding aabb
	*/
	[CLink] public static extern void glm_aabb2d_center(vec2[2] aabb, vec2 dest);

	/*!
	* @brief check if two AABB intersects
	*
	* @param[in]   aabb    bounding aabb
	* @param[in]   other  other bounding aabb
	*/
	[CLink] public static extern bool glm_aabb2d_aabb(vec2[2] aabb, vec2[2] other);

	/*!
	* @brief check if AABB intersects with a circle
	*
	* Circle Representation in cglm: [center.x, center.y, radii]
	*
	* @param[in]   aabb   solid bounding aabb
	* @param[in]   c      solid circle
	*/
	[CLink] public static extern bool glm_aabb2d_circle(vec2[2] aabb, vec3 c);

	/*!
	* @brief check if point is inside of AABB
	*
	* @param[in]   aabb    bounding aabb
	* @param[in]   point  point
	*/
	[CLink] public static extern bool glm_aabb2d_point(vec2[2] aabb, vec2 point);

	/*!
	* @brief check if AABB contains other AABB
	*
	* @param[in]   aabb    bounding aabb
	* @param[in]   other  other bounding aabb
	*/
	[CLink] public static extern bool glm_aabb2d_contains(vec2[2] aabb, vec2[2] other);
}
