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

namespace Jackpot_Deluxe
{
    /// <summary>
    /// UserControl1.xaml 的交互逻辑
    /// </summary>
    public partial class StarButton : UserControl
    {
        public StarButton()
        {
            InitializeComponent();
        }

        private void StarControl_MouseDown(object sender, MouseButtonEventArgs e)
        {
            //MessageBox.Show("hehehe");
            VisualStateManager.GoToState(this, "MouseDownStar", true);
        }


        private void StarControl_MouseEnter(object sender, MouseEventArgs e)
        {
            //VisualStateManager.GoToState(this, "MouseEnterStar", true);
            this.grid.Background = Brushes.Red;
        }

        private void StarControl_MouseLeave(object sender, MouseEventArgs e)
        {
            //VisualStateManager.GoToState(this, "MouseExitStar", true);
            this.grid.Background = Brushes.White;
        }
    }
}
