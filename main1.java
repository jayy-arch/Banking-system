package bankingsystem1;

import java.util.Scanner;


public class BankingSystem1 {
private static int accountId;
private static String accountType;
private static double balance=0;
private static int customerId;
private static String name;
private static String email;
private static String phone;
private static double amount;
public static int option;

public int getaccountId() {return accountId;}
public String getaccountType() {return accountType;}
public double getbalance() {return balance;}
public int customerId() {return customerId;}
public String getname() {return name;}
public String getemail() {return email;}
public String getphone() {return phone;}
public double getamount() {return amount;}
    

        public static void accountDetails(){

    System.out.println("_____AccountDetails_____");
   Scanner s=new Scanner(System.in);
    System.out.println("accountId: "+ accountId);
    System.out.println("accountType: " +accountType);
    System.out.println("balance: " +balance);
    balance=s.nextDouble();
    
}     

public static void accountMangement(){
    System.out.println("_____accountmanagement____");
    System.out.println("enter 1 to create account");
    System.out.println("enter 2 to view account");
    System.out.println("enter 3 to view all accounts");
    System.out.println("enter 5 to go back");
}
 public static void customerDetails() {
     
     System.out.println("_____CustomerDetails______");
      Scanner s=new Scanner(System.in);
     System.out.println("customerId: "+customerId);
     customerId=s.nextInt();
     System.out.println("name: " +name);
     name=s.nextLine();
     System.out.println("email "+email);
     email=s.nextLine();
     System.out.println("phone "+phone);
     phone=s.nextLine();
   
 } 
 
 public static void CustomerMenu(){
     System.out.println("______CustomerMenu_____");
     System.out.println("enter 1 to register new customer");
     System.out.println("enter 2 to view all customers");
     System.out.println("enter 3 to update customers or customer");
     System.out.println("enter 4 to go back");
 }
 
  public static double deposit(){
      
        if (amount<=0)
        {
            System.out.println("invalid amount");
        }
       else
        {
            balance+=amount;
            System.out.println("deposit succesful");
        }
    return 0;
    
  }
      
  public static void withdrawal(){
         System.out.println("______withdrawal_____");
         Scanner e=new Scanner(System.in);
         System.out.println("enter withdrawal amaount");
         double amounts=e.nextDouble();
          if (amounts > 0 && amounts<=balance)
        {   
            balance-=amounts;
            System.out.println("withdrawal successful");
        }
       else
        {
            System.out.println("unsuccessful");
        }
   }   
  
   public static void transfer(){
     
         System.out.println("______transfer_____");
         Scanner e=new Scanner(System.in);
         double amountss =e.nextDouble();
         System.out.println("enter amount to tranfer");
          if (amountss > 0 && amountss<=balance)
        {   
            balance-=amountss;
            System.out.println("transfer successful");
        }
       else
        {
            System.out.println(" transfer unsuccessful");
        }
  }
         

    public static void main(String[] args) {
        System.out.println("______BankingSystem______");
        System.out.println("enter 1 to view accountDetails");
        System.out.println("enter 2 to customerMenu");
        System.out.println("enter 3 to deposit");
        System.out.println("enter 4 to withdraw");
        System.out.println("enter 5 to tranfer");
        System.out.println("exist");
        System.out.println("enter your choice: ");
        
        accountDetails();
        accountMangement();
        customerDetails();
        CustomerMenu();
        deposit();
        withdrawal();
        transfer();
        
        
        
       
        
    }
        
    }
     
