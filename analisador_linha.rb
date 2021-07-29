class AnalisadorLinha
    attr_reader :num_linha, :palavras_mais_frequentes, :frequencia

    def initialize (num_linha, content)
        @num_linha = num_linha
        @content = content
        @palavras_mais_frequentes = analyze(@content)
    end

    def analyze(content)
        palavras_frequencia = {}
        maior_frequencia = 0

        array_palavras = content.split(" ").map {
            |palavra| palavra.downcase.gsub(/[\s,.]/,"") 
            # Deixar minúsculo e retirar os pontos e vírgulas nas palavras, utilizando regex
        }

        array_palavras.each do |palavra|
            if palavras_frequencia.include?(palavra)
                palavras_frequencia[palavra] += 1
            else
                palavras_frequencia[palavra] = 1
            end

            if palavras_frequencia[palavra] > maior_frequencia
                maior_frequencia = palavras_frequencia[palavra]
            end
        end

        @frequencia = maior_frequencia

        palavras_frequencia.select {
            |_, value| value == maior_frequencia
        }
    end
end