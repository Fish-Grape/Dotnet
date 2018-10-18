using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo
{
    public class MarxMath
    {
        public static void Marx()
        {
            int x, y, z, count = 0;
            for (x=1;x<=9;x++)
            {
                y = 20 - 2 * x;
                z = 30 - x - y;
                if (3*x+2*y+z==50)
                {
                    Console.WriteLine($"x:{x},y:{y},z:{z}");
                }
            }

        }
    }
}