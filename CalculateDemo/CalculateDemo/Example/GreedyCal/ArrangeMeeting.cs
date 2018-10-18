using System;
using System.Collections.Generic;
using System.Text;

namespace CalculateDemo
{
    public class ArrangeMeeting
    {
        public struct Meet {
            public int beg;
            public int end;
            public int num;

            public Meet(int _beg, int _end, int _num)
            {
                beg = _beg;
                end = _end;
                num = _num;
            }
        }


        public static void init()
        {
            Meet[] m = new Meet[] {
                new Meet(1,4,2),
                new Meet(2,5,4),
                new Meet(3,6,1),
                new Meet(5,7,3),
                new Meet(3,8,6),
                new Meet(5,9,5),
                new Meet(6,10,8),
                new Meet(8,11,7),
                new Meet(8,12,9),
                new Meet(12,14,10)
            };
            sovle(m);
        }

        public bool cmp(Meet x,Meet y)
        {
            if (x.end == y.end)
                return x.end > y.end;
            return x.end < y.end;
        }

        public static void sovle(Meet[] meets)
        {
            int n = 10;
            int ans = 1;
            int last = meets[0].end;
            for (int i = 1; i < n; i++)
            {
                if (meets[i].beg >= last)
                {
                    ans++;
                    last = meets[i].end;
                    Console.WriteLine($"选择第{meets[i].num}个会议");
                }
            }
            Console.WriteLine($"最多可以安排{ans}个会议");
        }
    }
}