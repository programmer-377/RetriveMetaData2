public class FindLargestNumber{
    public Integer findLargestNum1(List<Integer> listOfNumbers){
        
        Integer largestNumber = listOfNumbers.get(0);
        for(Integer i=0; i<listOfNumbers.size();i++){
            if(listOfNumbers.get(i)>largestNumber){
                largestNumber = listOfNumbers.get(i);
            }
        }
        return largestNumber;
    }
    public Integer findLargestNum2(List<Integer> findNum){
        Integer largestNumber;
        
        for(Integer tempInt : findNum){
            if(largestNumber == null){
                largestNumber = tempInt;
            }
            if(tempInt<largestNumber){
                largestNumber = tempInt;
            }
        }
        return largestNumber;
    }    
    public Integer findLargestNum3(List<Integer> findNum){
        Integer largestNumber = findNum.get(0);
        Integer count=0;
        for(Integer tempInt : findNum){
            if(tempInt>largestNumber){
                largestNumber = tempInt;
            }
        }
        for(Integer tempInt1 : findNum){
            if(tempInt1==largestNumber){
                break;
            }
            count++;
        }
        System.debug('Index Position - '+count); 
        return largestNumber;
    }
}

/* FindLargestNumber t = new FindLargestNumber();
List<Integer> tempList = new List<Integer>{10,200,23,30,3,100,20,10};
System.debug('Largest Number - '+t.findLargestNum3(tempList)); */