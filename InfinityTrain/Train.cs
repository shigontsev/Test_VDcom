using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InfinityTrain
{
    internal class Train
    {
        private List<Wagon> list { get; }

        private Wagon current;

        public Wagon Current
        {
            get { return list[_position]; }
            private set { current = value; }
        }

        private int _position = 0;

        public Train(List<Wagon> train) 
        {
            this.list = train;        
        }

        public Train(List<Wagon> train, int position)
        {
            this.list = train;
            this._position = position % list.Count;
        }

        public void Forward() {
            if (_position + 1 == list.Count) {
                _position = 0;
            }
            else
            {
                _position++;
            }
        }

        public void Back()
        {
            if (_position - 1 < 0)
            {
                _position = list.Count - 1;
            }
            else
            {
                _position--;
            }
        }

        public void SwitchLight()
        {
            Current.SwitchLight();
        }

        public bool IsCountCorrect(int calc_count) {
            return calc_count == list.Count;
        }

        //public void Show()
        //{
        //    Console.WriteLine(new String('-', list.Count - (list.Count - _position)) + "@" + new String('-', list.Count - _position - 1));
        //    Console.WriteLine(string.Join("", list.Select(x => x.ToString())));
        //}

        //Сделал только для отображение позиции
        public string GetMapPosition()
        {
            return string.Format(new String('-', list.Count - (list.Count - _position)) + "@" + new String('-', list.Count - _position - 1) +
                Environment.NewLine +
                string.Join("", list.Select(x => x.ToString())));            
        }
    }
}
