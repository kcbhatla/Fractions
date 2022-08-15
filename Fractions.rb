#!/usr/bin/ruby -w

puts "Please enter a fractional expression to evaluate :"
fracLine = gets
if fracLine.start_with?("?")
  fracLine = fracLine[1..-1]
  myArray = fracLine.split
  arrayLength = myArray.length
  if (arrayLength%2 == 1)
    #puts "Array has odd elements"
  else
    puts "Incorrect input format"
    exit
  end
  operandsArray = myArray.values_at(* myArray.each_index.select(&:odd?))
  validOperandsArray = ["*", "/", "+", "-"]
  if operandsArray.all? { |e| validOperandsArray.include?(e) }
    #puts "Valid Operands"
  else
    puts "Invalid Operands. Please enter a valid expression"
    exit
  end

  temp = ""
  tempConcat = ""
  (0...myArray.length).step(1).each do |index|
    arrVal = myArray[index]

    if (arrVal.count(".") == 0 && arrVal.count("/") == 0 && !validOperandsArray.include?(arrVal))
      temp = arrVal.to_i
    elsif (arrVal.count(".") == 1 && arrVal.to_f.is_a?(Float))
      temp = arrVal
    elsif (arrVal.count("_") == 0 && arrVal.count("/") == 1 && arrVal.to_r.is_a?(Rational))
      temp = arrVal
    elsif validOperandsArray.include?(arrVal)
      temp = arrVal
    elsif (arrVal.count("_") == 1)
      idx = arrVal.index("_")
      if idx > 0
        wholeNum = arrVal[0, idx]
        frac = arrVal[idx+1, arrVal.length - idx]
        slashPos = frac.index("/")
        numerator = frac[0, slashPos]
        denominator = frac[slashPos + 1, frac.length - slashPos]
        temp = (wholeNum.to_i + (numerator.to_f/denominator.to_f)).to_s
      end
    else
      puts "Please enter a correct expression."
    end
    if (tempConcat == "")
      tempConcat = temp
    else
      tempConcat = tempConcat + " " + temp
    end
  end
  concatArray = tempConcat.split(" ")
  evalString = ""
  (0...concatArray.length).step(1).each do |index|
    evalString += validOperandsArray.include?(concatArray[index]) ? concatArray[index] : "(" + concatArray[index].to_r.to_s + ")"
  end
  evalString.to_s
  puts eval(evalString)
else
  puts "Please enter an expression starting with ?"
end
=begin

=end




