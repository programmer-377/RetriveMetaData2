public class listOfInteger{
    public Integer addList(List<Integer> integerList){
        Integer totalValue = 0;
        for(Integer addition : integerList){           
            totalValue = addition+totalValue;
        }
        return totalValue;
    }
    public List<Integer> fibonacciSeries(Integer enterNumber){
        List<Integer> fibonacciSeries = new List<Integer>();
        Integer a = 0;
        Integer b = 1;

        for(Integer i = 0; i<enterNumber; i++){
            Integer c = 0;
            c=a+b;
            b=a;
            a=c;
            fibonacciSeries.add(b);
        }
        return fibonacciSeries;
    }
}