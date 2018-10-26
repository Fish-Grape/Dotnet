using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo.Example.DividCal
{
    /// <summary>
    /// 合并排序
    /// </summary>
    public class MergeOrder
    {
        public static void Merge(int[] A, int low, int mid, int high)
        {
            int[] B = new int[high - low + 1];
            int i = low, j = mid + 1, k = 0;
            while (i <= mid && j <= high)
            {
                if (A[i] <= A[j])
                    B[k++] = A[i++];
                else
                    B[k++] = A[j++];
            }
            while (i <= mid) B[k++] = A[i++];
            while (j <= high) B[k++] = A[j++];
            for (i = low, k = 0; i <= high; i++)
                A[i] = B[k++];
        }

        public static void MergeSort(int[] A, int low, int high)
        {
            if (low < high)
            {
                int mid = (low + high) / 2;
                MergeSort(A, low, mid);
                MergeSort(A, mid + 1, high);
                Merge(A, low, mid, high);
            }
        }

        public static void init()
        {
            int n;
            Console.WriteLine("请输入数列中的元素个数");
            n = Convert.ToInt32(Console.ReadLine());
            int[] A = new int[n];
            Console.WriteLine("请输入依次输入数列中的元素");
            for(int i=0;i<n;i++)
                A[i] = Convert.ToInt32(Console.ReadLine());
            MergeSort(A,0,n-1);
            Console.WriteLine("合并后的结果:");
            foreach (int r in A)
                Console.Write(r+",");
        }
    }
}
