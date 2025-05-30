public class Task {
    Public void method(){
        String Data = 'Sequence 1:45,5633,33,55,66,33,2,6,75,4,6,5,4,33,322,2,2,78,30;Sequence 2:30,42,56,2,6,75,4,6,5,4,33,66,93,77,89,54;Sequence 3:90,89,68,79,56,2,6,75,4,6,5,4,33,66,100';

String se = Data.split(';').get(0);
String[] se1 = se.split(':');
String se3 = se1.get(0);
String se2 = se1.get(1);
List<String> stt = se2.split(',');
Set<String> st = new Set <String>(stt);
List <Integer> in1 = new List<Integer>();

For(String st1: st){
    Integer var = Integer.valueOf(st1); 
    in1.add(var);    
    }
Map <String, list<Integer>> mymap1 = new Map <String, list<Integer>>();
    mymap1.put(se3, in1);
System.debug(mymap1);


String seq1 = Data.split(';').get(1);
String[] seq2 = seq1.Split(':');
String seq4 = seq2.get(0);
String seq3 = seq2.get(1);
List<String> list2 = seq3.split(',');
Set<String> set2 = new Set <String>(list2);
List<Integer> in2 = new List<Integer>();

For(String st2 : set2){
    Integer var1 = Integer.valueOf(st2);
    in2.add(var1);
}
    Map <String, List<Integer>> mymap2 = new Map <String, List<Integer>>();
    mymap2.put(seq4, in2);
System.debug(mymap2);


String seq5 = Data.split(';').get(2);
String[] seq6 = seq5.split(':');
String seq8 = seq6.get(0);
String seq7 = seq6.get(1);
List<String> list3 = seq7.split(',');
Set<String> Set3 = new Set <String>(list3);
List<Integer> in3 = new List<Integer>();

For(String st3: set3){
    Integer var2 = Integer.valueOf(st3);
    in3.add(var2);
}
    Map <String, List<Integer>> mymap3 = New Map <String, List<Integer>>();
    mymap3.put(seq8, in3);
System.debug(mymap3);

    }
}