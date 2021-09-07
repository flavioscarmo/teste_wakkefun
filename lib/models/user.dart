
import 'dart:convert';

class User {
  String? usuarioApelido;
  String usuarioImagemPerfil = "";
  int? comentarioQuantidade;
  int? mediaNota;
  String? imagemCapa = "";
  String? titulo;
  String? descricao;


  User(
     this.usuarioApelido,
     this.usuarioImagemPerfil,
     this.comentarioQuantidade,
     this.mediaNota ,
     this.imagemCapa,
     this.titulo,
     this.descricao,
  );

  User.fromJson(Map<String, dynamic> json){
    usuarioApelido = json['usuario_autor_apelido'];
    usuarioImagemPerfil = json['usuario_autor_imagem_perfil']??"";
    comentarioQuantidade = json['comentarios_qtd']??0;
    mediaNota = json['media_nota']??0;
    imagemCapa = json['imagem_capa']??"";
    titulo = json['titulo']??"";
    descricao = json['descricao']??'';

  }
}