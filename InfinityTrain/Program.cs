using InfinityTrain;

internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");

        List<Wagon> list = new List<Wagon>
        {
            new Wagon(false),//1
            new Wagon(true),//2
            new Wagon(false),//3
            new Wagon(true),//4
            new Wagon(false),//5
            new Wagon(false),//6
            new Wagon(true),//7
            new Wagon(false),//8
            new Wagon(true),//9
            new Wagon(true),//10
            new Wagon(true),//11
            new Wagon(true)//12
        };

        var train = new Train(list,3);

        var r = new Researcher(train);

        r.Notify += Print;

        r.Start();
    }

    public static void Print(string str)
    { 
        Console.WriteLine(str); 
    }
}