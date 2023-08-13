using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InfinityTrain
{
    internal class Researcher
    {
        public Train Poezd { get; set; }

        public int _calc_count = 0;

        private int _count_tmp = 0;

        public Researcher(Train train) {
            Poezd = train;
        }

        public void Start()
        {
            if(Poezd.Current.Light != true)
            {
                Poezd.SwitchLight();
            }

            do
            {
                for (int i = 0; i < _calc_count; i++)
                {
                    Poezd.Forward();
                }
                do
                {
                    Poezd.Forward();
                    _calc_count++;
                } while (!Poezd.Current.Light);
                Poezd.SwitchLight();
                _count_tmp = _calc_count;

                do
                {
                    Poezd.Back();
                    _count_tmp--;
                } while (_count_tmp != 0);
            } while (Poezd.Current.Light);

            Console.WriteLine($"Подсчитано количество вагонов = {_calc_count}, Соответствует действительности? {Poezd.IsCountCorrect(_calc_count)}");

        }
    }
}
