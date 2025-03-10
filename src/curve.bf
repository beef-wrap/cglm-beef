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
	/*!
	 * @brief helper function to calculate S*M*C multiplication for curves
	 *
	 * This function does not encourage you to use SMC,
	 * instead it is a helper if you use SMC.
	 *
	 * if you want to specify S as vector then use more generic glm_mat4_rmc() func.
	 *
	 * Example usage:
	 *  B(s) = glm_smc(s, GLM_BEZIER_MAT, (vec4){p0, c0, c1, p1})
	 *
	 * @param[in]  s  parameter between 0 and 1 (this will be [s3, s2, s, 1])
	 * @param[in]  m  basis matrix
	 * @param[in]  c  position/control vector
	 *
	 * @return B(s)
	 */
	[CLink] public static extern float glm_smc(float s, mat4 m, vec4 c);
}