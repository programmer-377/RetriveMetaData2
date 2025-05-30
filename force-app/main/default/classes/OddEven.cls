public class OddEven {
    public static void method(){
        List<String> l1 = new List<String>{'1,2,3,4,50,54,345,67544,343543,23432,1233212'};
            List<Integer> l2 = new List<Integer>();  
        for(String l3 : l1){
            List<String> str = l3.split(','); 
            System.debug(l3);
        }
    
    }
    
}