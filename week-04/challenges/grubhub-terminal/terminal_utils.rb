class TerminalUtils
  def self.clear_screen
    # Printing this special sequence of characters causes your terminal to clear,
    # similar to running the command `clear` or typing `ctrl+l`
    print "\e[H\e[2J"
  end
end
