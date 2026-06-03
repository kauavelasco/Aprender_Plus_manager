import 'package:aprender_plus_manager/models/artigodata_model.dart';
import 'package:aprender_plus_manager/screens/home_menus.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  final ArtigodataModel? artigo;
  const ArticleScreen({super.key, required this.artigo});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {

    if (widget.artigo == null) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => HomeMenus(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF101010),
              size: 20,
            )
          ),
          actions: [
            IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.share,
                color: Color(0xFF101010),
                size: 20,
              ),
            ),
            IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.qr_code,
                color: Color(0xFF101010),
                size: 20,
              ),
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Nenhum Artigo foi selecionado.',
            style: TextStyle(
              color: Color(0xFF101010),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.share,
              color: Color(0xFF101010),
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.qr_code,
              color: Color(0xFF101010),
              size: 20,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 8, 0, 0),
            child: Text(
              widget.artigo!.titulo,
              style: TextStyle(
                color: Color(0xFF101010),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 6, 0, 0),
            child: Text(
              '${widget.artigo!.descricao} • ${widget.artigo!.data}',
              style: TextStyle(
                // ignore: deprecated_member_use
                color: Color(0xFF101010).withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}