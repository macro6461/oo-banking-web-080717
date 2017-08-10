class Transfer
  # your code here

  attr_accessor :sender, :status, :amount
  attr_reader :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.valid? == true && @sender.balance > @amount && @status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      reject
    end
  end

  def reject
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end


  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    else
      reject
    end
  end
end
