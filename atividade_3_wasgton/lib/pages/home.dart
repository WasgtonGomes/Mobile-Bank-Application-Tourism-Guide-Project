import 'package:flutter/material.dart';
import 'detalhes_destino_paris.dart'; // Importando a página de detalhes
import 'lugares_populares_page.dart'; // Importando a página de lugares populares
import 'perfil_page.dart'; // Importando a página de perfil
import 'mensagem_page.dart'; // Importando a página de mensagens

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30), // Arredondamento igual ao da imagem
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Cor de fundo cinza bem clarinho
                  borderRadius: BorderRadius.circular(30), // Mesmo arredondamento da imagem
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30), // Bordas arredondadas para a imagem
                      child: Image.network(
                        'https://i.pinimg.com/564x/1d/13/9a/1d139af82d76fc5e5e94d17a8429d64b.jpg',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'WASGTON E LEONARDO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Ação quando o ícone é pressionado
                  },
                ),
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove a sombra padrão da AppBar
        automaticallyImplyLeading: false, // Remove o botão de voltar padrão
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore o',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                children: [
                  Text(
                    'Belo mundo',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'World!',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              Align(
                alignment: Alignment.centerRight, // Alinha a imagem à direita
                child: Padding(
                  padding: const EdgeInsets.only(right: 60.0), // Espaçamento de 60px à direita
                  child: Image.asset(
                    'lib/imagens/tela04.png', // Caminho da imagem tela04.png
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Espaço entre título e subtítulo

              // Subtítulo Melhor Destino
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Melhor destino',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/lugaresPopulares');
                    },
                    child: Text('Ver tudo'),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Imagens dos Destinos
              SizedBox(
                height: 350, // Altura fixa para o carrossel
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDestinationCard(
                      context, // Passando o contexto
                      'Espanha',
                      'Madrid, Espanha',
                      4.7,
                      'https://i.pinimg.com/736x/c6/47/a3/c647a3bc8f13f829f3645c752990413b.jpg',
                      '/detalhesMadrid', // Rota para a página de detalhes de Madrid
                      likes: 50,
                    ),
                    _buildDestinationCard(
                      context, // Passando o contexto
                      'França',
                      'Paris, França',
                      4.8,
                      'https://i.pinimg.com/564x/b6/95/85/b695859809afd7ccb78b6bd919fd0025.jpg',
                      '/detalhesParis', // Outra rota (se precisar)
                      likes: 30,
                    ),
                    SizedBox(width: 16), // Espaço extra no final para evitar overflow
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1, // Define o item ativo (Home)
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/mensagens'); // Navega para a página de mensagens
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PerfilPage()),
            );
          }
        },
      ),
    );
  }

  // Função que constrói cada cartão de destino
  Widget _buildDestinationCard(BuildContext context, String title, String location, double rating, String imageUrl, String routeName, {int likes = 0}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          width: 300, // Largura fixa para as imagens do carrossel
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Margem interna de 8px
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0), // Bordas arredondadas para a imagem
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 200, // Altura fixa para as imagens do carrossel
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              SizedBox(width: 4),
                              Text(
                                rating.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: Colors.grey),
                              Text(location, style: TextStyle(fontSize: 14, color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: List.generate(
                              likes > 3 ? 3 : likes,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 2.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundImage: NetworkImage(
                                    'https://cdn2.iconfinder.com/data/icons/avatars-60/5985/1-Girl-256.png',
                                  ), // URL da imagem do usuário
                                ),
                              ),
                            )..add(
                                Text(
                                  "+$likes",
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
