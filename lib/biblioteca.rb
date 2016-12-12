class Biblioteca
  attr_reader :livros

  def initialize
    @banco_de_arquivos = BancoDeArquivos.new
  end

  def adiciona(livro)
    salva livro do
      @livros[livro.categoria] ||= []
      @livros[livro.categoria] << livro
    end
  end

  def livros
    @banco_de_arquivos ||= @banco_de_arquivos.carrega
  end

  def livros_por_categoria(categoria)
    @livros.select {
      |livros| livro.categoria == categoria
    }
  end

  private
  def salva(livro)
    @banco_de_arquivos.salva livro
    yield
  end
end
