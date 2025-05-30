public class customerDetails{
    public static void emailmethod(){

       //The purchasing data is stored in String format
String Data = 'Purchased date time = 10.12.2021 16:20:00 , Name Max Char allowed = 15, Amount Paid : true, Product Amount = 4100.86, Discount = 20%, tax = 18%, Customer = Mr.Ram ,Email = ssssss@gmail.com, Address = 20/150/ 200;xxxst;yyyRoad, Exchange is allowed: true, No Days allowd for exchange = 3';

//The final output result is this format
/*
Name : 
Name Characters : 
Is Maximum Characters Reached : Yes/No
Purchased date time : MM/DD/YYYY
Exchage is closed ?: Yes/No
Product Amount : 
Discount Amount:
Amount Paid : 
Email : ssssss@gmail.com
Address : 20\150\200 */

        
        //Using ',' for Split the Data and store the Name into the split1
        String split1 = data.split(',').get(6);
        //Using '=' for split     
        List <String> splitList1 = split1.split('=');
        //Get the name only
        String getName = splitList1.get(1);
        //Delete the whitespace in name
        String name = getName.deletewhitespace();
        //Debug the Name
        System.debug('Name : ' + name);
        
        //Length of the Name Characters in the Name 
        Integer nameLength = name.length();
        //debug the length of name
        System.debug('Name Characters : ' + nameLength);
        
        //split the salutation in the name
        String getSalutation = getName.split('\\.').get(0);
        //trim the whitespaces in the salutation
        String salutation = getSalutation.trim();
        
        //This if condition check the salutaion is 'Mrs' OR 'Ms' ---> It's True this condition is Execute 
        If(salutation.startswith('Mrs') || salutation.startswith('Ms')){
            //The condition is true Display 'Gender' - 'Female'
            System.debug('Gender :' + 'Female');
        }
        //This if condition check the salutaion is 'Mr' ---> It's True this condition is Execute 
        Else If (salutation.startswith('Mr')){
            //The condition is true Display 'Gender' - Male'
            System.debug('Gender :' + 'Male');
        }
        
        //Split the data and get the Name Maximum characters
        String split2  = data.split(',').get(1);
        //Again split using '=' and get the value is - 15
        String getValue = split2.split('=').get(1);
        //Delete whitespaces in getValue String
        String deleteSpaceInteger = getValue.deletewhitespace();
        //Convert String to integer
        Integer getInt = integer.valueOf(deleteSpaceInteger);
        
        //This Condition is Check the given name is above 15 characters the condition is true
        If(nameLength>getInt){
            System.debug('Is Maximum Characters Reached : ' + 'Yes');
        }
        //Otherwise below 15 characters this condition is Execute
        Else{
            System.debug('Is Maximum Characters Reached : ' + 'No');
        }
        
        //Split the data and get purchased DateTime
        String spllit3 = data.split(',').get(0);
        //Split and Get DateTime only
        String getDate = spllit3.split('=').get(1);
        //Split the DateTime using splitbycharactertype 
        List<String> splitDate = getDate.splitbycharactertype();
        
        //Get month in splitDate
        String month = splitDate.get(1);
        //Get day in splitDate
        String day = splitDate.get(3);
        //Get year in splitDate
        String year = splitDate.get(5);
        
        //Get Hour in splitDate
        String hour = splitDate.get(7);
        //Get Minutes in splitDate
        String min = splitDate.get(9);
        //Get Seconds in splitDate
        String sec = splitDate.get(11);
        //Merge the year, month, day, hour, minutes, seconds in the following format
        String dtime=(year + '-' + month + '-' + day+ ' ' +hour+':' +min+ ':'+sec);
        
        //dtime string convert to the DateTime 
        Datetime startdate = datetime.valueOfGmt(dtime);
        
        //purchasing datetime convert to the following format
        String gmtdate = startdate.formatGMT('yyyy-dd-MM h:mm a');
        //Display the purchased datetimea
        System.debug('Purchased date time : '  +gmtdate);
        
        //enddate ----> Get currentDate and currunt Time
        Datetime enddate = datetime.newInstanceGmt(datetime.now().date(), datetime.now().time());
        
        //Get no Days of allowed for exchange
        String exchangeDays = data.split(',').get(10);
        //Get exchange Days
        String days = exchangeDays.split('=').get(1);
        //Delete whitespaces in the--> days
        String delspaceDays = days.deletewhitespace();
        //Convert the String to Integer
        Integer daysInt = integer.valueOf(delspaceDays);
        
        //Find the accurate exchange time and date, so multiply exchange days * 24 
        Integer addhrs = daysInt*24;
        //exchangehours ------> add to the hours
        Datetime exchangehours = startdate.addhours(addhrs);
        
        //If exchangehours is accurate in 72 hours or current datetime this condition is execute
        if(enddate>exchangehours){
            System.debug('Exchange is Closed ?: ' + 'Yes');    
        }
        //Otherwise this condition is Execute
        else{
            System.debug('Exchange is Closed ?: ' + 'No');
        }
        
        //Get the product amount 
        String split4 = data.split(',').get(3);
        //Using '=' and split product amount only
        String productValue = split4.split('=').get(1);
        //The string data is convert to the Double
        Double convertAmount = Double.valueOf(productValue);
        
        //Get the tax
        String split5 = data.split(',').get(5);
        //Get the tax percentage only
        String tax = split5.splitbycharactertype().get(5);
        //Convert string to Integer
        Integer convertTax = integer.valueOf(tax);
        //Calculate the Tax Amount
        double taxPercent = convertTax * (convertAmount/100);
        //Calculate Total amount of the product with tax
        double productAmount = (convertAmount + taxPercent);
        //Debug the Product Amount
        System.debug('Product Amount : ' + productamount);
        
        //Get the Discount
        String split6 = data.split(',').get(4);
        //Get the Discount percentage only
        String discountPercent = split6.splitbycharactertype().get(6);
        //Convert Discount Percentage ---> String to Integer
        Integer discount = integer.valueOf(discountPercent);
        //Calculate the Discount Amount of the Product
        double discountAmount = discount * (productamount/100);
        System.debug('Discount Amount: ' + discountAmount);
        //Calculate the Amount Paid
        double amountPaid = (productamount - discountAmount);
        System.debug('Amount Paid : ' + amountPaid);
        
        //Get the Email
        String split7 = data.split(',').get(7);
        //Get the Email id Only
        String eMail = split7.split('=').get(1);
        //Delete whiespaces in the Email
        String deletespaceEmail = eMail.deletewhitespace();
        //Debug the Email
        System.debug('Email :' + deletespaceEmail);
        
        //Get the Address
        String split8 = data.split(',').get(8);
        //Get the Apartment Number and street name
        String address = split8.split('=').get(1);
        //Delete whitespaces into the Apartment Number and Street Name
        String deleteSpaceAddress = address.deletewhitespace();
        //Using ';' split the address and get Apartment Number Only
        String getAddress = deleteSpaceAddress.split(';').get(0);
        //Replace  Target - Forward Slash  Replace with - 'Backward Slash'
        String replace = getAddress.replace('/', '\\');
        //Delete white spaces into the Replaced apartment Number
        String deleteSpaceStreet = replace.deletewhitespace();
        //Debug the Address
        System.debug('Address : ' + deleteSpaceStreet);
        
        //In this list is adding customerdetails
        List<String> customerdetails = new List <String>();
        //Add the customer name in the list
        customerdetails.add(name);
        //Add the length of name in the list
        customerdetails.add(String.valueOf(nameLength));
        //Add the Email id to the list
        customerdetails.add(deletespaceEmail);
        //Add Apartment number in the list
        customerdetails.add(deleteSpaceStreet);
        
        //In the list is adding productdetails
        List<String> productdetails = new List <String>();
        //Add the purchasing datetime to the list
        productdetails.add(String.valueOf(gmtdate));
        //Add the product amount to the list
        productdetails.add(String.valueOf(productamount));
        //Add the discount amount to the list
        productdetails.add(String.valueof(discountAmount));
        //Add the paid ampunt to the list
        productdetails.add(String.valueOf(amountPaid));
        
        //In the list of list is Adding CustomerDetails and ProductDetails
        List<List<String>> customer1 = new List<List<String>>();
        //Add the customerDetails into the list of list
        customer1.add(customerdetails);
        //Add the productDetails into the list of list
        customer1.add(productdetails);
        
        //Map<String> -- Key---> 'Customer 1'
        //List<List<String>> -- Value---> 'productDetails' and 'customerDetails'
        Map <String, List<List<String>>> customerData = new Map<String,List<List<String>>>();
        //Add the Key and Values into the map
        customerData.put('Customer 1', customer1);
        
        //Get the values of the map 
        List<List<String>> customList1 = customerData.get('Customer 1');
        //Display the Customer Details
        System.debug('Customer Details' + customList1.get(0));
        //Display the Product Details
        System.debug('Product Details' + customList1.get(1));
        
    }
}