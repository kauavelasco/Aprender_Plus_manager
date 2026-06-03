import 'package:aprender_plus_manager/screens/home_menus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  File? _imagemSelecionada;

  final picker = ImagePicker();

  Future<void> _pegarImagem() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagemSelecionada = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Perfil',
          style: TextStyle(
            color: Color(0xFF101010),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      ),
      body: Column(
        children: [
          Divider(),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pegarImagem,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFCFCFC),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: _imagemSelecionada != null
                                ? (kIsWeb
                                    ? Image.network(
                                        _imagemSelecionada!.path,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      )
                                    : Image.file(
                                        _imagemSelecionada!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ))
                                : const Center(
                                    child: Text('Sem imagem'),
                                  ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: const Icon(
                              Icons.photo_camera,
                              size: 16,
                              color: Color(0xFF101010),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text('Nome do Usuário'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}