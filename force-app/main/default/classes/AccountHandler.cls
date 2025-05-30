public class AccountHandler {
    public static void insertAccount(Integer value){
        Integer counter = 1;
        List<Account> addAccounts = new List<Account>();
        while(counter <= value){
            Account store = new Account();
            store.Name = 'Acme Inc N ' + counter;
            store.AccountNumber = 'A000n' + counter;
            addAccounts.add(store);
            counter = counter+1;
        }
        insert addAccounts;
    }
}