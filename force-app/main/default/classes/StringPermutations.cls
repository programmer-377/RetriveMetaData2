public class StringPermutations{
    public String str;
    public List<String> tempList;
    public void Permutations(){
        permutation1(str);
        tempList = new List<String>();
    } 
    public void permutation1(String input){
        permutation('', input); 
    } 
    public void permutation(String prefix, String str1) {
        integer n = str1.length();
        if (n == 0){ 
            if(prefix!=null){
                System.debug(prefix);
                tempList.add(prefix);
            }
        }
        else {
            for (integer i = 0; i < n; i++)
                permutation(prefix + str1.substring(i,i+1),str1.substring(0, i) + str1.substring(i+1, n));
            
        }
        System.debug(tempList.size());
    }
}