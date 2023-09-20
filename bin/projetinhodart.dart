void main() {
  // Criando uma Guerreira
  var guerreira = Guerreira("Athena", 100, 50, 1.5, 5, 20);
  guerreira.bloquearAtaque();
  guerreira.atacar(guerreira); // A Guerreira ataca a si mesma para demonstração

  // Criando uma Maga
  var maga = Maga("Luna", 80, 100, 1.2, 6, 30);
  maga.lancarFeitico();
  maga.usarMagia();

  // Criando uma Arqueira
  var arqueira = Arqueira("Aria", 90, 60, 1.7, 4, 25);
  arqueira.atirarFlecha();
  arqueira.andar();
}


class Heroi {
  String nome;
  int pontosVida;
  int pontosMagia;
  double velocidade;
  int danoAtaque; // Alterado o tipo para 'int'
  bool? isViva;
  int nivel;

  Heroi(this.nome, this.pontosVida, this.pontosMagia, this.velocidade, this.nivel, {this.isViva = true})
      : danoAtaque = (10 + (nivel * 5)).toInt(); // Converte o resultado para 'int'

  void atacar(Heroi inimigo) {
    // Implementação do método de ataque
    // Calcula o dano com base no dano de ataque atual
    int dano = danoAtaque;
    print('$nome atacou ${inimigo.nome} causando $dano de dano!');
    inimigo.receberDano(dano);
  }

  void receberDano(int dano) {
    // Implementação para receber dano e atualizar os pontos de vida
    pontosVida -= dano;
    if (pontosVida <= 0) {
      isViva = false;
      print('$nome foi derrotado!');
    }
  }

  void andar() {
    // Implementação do método de andar
    // Por exemplo, você pode atualizar a posição da heroína aqui
    print('$nome está andando.');
  }

  void usarMagia() {
    // Implementação do método de usar magia
    // Por exemplo, você pode consumir pontos de magia e aplicar um efeito mágico aqui
    int custoMagia = 20 + (nivel * 10); // Aumenta o custo de magia com base no nível
    if (pontosMagia >= custoMagia) {
      print('$nome usou uma magia poderosa!');
      pontosMagia -= custoMagia;
    } else {
      print('$nome não possui energia suficiente para usar magia.');
    }
  }
}

class Guerreira extends Heroi {
  int resistenciaFisica;

  Guerreira(String nome, int pontosVida, int pontosMagia, double velocidade, int nivel, this.resistenciaFisica)
      : super(nome, pontosVida, pontosMagia, velocidade, nivel);

  void bloquearAtaque() {
    print('$nome bloqueou um ataque!');
  }
}

class Maga extends Heroi {
  int poderMagico;

  Maga(String nome, int pontosVida, int pontosMagia, double velocidade, int nivel, this.poderMagico)
      : super(nome, pontosVida, pontosMagia, velocidade, nivel);

  void lancarFeitico() {
    print('$nome lançou um feitiço poderoso!');
  }
}

class Arqueira extends Heroi {
  int precisao;

  Arqueira(String nome, int pontosVida, int pontosMagia, double velocidade, int nivel, this.precisao)
      : super(nome, pontosVida, pontosMagia, velocidade, nivel);

  void atirarFlecha() {
    print('$nome atirou uma flecha com precisão!');
  }
}

