require 'money'

describe Money do
  it "should handle an init string of 1.00" do
    money = Money.new("1.00")
    money.dollars.should == 1
    money.cents.should == 0
  end

  it "should handle an init string of 1.15" do
    money = Money.new("1.15")
    money.dollars.should == 1
    money.cents.should == 15
  end

  it "should handle an init string of 1.15" do
    money = Money.new("1.05")
    money.dollars.should == 1
    money.cents.should == 5
  end


  it "should handle an init integer" do
    money = Money.new(1)
    money.dollars.should == 1
    money.cents.should == 0
  end
  
  it "should handle an init float of 1.0" do
    money = Money.new(1.0)
    money.dollars.should == 1
    money.cents.should == 0
  end

  it "should handle an init float 1.15" do
    money = Money.new(1.15)
    money.dollars.should == 1
    money.cents.should == 15
  end

  it "should handle an init float 1.00" do
    money = Money.new(1.00)
    money.dollars.should == 1
    money.cents.should == 0
  end
  
  it "should handle an init float 1.05" do
    money = Money.new(1.05)
    money.dollars.should == 1
    money.cents.should == 5
  end
  
  it "should handle in init of dollar and cent amounts" do
    money = Money.new(1,10)
    money.dollars.should == 1
    money.cents.should == 10
  end
  
  it "should print to string correctly for 1.00 to $1.00" do
    money = Money.new("1.00")
    money.to_s.should == "$1.00"
  end

  it "should print to string correctly for 100.50 to $100.50" do
    money = Money.new("100.50")
    money.to_s.should == "$100.50"
  end

  it "should print to string correctly for 200c to $2.00" do
    money = Money.new(0,200)
    money.to_s.should == "$2.00"
  end

  it "should print to string correctly for 250c to $2.50" do
    money = Money.new(0,250)
    money.to_s.should == "$2.50"
  end

  it "should convert to a float correctly $1.00 to 1.00" do
    money = Money.new(1,00)
    money.to_f.should == 1.0
  end
  
  it "should convert to a float correctly $1.50 to 1.50" do
    money = Money.new(1,50)
    money.to_f.should == 1.5
  end
  
  it "should not allow more than 2 arguments" do    
    lambda {Money.new(1,1,1)}.should raise_error
  end
  
  it "should ignore decimals for portion amounts" do
    money = Money.new(1.1, 1.1)
    money.to_s.should == "$1.01"
  end
end