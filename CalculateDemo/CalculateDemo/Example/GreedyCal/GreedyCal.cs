using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo
{
    public class GreedyCal
    {
        public static void JLBAncient()
        {
            double c;
            int n;
            Console.WriteLine("请输入重量c及古董个数n");
            c =Convert.ToDouble(Console.ReadLine());
            n = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("请输入每个古董的重量，用空格分开");
            string[] s=Console.ReadLine().Split(" "); 
            double[] w =new double[s.Length];
            for (int i = 0; i < n; i++)
            {
                w[i] =Convert.ToDouble(s[i]);
            }
            Array.Sort(w);
            double temp = 0.0;
            int ans = 0;
            for (int i=0;i<n;i++)
            {
                temp += w[i];
                if (temp <= c)
                    ans++;
                else
                    break;
            }
            Console.WriteLine($"能装入的最大古董数量为:{ans}");
        }
    }
}