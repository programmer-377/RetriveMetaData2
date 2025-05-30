public class compareTo{
    
    public static void CompareTo(){
        String myString1 = 'abcde';
        String myString2 = 'abcd';
        Integer result =
            myString1.compareTo(myString2);
        System.assertEquals(result, 1);
        System.debug('Result'+ result);
    }
            
}