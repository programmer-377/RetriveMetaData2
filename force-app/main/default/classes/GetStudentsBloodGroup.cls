public class GetStudentsBloodGroup {
    public List<Integer> sortMethod(List<Integer> listOfInteger){
        
        for(Integer i=0; i<listOfInteger.size(); i++){
            for(Integer j=i+1; j<=listOfInteger.size()-1; j++){
                System.debug(j);
                if(listOfInteger[i] > listOfInteger[j]){
                    Integer a = listOfInteger[i];
                    listOfInteger[i] = listOfInteger[j];
                    listOfInteger[j] = a;
                }
            }
        }
        return listOfInteger;
    }
    public List<Integer> sortMethodCopy(List<Integer> listOfInteger){
        List<Integer> numList = new List<Integer>(listOfInteger);
        
        for(Integer i=0; i<numList.size(); i++){
            for(Integer j=i+1; j<=numList.size()-1; j++){
                if(numList[i] > numList[j]){
                    Integer a = numList[i];
                    system.debug(numList[j]);
                    numList[i] = numList[j];
                    numList[j] = a;
                }
            }
        }
        return numList;
    }
}
/* GetStudentsBloodGroup t = new GetStudentsBloodGroup();
List<Integer> listOfNumbers = new List<Integer>{10,9,8,7,6};
    //System.debug(t.sortMethod(listOfNumbers));
    t.sortMethod(listOfNumbers); */