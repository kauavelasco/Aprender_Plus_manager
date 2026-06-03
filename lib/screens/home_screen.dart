import 'package:aprender_plus_manager/models/artigodata_model.dart';
import 'package:aprender_plus_manager/models/carouseldata_model.dart';
import 'package:aprender_plus_manager/screens/article_screen.dart';
import 'package:aprender_plus_manager/services/artigo_service.dart';
import 'package:aprender_plus_manager/services/carousel_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final artigoservice = ArtigoService();
  final carouselservice = CarouselService();
  
  List<ArtigodataModel> artigos = [];
  List<CarouseldataModel> carousel = [];
  
  bool carregandoArtigos = true;
  bool carregandoCarousel = true;

  void buscarArtigos() async {
    try {
      final resultado = await artigoservice.carregarDados();
      setState(() {
        artigos = resultado.artigos;
        carregandoArtigos = false;
      });
    } catch (e) {
      setState(() => carregandoArtigos = false);
    }
  }

  void buscarCarousel() async {
    try {
      final resultado = await carouselservice.carregarCarrosel();
      setState(() {
        carousel = resultado.carrosel;
        carregandoCarousel = false;
      });
    } catch (e) {
      setState(() => carregandoCarousel = false);
    }
  }

  @override
  void initState() {
    super.initState();
    buscarArtigos();
    buscarCarousel();
  }

  int _indexAtual = 0;

  @override
  Widget build(BuildContext context) {
    if (carregandoArtigos || carregandoCarousel) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final List<Map<String, dynamic>> carrosel = carousel.map((item) {
      return {"titulo": item.titulo};
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Olá, Estudante!',
          style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 23,
              fontWeight: FontWeight.w500),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Color(0xFF101010),
            size: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              if (carrosel.isNotEmpty) ...[
                CarouselSlider.builder(
                  itemCount: carrosel.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    final dado = carrosel[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 39, 39, 39),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                dado["titulo"] ?? '',
                                style: const TextStyle(
                                  color: Color(0xFFFCFCFC),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFFCFCFC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Começar agora',
                                    style: TextStyle(
                                        color: Color(0xFF101010), fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _indexAtual = index;
                      });
                    },
                    enlargeCenterPage: true,
                    padEnds: true,
                    viewportFraction: 0.90,
                    height: 200,
                    enableInfiniteScroll: carrosel.length > 1,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSmoothIndicator(
                        activeIndex: _indexAtual,
                        count: carrosel.length,
                        axisDirection: Axis.horizontal,
                        effect: const WormEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: Color(0xFF101010)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 30),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Artigos',
                      style: TextStyle(
                        color: Color(0xFF101010),
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (artigos.isNotEmpty)
                    ...artigos.map<Widget>((item) {
                      return Column(
                        children: [
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => ArticleScreen(artigo: item),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              width: 400,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFF101010),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.titulo,
                                    style: const TextStyle(
                                      color: Color(0xFFFCFCFC),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${item.descricao} • ${item.data}',
                                    style: TextStyle(
                                      // ignore: deprecated_member_use
                                      color: const Color(0xFFFCFCFC).withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })
                  else
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Nenhum artigo disponível no momento."),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}