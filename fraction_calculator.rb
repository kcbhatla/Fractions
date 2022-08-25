#!/usr/bin/ruby -w
# File: fraction_calculator.rb

class FractionCalculator

  def initialize(frac_string)
    raise unless frac_string.is_s(String)
    @x = frac_string
  end

  def compute(frac_line)
    if !frac_line.start_with?('?')
      puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
      frac_line = gets
    end
    if frac_line.start_with?('?')
      frac_line = frac_line[1..-1].chomp.lstrip.rstrip
    else
      puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
      frac_line = gets
    end
    my_array = frac_line.split
    array_length = my_array.length
    if array_length == 0 || array_length < 3
      puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
      frac_line = gets.chomp
    elsif(array_length.even?)
      puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
      frac_line = gets.chomp
    end
    operands_array = my_array.values_at(* my_array.each_index.select(&:odd?))
    valid_operands_array = ["*", "/", "+", "-"]
    concat_temp = ''
    unless operands_array.all? { |e| valid_operands_array.include?(e) }
      puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
      frac_line = gets.chomp
    end
    (0...my_array.length).step(1).each do |index|
      arr_val = my_array[index]
      if arr_val.count('.').zero? && arr_val.count('/').zero? && arr_val == arr_val.to_i.to_s && !valid_operands_array.include?(arr_val)
        temp = Rational(arr_val).to_s
      elsif arr_val.count('.') == 1 && arr_val == arr_val.to_f.to_s && arr_val.to_f.is_a?(Float)
        temp = Rational(arr_val).to_s
      elsif !arr_val.count('_').zero? && arr_val.count('/') == 1
        whole_num = arr_val[0, arr_val.index('/')]
        frac = arr_val[arr_val.index('/') + 1]
        numerator = frac[0, frac.index('/')]
        denominator = frac[frac.index('/') + 1]
        if !(whole_num == whole_num.to_i.to_s && numerator == numerator.to_i.to_s && denominator == denominator.to_i.to_s)
          puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
        end
        if denominator.zero?
          puts 'Division by zero is not allowed. Please enter a valid expression'
          exit
        end
        temp = Rational(((whole_num * denominator) + numerator) / denominator).to_s
      elsif ( arr_val.count('/') == 1 && arr_val.length != 1 && arr_val.to_r )
        whole_num = 0
        frac = arr_val
        numerator = frac[0, frac.index('/')]
        denominator = frac[frac.index('/') + 1]
        if denominator.to_i.zero?
          puts 'Division by zero is not allowed. Please enter a valid expression'
          exit
        end
        temp = Rational(frac).to_s
      elsif valid_operands_array.include?(arr_val)
        temp = arr_val.to_s
      else
        puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
        frac_line = gets
      end
      concat_temp = concat_temp + temp + ' '
    end
    eval_string = ''
    concat_split = concat_temp.split
    (0...concat_split.length).step(1).each do |index|
      arr_val = concat_split[index]
      if %w[* / + -].include? arr_val
        eval_string = "#{eval_string}#{arr_val.to_s} "
      else
        arr_val_r = "#{arr_val.to_s}r "
        eval_string = eval_string + arr_val_r.to_s
      end
    end
    answer = eval(eval_string)
    if !answer.nil?
      if Rational(answer).denominator == 1
        puts Rational(answer).numerator
      elsif Rational(answer).denominator >= Rational(answer).numerator
        puts answer
      elsif Rational(answer).numerator > Rational(answer).denominator
        num = Rational(answer).numerator
        den = Rational(answer).denominator
        whole = (num/den).to_i
        mod = num.modulo(den)
        answer = whole.to_s + '_' + mod.to_s + '/' + den.to_s
        puts answer
      end
    end
  end
end
my_array = []
string_to_compute = ''
puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
while (entry = gets)
  if  ( entry.empty? || entry == 'exit' || entry.chomp.empty? || entry.chomp == 'exit')
    break
  end

  string_to_compute = entry.chomp
  frac_line = string_to_compute
  if !frac_line.start_with?('?')
    puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
    frac_line = gets
  end
  if frac_line.start_with?('?')
    frac_line = frac_line[1..-1].chomp.lstrip.rstrip
  else
    puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
    frac_line = gets
  end
  my_array = frac_line.split
  array_length = my_array.length
  if array_length == 0 || array_length < 3
    puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
    frac_line = gets.chomp
  elsif(array_length.even?)
    puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
    frac_line = gets.chomp
  end
  operands_array = my_array.values_at(* my_array.each_index.select(&:odd?))
  valid_operands_array = ["*", "/", "+", "-"]
  concat_temp = ''
  unless operands_array.all? { |e| valid_operands_array.include?(e) }
    puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
    frac_line = gets.chomp
  end
  (0...my_array.length).step(1).each do |index|
    arr_val = my_array[index]
    if arr_val.count('.').zero? && arr_val.count('/').zero? && arr_val == arr_val.to_i.to_s && !valid_operands_array.include?(arr_val)
      temp = Rational(arr_val).to_s
    elsif arr_val.count('.') == 1 && arr_val == arr_val.to_f.to_s && arr_val.to_f.is_a?(Float)
      temp = Rational(arr_val).to_s
    elsif !arr_val.count('_').zero? && arr_val.count('/') == 1
      whole_num = arr_val[0, arr_val.index('/')]
      frac = arr_val[arr_val.index('/') + 1]
      numerator = frac[0, frac.index('/')]
      denominator = frac[frac.index('/') + 1]
      if !(whole_num == whole_num.to_i.to_s && numerator == numerator.to_i.to_s && denominator == denominator.to_i.to_s)
        puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
      end
      if denominator.zero?
        puts 'Division by zero is not allowed. Please enter a valid expression'
        exit
      end
      temp = Rational(((whole_num * denominator) + numerator) / denominator).to_s
    elsif ( arr_val.count('/') == 1 && arr_val.length != 1 && arr_val.to_r )
      whole_num = 0
      frac = arr_val
      numerator = frac[0, frac.index('/')]
      denominator = frac[frac.index('/') + 1]
      if denominator.to_i.zero?
        puts 'Division by zero is not allowed. Please enter a valid expression'
        exit
      end
      temp = Rational(frac).to_s
    elsif valid_operands_array.include?(arr_val)
      temp = arr_val.to_s
    else
      puts 'Please enter a valid fractional/numerical expression to compute starting with ?'
      frac_line = gets
    end
    concat_temp = concat_temp + temp + ' '
  end
  eval_string = ''
  concat_split = concat_temp.split
  (0...concat_split.length).step(1).each do |index|
    arr_val = concat_split[index]
    if %w[* / + -].include? arr_val
      eval_string = "#{eval_string}#{arr_val.to_s} "
    else
      arr_val_r = "#{arr_val.to_s}r "
      eval_string = eval_string + arr_val_r.to_s
    end
  end
    answer = eval(eval_string)
  if !answer.nil?
    if Rational(answer).denominator == 1
      puts Rational(answer).numerator
    elsif Rational(answer).denominator >= Rational(answer).numerator
      puts answer
    elsif Rational(answer).numerator > Rational(answer).denominator
      num = Rational(answer).numerator
      den = Rational(answer).denominator
      whole = (num/den).to_i
      mod = num.modulo(den)
      answer = whole.to_s + '_' + mod.to_s + '/' + den.to_s
      puts answer
    end
  end
end





