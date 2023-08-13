using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InfinityTrain
{
    internal class Wagon
    {
        public bool Light { get; private set; }
        public Wagon() { 
            Light = true;
        }

        public Wagon(bool light)
        {
            Light = light;
        }

        public void SwitchLight()
        {
            Light = Light == true? false : true; 
        }

        public override string ToString()
        {
            return Light == true ? "1" : "0";
        }
    }
}
