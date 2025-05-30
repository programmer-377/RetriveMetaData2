public class stDetails{
    public static void emailmethod(){
        
        String marks = '45,56,78,35,50;50,36,90,55,39;78,90,45,30,90;';
        List <String> split = marks.split(';'); /*split the n number of set*/
        
        list<String> lt = new list <String>();
        lt.add('Student 1 ');
        lt.add('Student 2 ');
        lt.add('Student 3 ');
        
        list <String> lt1 = new list <String>();
        lt1.add('Pass');
        lt1.add('Fail');
        
        String set1 = split.get(0);
        
        list<string> splits1 = set1.split(',');/*get student 1 mark*/
        
        String su1 = splits1.get(0);
        Integer sub1 = integer.valueOf(su1);/*student 1 marks*/
        
        String su2 = splits1.get(1);
        Integer sub2 = integer.valueOf(su2);/*student 1 marks*/
        
        String su3 = splits1.get(2);
        Integer sub3 = integer.valueOf(su3);/*student 1 marks*/
        
        String su4 = splits1.get(3);
        Integer sub4 = integer.valueOf(su4);/*student 1 marks*/
        
        String su5 = splits1.get(4);
        Integer sub5 = integer.valueOf(su5);/*student 1 marks*/
        
        Integer total = (sub1 + sub2 + sub3 + sub4 + sub5);
        
        Integer Avg = (total*100 /500);
        
        
        if(sub1>=35 && sub2>=35 && sub3>=35 && sub4>=35 && sub5>=35){
            System.debug(lt.get(0));
            System.debug('Your Total Mark is ' + total);
            System.debug('Your Average Mark is' + Avg);
        }
        else{
            System.debug(lt.get(0));
            System.debug('Your Total Mark is ' + total);
        }
        
        String set2 = split.get(1);
        
        list<string> split2 = set2.split(',');/*get student 2 mark*/
        
        String su10 = split2.get(0);
        integer sub10 = integer.valueOf(su10);/*student 2 marks*/
        
        String su20 = split2.get(1);
        integer sub20 = integer.valueOf(su20);/*student 2 marks*/
        
        String su30 =  split2.get(2);
        integer sub30 = integer.valueOf(su30);/*student 2 marks*/
        
        String su40 = split2.get(3);
        integer sub40 = integer.valueOf(su40);/*student 2 marks*/
        
        String su50 = split2.get(4);
        integer sub50 =  integer.valueOf(su50);/*student 2 marks*/
        
        Integer total1= (sub10+sub20+sub30+sub40+sub50);
        Integer avg1 = (total1*100/500);
        
        //for fetching mark and average mark
        if(sub10>=35 && sub20>=35 && sub30>=35 && sub40>=35 && sub50>=35){
            System.debug(lt.get(1));
            System.debug('Your Total Mark is ' + total1);
            System.debug('Your Average Mark is ' + avg1);
        }
        else{
            System.debug(lt.get(1));
            System.debug('Your Total Mark is ' + total1);
        }
        
        
        string set3 = split.get(2);
        list <String> split3 = set3.split(',');/*get student 3 mark*/
        
        String su11 = split3.get(0);
        Integer sub11 = integer.valueOf(su11);/*student 3 marks*/
        
        String su21 = split3.get(1);
        Integer sub21 = integer.valueOf(su21);/*student 3 marks*/
        
        String su31 = split3.get(2);
        Integer sub31 = integer.valueOf(su31);/*student 3 marks*/
        
        String su41 = split3.get(3);
        Integer sub41 = integer.valueOf(su41);/*student 3 marks*/
        
        String su51 = split3.get(4);
        Integer sub51 = integer.valueOf(su51);/*student 3 marks*/
        
        Integer total2 =  (sub11+sub21+sub31+sub41+sub51);
        Integer avg2 = (total*100/500);
        
        
        if(sub11>=35 && sub21>=35 && sub31>=35 && sub41>=35 && sub51>=35){
            System.debug(lt.get(2));
            System.debug('Your Total Mark is ' + total2);
            System.debug('Your Average Mark is ' + avg2);
        }
        else{
            System.debug(lt.get(2));
            System.debug('Your Total Mark is ' + total2);
        }
    }
}