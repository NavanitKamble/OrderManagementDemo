public class AccountDataFactory{

    public Account getAccount(String accName, Boolean doInsert){
        Account newAcc = new Account(Name = accName);
        if(doInsert){
            insert newAcc;
        }
        return newAcc; 
    }
}