public class Palindrome{
    public Boolean palindromeOrNot(String enterString){
        if(!String.isEmpty(enterString)){
            String ascending = enterString;
            String descending = ascending.reverse();
            Boolean b1 = ascending.equals(descending);
            return b1;
        }else{
            return null;
        }
    }
    public Boolean palindromeOrNotManual(String enterString){
        if(!String.isEmpty(enterString)){
            String ascending = enterString;
            String descending;
            List<Integer> ascii = new List<Integer>();
            for(Integer i=ascending.length()-1; i>=0; i--){
                ascii.add(ascending.charAt(i)); 
            }
            descending = String.fromCharArray(ascii);
            Boolean b1 = ascending.equals(descending);
            return b1; 
        }
        return null;        
    }
}

/* ReverseAllValuesInList t = new ReverseAllValuesInList();
Boolean tempVar1 = t.palindromeOrNot('');
if(tempVar == true){
System.debug('This is Palindrome');
}else if(tempVar == false){
System.debug('This is Not Palindrome');
}
else{
System.debug('Enter a Valid String');
} */

/* ReverseAllValuesInList t = new ReverseAllValuesInList();
Boolean tempVar2 = t.palindromeOrNotManual('');

if(tempVar == true){
    System.debug('This is Palindrome');
}else if(tempVar == false){
    System.debug('This is Not Palindrome');
}else{
    System.debug('Enter a Valid String');
} */