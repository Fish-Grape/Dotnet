using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo.Example
{
    public class Dijkstra
    {
        public struct Node {
            int v, step;
            Node(int a, int sp)
            {
                v = a;
                step = sp;
            }
        }

        const int N = 100;
        const int INF = (int)1e7;
        static int[,] map =new int[N,N];
        static int[] dist=new int[N] ,p = new int[N];
        static int n, m;
        static bool[] flag = new bool[N];

        #region 时间复杂度O(n²)
        public static void Dijkstra_map(int u)
        {
            for (int i = 1; i <= n; i++)
            {
                dist[i] = map[u, i];
                flag[i] = false;
                if (dist[i] == INF)
                    p[i] = -1;
                else
                    p[i] = u;
            }
            dist[u] = 0;
            flag[u] = true;
            for (int i = 1; i <= n; i++)
            {
                int temp = INF, t = u;
                for (int j = 1; j <= n; j++)
                {
                    if (!flag[j] && dist[j] < temp)
                    {
                        t = j;
                        temp = dist[j];
                    }
                    if (t == u) return;
                    flag[t] = true;
                    for (int k = 1; k <= n; k++)
                    {
                        if (!flag[k] && map[t, k] < INF)
                            if (dist[k] > (dist[t] + map[t, k]))
                            {
                                dist[k] = dist[t] + map[t, k];
                                p[k] = t;
                            }
                    }
                }
            }
        }
        #endregion

        public static void init()
        {
            int u, v, w, st;
            Console.WriteLine("请输入城市的个数:");
            n=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("请输入城市之间路线的个数:");
            m = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("请输入城市之间路线以及距离:");
            for (int i = 1; i <= n; i++)
            {
                for (int j=1;j<=n;j++)
                {
                    map[i,j] = INF;
                }
            }
            //string[] arrs = null;
            int[][] arrs = new int[11][] {
                new int[]{ 1,5,12},
                new int[]{ 5,1,8},
                new int[]{ 1,2,16},
                new int[]{ 2,1,29},
                new int[]{ 5,2,32},
                new int[]{ 2,4,13},
                new int[]{ 4,2,27},
                new int[]{ 1,3,15},
                new int[]{ 3,1,21},
                new int[]{ 3,4,7},
                new int[]{ 4,3,19}
            };
            while (m-- > 0)
            {
                //arrs = Console.ReadLine().Split(" ");
                //u = Convert.ToInt32(arrs[0]);
                //v = Convert.ToInt32(arrs[1]);
                //w = Convert.ToInt32(arrs[2]);
                //map[u, v] = Math.Min(map[u, v], w);
            }
            foreach (int[] arr in arrs)
            {
                u = arr[0];
                v = arr[1];
                w = arr[2];
                map[u, v] = Math.Min(map[u, v], w);
            }
            Console.WriteLine("请输入小明所在的位置:");
            st = Convert.ToInt32(Console.ReadLine());
            Dijkstra_map(st);
            Console.WriteLine("小明所在的位置:"+st);
            for (int i=1;i<=n;i++)
            {
                Console.Write($"小明({st})要去的位置:" + i);
                if(dist[i]==INF)
                    Console.WriteLine($"sorry,无路可达");
                else
                    Console.WriteLine($"最短路径为:{dist[i]}" );
            }
        }
    }
}