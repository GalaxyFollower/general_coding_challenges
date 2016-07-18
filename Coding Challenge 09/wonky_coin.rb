#example input: wonkycoin(5)
def wonkycoin(n)
  return 1 if n == 0
  
  # call wonkycoins from inside itself. This is called *recursion*.
  return wonkycoin(n / 2) + wonkycoin(n / 3) + wonkycoin(n / 4)
end
