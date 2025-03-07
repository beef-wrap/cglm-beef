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
	const mat4 GLM_BEZIER_MAT_INIT =  .((-1.0f,  3.0f, -3.0f,  1.0f),
		.(3.0f, -6.0f,  3.0f,  0.0f),
		.(-3.0f,  3.0f,  0.0f,  0.0f),
		.(1.0f,  0.0f,  0.0f,  0.0f));

	const mat4 GLM_HERMITE_MAT_INIT = .(.(2.0f, -3.0f,  0.0f,  1.0f),
		.(-2.0f,  3.0f,  0.0f,  0.0f),
		.(1.0f, -2.0f,  1.0f,  0.0f),
		.(1.0f, -1.0f,  0.0f,  0.0f));

		/* for C only */
	const mat4 GLM_BEZIER_MAT  = GLM_BEZIER_MAT_INIT;
	const mat4 GLM_HERMITE_MAT = GLM_HERMITE_MAT_INIT;

	const float CGLM_DECASTEL_EPS   = 1e-9f;
	const float CGLM_DECASTEL_MAX   = 1000;
	const float CGLM_DECASTEL_SMALL = 1e-20f;

	/*!
	* @brief cubic bezier interpolation
	*
	* Formula:
	*  B(s) = P0*(1-s)^3 + 3*C0*s*(1-s)^2 + 3*C1*s^2*(1-s) + P1*s^3
	*
	* similar result using matrix:
	*  B(s) = glm_smc(t, GLM_BEZIER_MAT, (vec4){p0, c0, c1, p1})
	*
	* glm_eq(glm_smc(...), glm_bezier(...)) should return TRUE
	*
	* @param[in]  s    parameter between 0 and 1
	* @param[in]  p0   begin point
	* @param[in]  c0   control point 1
	* @param[in]  c1   control point 2
	* @param[in]  p1   end point
	*
	* @return B(s)
	*/
	[CLink] public static extern float glm_bezier(float s, float p0, float c0, float c1, float p1);

	/*!
	* @brief cubic hermite interpolation
	*
	* Formula:
	*  H(s) = P0*(2*s^3 - 3*s^2 + 1) + T0*(s^3 - 2*s^2 + s)
	*            + P1*(-2*s^3 + 3*s^2) + T1*(s^3 - s^2)
	*
	* similar result using matrix:
	*  H(s) = glm_smc(t, GLM_HERMITE_MAT, (vec4){p0, p1, c0, c1})
	*
	* glm_eq(glm_smc(...), glm_hermite(...)) should return TRUE
	*
	* @param[in]  s    parameter between 0 and 1
	* @param[in]  p0   begin point
	* @param[in]  t0   tangent 1
	* @param[in]  t1   tangent 2
	* @param[in]  p1   end point
	*
	* @return H(s)
	*/
	[CLink] public static extern float glm_hermite(float s, float p0, float t0, float t1, float p1);

	/*!
	* @brief iterative way to solve cubic equation
	*
	* @param[in]  prm  parameter between 0 and 1
	* @param[in]  p0   begin point
	* @param[in]  c0   control point 1
	* @param[in]  c1   control point 2
	* @param[in]  p1   end point
	*
	* @return parameter to use in cubic equation
	*/
	[CLink] public static extern float glm_decasteljau(float prm, float p0, float c0, float c1, float p1);
}