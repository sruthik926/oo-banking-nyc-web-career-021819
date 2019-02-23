require 'pry'

class Transfer
  # your code here

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end

 def valid?
   if @sender.valid? == true && @receiver.valid? == true
       true
   end
 end

 def execute_transaction
    if @sender.balance >= amount && self.status == "pending" && @sender.valid?
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      self.status = "complete"
    else
        self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
 end

def reverse_transfer
   if self.status == "complete"
     @sender.balance += self.amount
     @receiver.balance -= self.amount
     self.status = "reversed"
   end
end

end
