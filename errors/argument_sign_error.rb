class ArgumentSignError < ArgumentError
  def initialize
    message = "Start or Finish is not a good letter."
    super(message)
  end
end
