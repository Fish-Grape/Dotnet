using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo
{
    public class Common
    {
        public static void swap(int[] s,int index,int target)
        {
            int temp = s[index];
            s[index] = s[target];
            s[target] = temp;
        }

        public static void swap<T>(ref T t1,ref T t2) where T: struct
        {
            T temp = t1;
            t1 = t2;
            t2 = temp;
        }

        public static int scanf()
        {
            return Convert.ToInt32(Console.ReadLine());
        }
    }
}