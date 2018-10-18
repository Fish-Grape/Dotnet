using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo
{
    public class EinsteinLadder
    {
        public static int CountLadder1()
        {
            int n = 1;
            while (!(n % 2 == 1 && n % 3 == 2 && n % 5 == 4 && n % 6 == 5 && n % 7 == 0))
                n++;
            return n;
        }

        public static int CountLadder2()
        {
            int n = 1;
            while (!(n % 2 == 1 && n % 3 == 2 && n % 5 == 4 && n % 6 == 5 && n % 7 == 0))
                n+=7;
            return n;
        }
    }
}