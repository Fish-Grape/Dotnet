using IHelperService.VerifyCode;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace HelperService.VerifyCode
{
    public class VerifyCodeSer : IVerifyCodeSer
    {
        /// <summary>  
        /// 该方法用于生成指定位数的随机数  
        /// </summary>  
        /// <param name="VcodeNum">参数是随机数的位数</param>  
        /// <returns>返回一个随机数字符串</returns>  
        public string RndNum(int VcodeNum)
        {
            //验证码可以显示的字符集合  
            string Vchar = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,p" +
                ",q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,P,P,Q" +
                ",R,S,T,U,V,W,X,Y,Z";
            string[] VcArray = Vchar.Split(new Char[] { ',' });//拆分成数组   
            string code = "";//产生的随机数  
            int temp = -1;//记录上次随机数值，尽量避避免生产几个一样的随机数  

            Random rand = new Random();
            //采用一个简单的算法以保证生成随机数的不同  
            for (int i = 1; i < VcodeNum + 1; i++)
            {
                if (temp != -1)
                {
                    rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));//初始化随机类  
                }
                int t = rand.Next(61);//获取随机数  
                if (temp != -1 && temp == t)
                {
                    return RndNum(VcodeNum);//如果获取的随机数重复，则递归调用  
                }
                temp = t;//把本次产生的随机数记录起来  
                code += VcArray[t];//随机数的位数加一  
            }
            return code;
        }


        /// <summary>  
        /// 该方法是将生成的随机数写入图像文件  
        /// </summary>  
        /// <param name="code">code是一个随机数</param>
        /// <param name="numbers">生成位数（默认4位）</param>  
        public MemoryStream Create(out string code, int charCount = 4)
        {
            int width = 85, height = 40;
            List<char> _characters = new List<char>();
            //去掉0、o、O
            for (var c = '0'; c <= '9'; c++)
            {
                if (c == '0')
                {
                    continue;
                }
                _characters.Add(c);
            }
            for (var c = 'a'; c < 'z'; c++)
            {
                if (c == 'o')
                {
                    continue;
                }
                _characters.Add(c);
            }
            for (var c = 'A'; c < 'Z'; c++)
            {
                if (c == 'O')
                {
                    continue;
                }
                _characters.Add(c);
            }

            code = "";
            var chars = new char[charCount];
            var len = _characters.Count;
            var random = new Random();
            for (var i = 0; i < chars.Length; i++)
            {
                var r = random.Next(len);
                chars[i] = _characters[r];
                code += chars[i];
            }

            var answer = string.Join(string.Empty, chars);

            //model.Answer = await Des.EncryptAsync($"{answer}|{DateTime.Now}");

            //var fontNames = FontFamily.Families.Select(_ => _.Name).ToList();
            var fontNames = new List<string>
            {
                "Helvetica","Arial","Lucida Family","Verdana","Tahoma","Trebuchet MS","Georgia","Times"
            };

            //Bitmap 类 封装 GDI+ 包含图形图像和其属性的像素数据的位图。 一个 Bitmap 是用来处理图像像素数据所定义的对象。
            //Bitmap 类 继承自 抽象基类 Image 类
            using (var bitmap = new Bitmap(width, height))
            {
                //Graphics 类 封装一个 GDI+ 绘图图面。
                using (var graphics = Graphics.FromImage(bitmap))
                {
                    //填充背景色 白色
                    graphics.Clear(Color.White);

                    //绘制干扰线和干扰点
                    Disturb(random, bitmap, graphics, width / 2, height);

                    //添加灰色边框
                    var pen = new Pen(Color.Silver);
                    graphics.DrawRectangle(pen, 0, 0, width - 1, height - 1);

                    var x = 1;
                    const int y = 5;

                    var rectangle = new Rectangle(0, 0, bitmap.Width, bitmap.Height);

                    var color = Color.FromArgb(random.Next(100, 122), random.Next(100, 122), random.Next(100, 122));

                    foreach (var c in chars)
                    {
                        //随机选择字符 字体样式和大小
                        var fontName = fontNames[random.Next(0, fontNames.Count - 1)];
                        var font = new Font(fontName, random.Next(15, 20));
                        //淡化字符颜色 
                        using (var brush = new LinearGradientBrush(rectangle, color, color, 90f, true))
                        {
                            brush.SetSigmaBellShape(0.5f);
                            graphics.DrawString(c.ToString(), font, brush, x + random.Next(-2, 2), y + random.Next(-5, 5));
                            x = x + width / charCount;
                        }
                    }

                    using (var memoryStream = new MemoryStream())
                    {
                        bitmap.Save(memoryStream, ImageFormat.Jpeg);
                        return memoryStream;
                    }
                }
            }
        }


        /// <summary>
        /// 绘制干扰线
        /// </summary>
        /// <param name="random"></param>
        /// <param name="bitmap"></param>
        /// <param name="graphics"></param>
        /// <param name="lineCount"></param>
        /// <param name="pointCount"></param>
        public void Disturb(Random random, Bitmap bitmap, Graphics graphics, int lineCount, int pointCount)
        {

            var colors = new List<Color>
            {
                Color.AliceBlue,
                Color.Azure,
                Color.CadetBlue,
                Color.Beige,
                Color.Chartreuse
            };

            //干扰线
            for (var i = 0; i < lineCount; i++)
            {
                var x1 = random.Next(bitmap.Width);
                var x2 = random.Next(bitmap.Width);
                var y1 = random.Next(bitmap.Height);
                var y2 = random.Next(bitmap.Height);

                //Pen 类 定义用于绘制直线和曲线的对象。
                var pen = new Pen(colors[random.Next(0, colors.Count - 1)]);

                graphics.DrawLine(pen, x1, y1, x2, y2);
            }

            //干扰点
            for (var i = 0; i < pointCount; i++)
            {
                var x = random.Next(bitmap.Width);
                var y = random.Next(bitmap.Height);
                bitmap.SetPixel(x, y, Color.FromArgb(random.Next()));
            }
        }
    }
}
