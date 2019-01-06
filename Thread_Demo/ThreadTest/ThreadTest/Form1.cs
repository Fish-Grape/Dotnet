using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ThreadTest
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int a = 0;
            Thread thread1 = new Thread(() => { 
                for (int i = 0; i <= 20; i++)
                {
                    Console.WriteLine((a + i) + " ");
                    Thread.Sleep(500);
                }
            });
            thread1.IsBackground = true;//设置为后台线程
            thread1.Start();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Thread thread2 = new Thread(()=> {
                for (int i = 0; i <= 50; i++)
                {
                    Console.WriteLine("任务二执行-------------"+i);
                    Thread.Sleep(100);
                }
            });
            thread2.IsBackground = true;
            thread2.Start();
        }
    }
}
