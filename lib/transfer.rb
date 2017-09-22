class Transfer
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer
  end
  # your code here
  def valid?
    if @sender.valid? && @receiver.valid? && sender.balance > amount
      return true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      sender.deposit(0 - amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

    if self.status == "complete"
      sender.deposit(amount)
      receiver.deposit(0 - amount)
      self.status = "reversed"
      binding.pry
    end
  end
end
