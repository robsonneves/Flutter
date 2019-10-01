import 'package:firebase/Home.dart';
import 'package:flutter/material.dart';

void main() async {

  runApp(
    MaterialApp(
      home: Home(),
    )
  );

}

////////////////// Auth
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

/*
  FirebaseAuth auth = FirebaseAuth.instance;

  /* Criando usuario com email e senha */
  String email = "robson.rodrigues@gft.com";
  String senha = "123456";


*/

  // deslogar usuario
  //auth.signOut();

  // Logar
  /*
  auth.signInWithEmailAndPassword(
      email: email,
      password: senha
  ).then((firebase){
    print("Usuario logado com sucesso: " +firebase.email );
  }).catchError((error){
    print("Erro ao logar : " + error.toString());
  });

   */

  /*
  FirebaseUser usuarioAtual =  await auth.currentUser();
  if( usuarioAtual != null){
    //logado
    print("Usuario logado : " + usuarioAtual.email);
  }else{
    //deslogado
    print("Usuario deslogado !!!");
  }

   */


  /*
  auth.createUserWithEmailAndPassword(
      email: email, 
      password: senha
  ).then((firebaseUser){
    print("Novo usuario " + firebaseUser.email );
  }).catchError((erro){
    print("Novo usuario erro " + erro.toString() );
  });
   */







////////////////// Banco de dados
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////


  //Firestore db = Firestore.instance;

  /*
  var pesquisa  = "an";

  QuerySnapshot querySnapshot = 
    await db.collection("usuarios")
            //.where("nome", isEqualTo: "joao")
            //.where("idade", isEqualTo: "25")
            //.where("idade", isGreaterThan: "15") // maior que
            //.where("idade", isLessThan: "15") // menor que
            //.where("idade", isLessThan: "15") // menor que

            .where("nome", isGreaterThanOrEqualTo: pesquisa) // menor que
            .where("nome", isLessThanOrEqualTo: "an" + "\uf8ff" )

            //.orderBy("idade", descending: true) // do maior para o menor
            //.orderBy("idade", descending: false) // do menor para o maior
            //.orderBy("nome", descending: true)
            //.limit(2) // limite no resultado da consulta
            .getDocuments();

  for( DocumentSnapshot item in querySnapshot.documents){

    var dados = item.data;
    prefix0.print("filtro nome ${dados["nome"]} idade: ${dados["idade"]}");

  }
   */


  /*
  db.collection("usuarios")
    .snapshots().listen(
      (snapshot){
        //prefix0.print("dados " +snapshot.documents.toString());

        for( DocumentSnapshot item in snapshot.documents){
          var dados =  item.data;
          prefix0.print("dados do usuario : " + dados["nome"]);
        }

      }
  );
   */


  /*
  QuerySnapshot querySnapshot = await db.collection("usuarios").getDocuments();

  //prefix0.print("dados dos usuarios : " + querySnapshot.documents.toString());


  for( DocumentSnapshot item in querySnapshot.documents){
    var dados =  item.data;
    prefix0.print("dados do usuario : " + dados["nome"]);
  }
   */



  /*
  DocumentSnapshot snapshot = await db.collection("usuarios")
    .document("001")
    .get();

  var dados = snapshot.data;
  prefix0.print("dados: " + dados["nome"]);
   */
  //print(snapshot.data.toString());



  /*
  db.collection("usuarios")
    .document("003'")
    .delete();
   */

  /*
  db.collection("noticias")
    .document("wE95TgZlLt0dJiyRvczn")
    .setData({
    "titulo": "Ondas de calor Auterado!",
    "descricao": "texto de exemplo ..."
  });
   */


  /*
  DocumentReference ref = await db.collection("noticias")
    .add(
      {
        "titulo": "Ondas de calor !",
        "descricao": "texto de exemplo ..."
      }
    );

  print("item salvo " + ref.documentID);
   */
  
  
  // Criar atualizar 
  /*
  db.collection("usuarios")
    .document("002")
    .setData(
      {
        "nome":"Ana Maria Silva",
        "idade":"25"
      }
    );
   */

  
  /*
  Firestore.instance
    .collection("usuarios")
    .document("pontuacao")
    .setData({"calor": "80", "Silvana" : "340"});
   */

  //runApp(App());

//}

/*
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

 */

