using CalculateDemo.Example;
using CalculateDemo.Example.HuffmanTree;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace CalculateDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            //Task t = new Task(()=> Console.WriteLine(Fib1(50)));
            //Console.WriteLine("用时:"+ stopwatch.Elapsed);


            //stopwatch.Restart();
            //Console.WriteLine(Fib2(100000));
            //stopwatch.Stop();
            //Console.WriteLine("用时:" + stopwatch.Elapsed);

            //MarxMath.Marx();

            //Console.WriteLine(EinsteinLadder.CountLadder1());
            //stopwatch.Stop();
            //Console.WriteLine(stopwatch.Elapsed);

            //stopwatch.Restart();
            //Console.WriteLine(EinsteinLadder.CountLadder2());
            //stopwatch.Stop();
            //Console.WriteLine(stopwatch.Elapsed);

            //GoldbachConjecture.Conjecture();

            //GreedyCal.JLBAncient();

            //Alibaba.CompareValue();

            //ArrangeMeeting.init();

            //Dijkstra.init();

            HuffmanTree.init();
        }

        public static int Fib1(int n)
        {
            if (n < 0)
                return -1;
            if (n == 1 || n == 2)
                return 1;
            return Fib1(n - 1) + Fib1(n - 2);
        }

        public static int Fib2(int n)
        {
            if (n < 0)
                return -1;
            int[] a = new int[n+1];
            a[1] = 1;
            a[2] = 1;
            for (int i=3;i<=n;i++)
            {
                a[i] = a[i-1]+a[i-2];
            }
            return a[n];
        }
    }
}
