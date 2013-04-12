def fibonacci( n )
  raise ArgumentError, 'wrong input' unless n.kind_of?(Fixnum) and n >= 0
  return  n  if ( 0..1 ).include? n
  fibonacci( n - 1 ) + fibonacci( n - 2 )
end