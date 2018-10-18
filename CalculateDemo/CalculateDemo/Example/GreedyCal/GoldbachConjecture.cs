using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo
{
    public class GoldbachConjecture
    {
        public static void Conjecture()
        {
            int i, n;
            bool[] arr = prime2(2001);
            for (i=4;i<=2000;i+=2)
            {
                for (n = 2; n <= i; n++)
                {
                    //if (prime(n))
                    //{
                    //    if (prime(i - n))
                    //    {
                    //        Console.WriteLine($"i({i})={n}+{i - n}");
                    //        break;
                    //    }
                    //}
                    if(arr[n])
                    {
                        if (arr[i - n])
                        {
                            Console.WriteLine($"i({i})={n}+{i - n}");
                            break;
                        }
                    }
                    if (n == i)
                        Console.WriteLine("error");
                }
            }
        }

        //将2000以内所有素数的布尔值存入数组
        public static bool[] prime2(int n)
        {
            bool[] arr = new bool[n];
            arr[0] = false;
            for (int i = 1; i < arr.Length; i++)
                    arr[i] = prime(i);
            return arr;
        }

        public static bool prime(int i) //判断i是否为素数
        {
            int j;
            if (i <= 1) return false;
            if (i == 2) return true;
            for (j = 2; j <= (int)Math.Sqrt(i); j++)
                if (i % j == 0) return false;
            return true;
        }
    }
}