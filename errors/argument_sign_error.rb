class ArgumentSignError < ArgumentError
  def initialize
    message = 'first_position or last_position is not a good letter.'
    super(message)
  end
end
