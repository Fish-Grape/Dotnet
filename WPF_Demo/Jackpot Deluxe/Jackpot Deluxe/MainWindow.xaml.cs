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
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {
        private int totalPoints = 0;
        private int totalAttempts = 0;
        private const int MaxAttempts = 20;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void DoLosingCondition()
        {
            this.txtInstructions.Text = "You Lose!";
            this.txtInstructions.FontSize = 80;
            this.txtInstructions.Foreground = new SolidColorBrush(Colors.Gray);
            this.btnSpin.IsEnabled = false;
        }
        private void DoWinningCondition()
        {
            this.txtInstructions.Text = "You Win!";
            this.txtInstructions.FontSize = 80;
            this.txtInstructions.Foreground = new SolidColorBrush(Colors.Orange);
            this.btnSpin.IsEnabled=false;
        }

        private void btnSpin_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.txtAttempts.Text = string.Format("Attempts: {0}",(++totalAttempts).ToString());

            if (totalAttempts>=MaxAttempts)
            {
                DoLosingCondition();
            }

            int randomOne=this.imgFirst.Spin();
            int randomTwo = this.imgSecond.Spin();
            int randomThree = this.imgThird.Spin();

            if (randomOne==randomTwo && randomTwo==randomThree)
            {
                totalPoints += 10;
                this.txtScore.Text = string.Format("Score: {0}",totalPoints);

                if (totalPoints>=100)
                {
                    DoWinningCondition();
                }
            }
        }
    }
}
