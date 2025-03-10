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
	 * @brief averages the color channels into one value
	 *
	 * @param[in]  rgb RGB color
	 */
	[CLink] public static extern float glm_luminance(vec3 rgb);
}