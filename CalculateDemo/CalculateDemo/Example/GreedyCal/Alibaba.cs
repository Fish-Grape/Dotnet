using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo
{
    public class Alibaba
    {
        public struct three {
            public double w;//重量
            public double v;//价值
            public double p;//性价比
            public three(double _w, double _v, double _p)
            {
                w = _w;
                v = _v;
                p = _p;
            }

            public override string ToString()
            {
                return  "w:"+w.ToString()+" v:"+v.ToString()+" p:"+p.ToString();
            }
        } 

        public static bool cmp(three a, three b)
        {
            return a.p > b.p;
        }

        public static void CompareValue()
        {
            int n=6;
            double m=19;
            three[] s = new three[] { new three(2,8,(double)8/4) 
                , new three(6, 1, (double)1 / 6)
                , new three(7, 9, (double)9 / 7)
                , new three(4, 3, (double)3 / 4)
                , new three(10, 2, (double)2 / 10)
                , new three(3, 4, (double)4 / 3)
            };
            three min = new three();
            for (int i = 0; i < s.Length - 1; i++)
            {
                for (int j = (s.Length-2); j >=i; j--)
                {
                    if (cmp(s[j+1], s[j]))
                    {
                        min = s[j];
                        s[j] = s[j + 1];
                        s[j + 1] = min;
                    }
                }
            }
            //foreach (three t in s)
            //{
            //    Console.WriteLine(t.ToString());
            //}
            double sum = 0.0;
            for (int i = 0; i < n; i++)
            {
                if (m > s[i].w)
                {
                    m -= s[i].w;
                    sum += s[i].v;
                }
                else
                {
                    sum += m * s[i].p;
                    break;
                }
            }
            Console.WriteLine($"装入最大宝物的价值(sum)：{sum}");
        }
    }
}