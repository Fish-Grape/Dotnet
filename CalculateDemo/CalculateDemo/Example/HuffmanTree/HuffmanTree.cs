using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo.Example.HuffmanTree
{
    public class HuffmanTree
    {
        private static int MAXBIT = 100
            , MAXVALUE = 10000
            , MAXLEAF = 30
            , MAXNODE = MAXLEAF * 2 - 1;
        private static HNodeType[] HuffNode=new HNodeType[MAXNODE];
        private static HCodeType[] HuffCode = new HCodeType[MAXLEAF];

        public struct HNodeType {
            public double weight;
            public int parent;
            public int lchild;
            public int rchild;
            public char value;
        }

        public struct HCodeType
        {
            public int[] bit;
            public int start;
            public HCodeType(int[] _bit,int _start)
            {
                bit = _bit;
                start = _start;
            }
        }

        public static void Huffman_Tree(HNodeType[] HuffNode,int n)
        {
            int i, j, x1, x2;
            double m1, m2;
            for (i=0;i<2*-1;i++)
            {
                HuffNode[i].weight=0;
                HuffNode[i].parent=-1;
                HuffNode[i].lchild= -1;
                HuffNode[i].rchild= -1;
            }
            Console.WriteLine("请输入value和位权");
            HuffNode[0].weight = 0.05;
            HuffNode[1].weight = 0.32;
            HuffNode[2].weight = 0.18;
            HuffNode[3].weight = 0.07;
            HuffNode[4].weight = 0.25;
            HuffNode[5].weight = 0.13;
            HuffNode[0].value = 'a';
            HuffNode[1].value = 'b';
            HuffNode[2].value = 'c';
            HuffNode[3].value = 'd';
            HuffNode[4].value = 'e';
            HuffNode[5].value = 'f';
            for (i=0;i<n-1;i++)
            {
                m1 = m2 = MAXVALUE;
                x1 = x2 = 0;
                for (j=0;j<n+1;j++)
                {
                    if (HuffNode[j].weight < m1 && HuffNode[j].parent == -1)
                    {
                        m2 = m1;
                        x2 = x1;
                        m1 = HuffNode[j].weight;
                        x1 = j;
                    }
                    else if (HuffNode[j].weight < m2 && HuffNode[j].parent == -1)
                    {
                        m2 = HuffNode[j].weight;
                        x2 = j;
                    }
                }
                HuffNode[x1].parent = n + i;
                HuffNode[x2].parent = n + i;
                HuffNode[n + 1].weight = m1 + m2;
                HuffNode[n + 1].lchild = x1;
                HuffNode[n + 1].rchild = x2;
                Console.WriteLine($"x1.weight:{HuffNode[x1].weight},x2.weight:{HuffNode[x2].weight}");
            }
        }

        public static void HuffmanCode(HCodeType[] HuffCode,int n)
        {
            HCodeType cd=new HCodeType(new int[MAXBIT],0);
            int i, j, c, p;
            for (i=0;i<n;i++)
            {
                cd.start = n-1;
                c = i;
                p = HuffNode[c].parent;
                while (p != -1)
                {
                    if (HuffNode[p].lchild == c)
                        cd.bit[cd.start] = 0;
                    else
                        cd.bit[cd.start] = 1;
                    cd.start--;
                    c = p;
                    p = HuffNode[c].parent;
                }
                for (j = cd.start + 1; j < n; j++)
                    HuffCode[i].bit[j] = cd.bit[j];
                HuffCode[i].start = cd.start;
            }
        }

        public static void init()
        {
            int i, j, n;
            Console.WriteLine("请输入n");
            n = Convert.ToInt32(Console.ReadLine());
            Huffman_Tree(HuffNode,n);
            HuffmanCode(HuffCode,n);
            for (i=0;i<n;i++) {
                Console.WriteLine($"Huffman code is:{HuffNode[i].value}");
                for (j = HuffCode[i].start + 1; j < n; j++)
                    Console.WriteLine(HuffCode[i].bit[j]);
            }

        }
    }
}