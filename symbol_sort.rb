class Symbol
  def <=>(sym)
    return self.to_s<=>sym.to_s
  end
end

