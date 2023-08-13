using InfinityTrain;

internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");

        List<Wagon> list = new List<Wagon>();
        list.Add(new Wagon(false));//1
        list.Add(new Wagon(true));//2
        list.Add(new Wagon(false));//3
        list.Add(new Wagon(true));//4
        list.Add(new Wagon(false));//5
        list.Add(new Wagon(false));//6
        list.Add(new Wagon(true));//7
        list.Add(new Wagon(false));//8
        list.Add(new Wagon(true));//9
        list.Add(new Wagon(true));//10
        list.Add(new Wagon(true));//11
        list.Add(new Wagon(true));//12

        var train = new Train(list, 3);

        var r = new Researcher(train);

        r.Start();
    }
}