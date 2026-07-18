using System;
using System.Diagnostics;

namespace example;

static
{
	using static cglm.cglm;

	[Test]
	static void test()
	{
		float[2][2]  src = .(.(1, 2), .(3, 4));
		float[2][2]  dest = .(.(0, 0), .(0, 0));
		glmc_aabb2d_copy(src, dest);
		Test.Assert(dest[0] == src[0]);
		Test.Assert(dest[1] == src[1]);
	}
}