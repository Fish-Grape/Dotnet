using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo.Example.DividCal
{
    /// <summary>
    /// 大整数除法，因涉及到指针操作，已转移至同名c++项目
    /// </summary>
    public class BigNumberMulti
    {
        private static int M = 100;
        private static char[] sa = new char[1000];
        private static char[] sb = new char[1000];
        private static Node ah = new Node(new int[M], 0, 0),
            al = new Node(new int[M], 0, 0),
            bh = new Node(new int[M], 0, 0),
            bl = new Node(new int[M], 0, 0),
            t1 = new Node(new int[M], 0, 0),
            t2 = new Node(new int[M], 0, 0),
            t3 = new Node(new int[M], 0, 0),
            t4 = new Node(new int[M], 0, 0),
            z = new Node(new int[M], 0, 0);
        public struct Node {
            public int[] s;
            public int l;
            public int c;
            public Node(int[] _s, int _l, int _c)
            {
                s = _s;
                l = _l;
                c = _c;
            }
        }

        public static void cp(Node src,ref Node des, int st, int l)
        {
            int i, j;
            for (i = st, j = 0; i < st + 1; i++, j++)
            {
                des.s[j] = src.s[i];
            }
            des.l = l;
            des.c = st + src.c;
        }

        public static void add(ref Node pa, ref Node pb, Node ans)
        {
            int i, cc, k, palen, pblen, len;
            int ta, tb;
            Node temp;
            if (pa.c < pb.c)
            {
                temp = pa;
                pa = pb;
                pb = temp;
            }
            ans.c = pb.c;
            cc = 0;
            palen = pa.l + pa.c;
            pblen = pb.l + pb.c;
            if (palen > pblen)
                len = palen;
            else
                len = pblen;
            k = pa.c - pb.c;
            for (i = 0; i < len - ans.c; i++)
            {
                if (i < k)
                    ta = 0;
                else
                    ta = pa.s[i - k];
                if (i < pb.l)
                    tb = pb.s[i];
                else
                    tb = 0;
                if (i >= pa.l + k)
                    ta = 0;
                ans.s[i] = (ta + tb + cc) % 10;
                cc = (ta + tb + cc) / 10;
            }
            if (cc > 0)
                ans.s[i++] = cc;
            ans.l = i;
        }

        public static void mul(ref Node pa, ref Node pb, ref Node ans)
        {
            int i, cc, w;
            int ma = pa.l >> 1, mb = pb.l >> 1;
            if (ma <= 0 || mb <= 0)
            {
                if (ma <= 0)
                {
                    Common.swap<Node>(ref pa,ref pb);
                }
                ans.c = pa.c + pb.c;
                w = pb.s[0];
                cc = 0;
                for (i = 0; i < pa.l; i++)
                {
                    ans.s[i] = (w * pa.s[i] + cc) % 10;
                    cc = (w * pa.s[i] + cc) / 10;
                }
                if (cc > 0)
                    ans.s[i++] = cc;
                ans.l = i;
                return;
            }
            cp(pa, ref ah, ma, pa.l - ma);
            cp(pa, ref al, 0,ma);
            cp(pb, ref bl, mb, pb.l - ma);
            cp(pb, ref bh, 0, mb);

            mul(ref ah, ref bh, ref t1);
            mul(ref ah, ref bl, ref t2);
            mul(ref al, ref bh, ref t3);
            mul(ref al, ref bl, ref t4);

            add(ref t3, ref t4,  ans);
            add(ref t2, ref ans, z);
            add(ref t1, ref z, ans);
        }

        public static void init()
        {
            Node ans = new Node(new int[M], 0, 0),
                a= new Node(new int[M], 0, 0),
                b= new Node(new int[M], 0, 0);
            Console.WriteLine("请输入大整数a:");
            string sa = Console.ReadLine();
            Console.WriteLine("请输入大整数b:");
            string sb = Console.ReadLine();
            a.l = sa.Length;
            b.l = sb.Length;
            int z = 0, i;
            for (i = a.l - 1; i >= 0; i--)
                a.s[z++] = sa[i] - '0';
            a.c = 0;
            z = 0;
            for (i = b.l - 1; i >= 0; i--)
                b.s[z++] = sb[i] - '0';
            b.c = 0;
            mul(ref a, ref b, ref ans);
            Console.Write("最终结果为:");
            for (i=ans.l - 1; i>= 0; i--)
                Console.Write(ans.s[i]);
            Console.WriteLine();
        }
    }
}