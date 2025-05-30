public class SortListManually{
    public List<Integer> sortMethod(List<Integer> listOfInteger){
        List<Integer> numList = new List<Integer>();
        for(Integer i=0; i<listOfInteger.size(); i++){
            for(Integer j=i+1; j<=listOfInteger.size()-1; j++){
                if(listOfInteger.get(i) > listOfInteger.get(j)){
                    Integer a= listOfInteger.get(i);
                    Integer b= listOfInteger.get(j);
                }
            }
        }
        return numList;
    }
}