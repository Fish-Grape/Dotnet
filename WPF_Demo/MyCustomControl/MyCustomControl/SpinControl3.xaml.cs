using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Media.Animation;

namespace MyCustomControl
{
    /// <summary>
    /// UserControl1.xaml 的交互逻辑
    /// </summary>
    public partial class SpinControl3 : UserControl
    {
        private BitmapImage[] images = new BitmapImage[3];
        public SpinControl3()
        {
            InitializeComponent();
        }

        private void SpinControl_Loaded(object sender, RoutedEventArgs e)
        {
            images[0] = new BitmapImage(new Uri("timg.jpg", UriKind.Relative));
            images[1] = new BitmapImage(new Uri("timg2.jpg", UriKind.Relative));
            images[2] = new BitmapImage(new Uri("timg4.jpg", UriKind.Relative));
        }
        public int Spin()
        {
            Random r = new Random(DateTime.Now.Millisecond);
            int randomNum = r.Next(3);
            this.imgDisplay.Source = images[randomNum];
            ((Storyboard)Resources["SpinImageStoryboard"]).Begin();
            return randomNum;
        }
    }
}
