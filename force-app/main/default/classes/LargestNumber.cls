public class LargestNumber{
    public Integer largeNumber(List<Integer> listOfNumbers){
        Integer largestNumber = listOfNumbers.get(0);
        for(Integer largeNum : listOfNumbers){            
            if(largeNum>largestNumber){
                largestNumber = largeNum;
            }
        }
        return largestNumber;
    }
}
/* LargestNumber t = new LargestNumber();
List<Integer> tempList = new List<Integer>{10,40,20,30,8,150,22};
System.debug('Largest Number - '+t.largeNumber(tempList)); */