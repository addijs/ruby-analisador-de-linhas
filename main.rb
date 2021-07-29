require_relative 'analisador_linha'

array = []

file = File.open("text2.txt")
linhas = file.readlines.map(&:chomp)
file.close

linhas.each_with_index do |text, index| 
    array.push(AnalisadorLinha.new(index+1, text))
end

array.each {
    |analisador| p analisador.analyze
}