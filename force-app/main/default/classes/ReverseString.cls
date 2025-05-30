public class ReverseString{
    
    public String reverseMethod1(List<String> enterName){
        String str = '';
        for(Integer i=enterName.size()-1; i>=0; i--){
            //str += enterName.get(i);
            str = str+enterName.get(i);
        }
        return str;
    }
    public String reverseMethod2(String enterName){
        List<Integer> newList = new List<Integer>();
        for(Integer i=enterName.length()-1; i>=0; i--){
            newList.add(enterName.charAt(i));
        }
        String reverse = String.fromCharArray(newList);
        return reverse;
    }
    public List<String> reverseMethod3(List<String> listOfNames){
        List<String> reverseList = new List<String>();
        List<String> finalList = new List<String>();
        for(String st : listOfNames){
            List<Integer> ascii = new List<Integer>();
            String str = '';
            for(Integer i=st.length()-1; i>=0; i--){
                ascii.add(st.charAt(i));
            }
            str = string.fromCharArray(ascii);  
            reverseList.add(str);
        }
        for(Integer j=reverseList.size()-1; j>=0; j--){
            finalList.add(reverseList.get(j));
        }
        return finalList;
    }    
}

//Method 1
/* ReverseString t = new ReverseString();
List<String> tempList = new List<String>{'M','U','T','H','U'};
System.debug(t.reverseMethod1(tempList)); */

//Method 2
/* ReverseString u = new ReverseString();
System.debug(u.reverseMethod2('Muthu')); */

//Method 3
/* ReverseString v = new ReverseString();
List<String> tempList = new List<String>{'Muthu', 'Manoj', 'Sanjay', 'Arun', 'Ram'};
System.debug(v.reverseMethod3(tempList)); */