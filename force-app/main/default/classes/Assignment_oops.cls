public class Assignment_oops {
    
    //calculate area and perimeter of rectangle
    public Integer rec_area(Integer length, Integer width){
        return length * width;
    }
    Public Integer rec_perimeter(Integer length, Integer width){
        return 2*(length + width);
    }
    
    //find simple interest
    public decimal simple_intrest_calc(decimal initial, decimal rate, decimal years){
        return initial * (1 + rate * years);
    }
    
    //basic salary is 10000 DA=20% of Basic salary, HRA=30% of BS find Net Salary (NS=BS+DA+HRA)
    public decimal get_netSalary(decimal salary){
        decimal da = 20, hra = 30;
        return salary + (salary * (da/100) + (salary * (hra/100)));
    }
    
    //Print Series 1 to 10
    public void print_number(Integer limits){
        for(integer i = 1; i<= limits; i++){
            System.debug(i);
        }
    }
    
    //check given number is prime or not
    public boolean check_prime(Integer num){
        Integer counter = 0;
        if(num == 1 || num == 2){
            return true;
        }
        for(integer i = 2; i<num/2; i++){
            if(math.mod(num, i) == 0){
                counter++;
            }
        }
        if(counter >= 1){
            return false;
        }else{
            return true;
        }
    }
    
    //prime no in the range 5 to 90
    public void prime_range(){    
        for(integer i = 5; i<= 90; i++){
            integer counter = 0;
            for(integer j = 2; j <= i/2; j++){
                if(math.mod(i, j) == 0){
                    counter++;
                    continue;
                }
                if(j == i/2 && counter < 1){
                    System.debug('Prime Number :'+i);
                }
            }
        }
    }
    
    //Print Fibonacci Series
    public void fibonacci(){
        integer old_value = 0;
        integer new_value = 1;
        for(integer i = 0; i<=10; i++){
            integer temp = old_value+new_value;
            System.debug(temp+', ');
            new_value = old_value;
            old_value = temp; 
        }
    }
    
    //print palindrome number
    public boolean palindrome(Integer num){
        string str_num = String.valueOf(num);
        return String.valueof(num) == str_num.reverse();
    }
    
    //print sum of digits of a number
    public integer sum_of_digit(Integer num){
        integer count = 0;
        while(num > 0){
            count +=Math.mod(num,10);
            num /= 10;
        }
        return count;
    }  
}