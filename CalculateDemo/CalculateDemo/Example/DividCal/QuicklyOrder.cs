using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo.Example.DividCal
{
    /// <summary>
    /// 快速排序
    /// </summary>
    public class QuicklyOrder
    {
        public static int Partition(int[] r,int low,int high)
        {
            int i = low, j = high, pivot = r[low];
            while (i < j)
            {
                while (i < j && r[j] > pivot) j--;
                if (i < j)
                {
                    Common.swap(r,i++,j);
                }
                while (i < j && r[i] < pivot) i++;
                if (i < j)
                {
                    Common.swap(r,i,j--);
                }
            }
            return i;
        }

        /// <summary>
        /// 优化后算法
        /// </summary>
        /// <param name="r"></param>
        /// <param name="low"></param>
        /// <param name="high"></param>
        /// <returns></returns>
        public static int Partition2(int[] r, int low, int high)
        {
            int i = low, j = high, pivot = r[low];
            while (i < j)
            {
                while (i < j && r[j] > pivot) j--;
                while (i < j && r[i] <= pivot) i++;
                if (i < j)
                {
                    Common.swap(r, i++, j--);
                }
            }
            if (r[i] > pivot)
            {
                Common.swap(r,i-1,low);
                return i - 1;
            }
            Common.swap(r, i, low);
            return i;
        }

        public static void QuickSort(int[] R,int low,int high)
        {
            int mid;
            if (low<high)
            {
                //mid = Partition(R, low, high);
                mid = Partition2(R, low, high);
                QuickSort(R, low, mid - 1);
                QuickSort(R, mid+1, high);
            }
        }


        public static void MaoPaoOrder(int[] s) {
            for(int i = 0; i < s.Length-1; i++)
            {
                for (int j = s.Length - 1; j > i; j--)
                {
                    if (s[j] < s[i])
                    {
                        Common.swap(s,j,i);
                    }
                }
            }
        }

        public static void init()
        {
            int i, N;
            Console.WriteLine("请输入数列中的元素个数n为：");
            //N= Convert.ToInt32(Console.ReadLine());
            N = (int)Math.Pow(10,5);
            int[] a = new int[N];
            Console.WriteLine("请依次输入数列中的数据：");
            Random random = new Random();
            for (i = 0; i < N; i++)
            {
                //a[i] = Convert.ToInt32(Console.ReadLine());
                a[i] = random.Next(100);
            }
            QuickSort(a,0,N-1);
            //MaoPaoOrder(a);
            Console.Write("排序后的数组为：");
            foreach (int r in a)
                Console.Write(r + ",");
        }
    }
}