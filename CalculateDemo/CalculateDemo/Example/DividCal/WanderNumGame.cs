using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo.Example.DividCal
{
    /// <summary>
    /// 二分搜索
    /// </summary>
    public class WanderNumGame
    {
        private const int M = 10000;
        private static int x, n, i;

        /// <summary>
        /// 常规实现
        /// </summary>
        /// <param name="n"></param>
        /// <param name="s"></param>
        /// <param name="x"></param>
        /// <returns></returns>
        public static int BinarySearch(int n,int[] s,int x)
        {
            int low = 0, high = n - 1;
            while (low <= high)
            {
                int middle = (low + high) / 2;
                if (x == s[middle])
                    return middle;
                else if (x < s[middle])
                    high = middle - 1;
                else
                    low = middle + 1;
            }
            return -1;
        }

        /// <summary>
        /// 递归实现
        /// </summary>
        /// <param name="s"></param>
        /// <param name="x"></param>
        /// <param name="low"></param>
        /// <param name="high"></param>
        /// <returns></returns>
        public static int BinarySearch(int[] s, int x,int low,int high)
        {
            if (low > high)
                return -1;
            int middle = (low + high) / 2;
            if (x == s[middle])
                return middle;
            else if (x < s[middle])
                return BinarySearch(s, x, low, high - 1);
            else
                return BinarySearch(s, x, middle + 1, high);
        }

        public static void init()
        {
        Console.WriteLine("请输入数列中的元素个数n为：");
            n =Convert.ToInt32( Console.ReadLine());
            int[] s = new int[n];
            while (n > 0)
            {
                Console.WriteLine("请依次输入数列中的数据：");
                for (i = 0; i < n; i++)
                    s[i] = Convert.ToInt32(Console.ReadLine()); ;
                Array.Sort(s);
                Console.WriteLine("排序后的数组为：");
                foreach (int i in s)
                    Console.WriteLine(i+ " ");
                Console.WriteLine("请输入要查找的元素：");
                x= Convert.ToInt32(Console.ReadLine());
                //i = BinarySearch(n,s,x);
                i = BinarySearch(s, x, 0, n - 1);
                if (i==-1)
                    Console.WriteLine("该数列中没有要查找的元素：");
                else
                    Console.WriteLine($"要查找的元素在第{i+1}位");
            }
        }
    }
}