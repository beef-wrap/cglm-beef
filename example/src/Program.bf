using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using System.Interop;

using static cglm_Beef.cglm;

namespace example;

static class Program
{
	static int Main(params String[] args)
	{
		float[2][2]  src = .(.(1, 2), .(3, 4));
		float[2][2]  dest = .(.(0, 0), .(0, 0));
		glm_aabb2d_copy(src, dest);
		Debug.WriteLine($"{dest[0][0]} {dest[0][1]}");

		return 0;
	}
}