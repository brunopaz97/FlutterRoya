import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget{

  final heroTag;
  final Wpoknom,Wpoktipo,Wpoknum, Wpokimg, Wpokaltura, Wpokpeso;

  const DetailsScreen({Key? key, this.heroTag, this.Wpoknom, this.Wpoktipo, this.Wpoknum, this.Wpokimg, this.Wpokaltura, this.Wpokpeso}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>{
  @override
  Widget build(BuildContext context){

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
        widget.Wpoktipo=="Grass" ? Colors.greenAccent
          : widget.Wpoktipo=="Fire" ? Colors.redAccent
          : widget.Wpoktipo=="Water" ? Colors.blueAccent
          : widget.Wpoktipo=="Bug" ? Colors.orangeAccent
          : widget.Wpoktipo=="Normal" ? Colors.tealAccent
          : widget.Wpoktipo=="Poison" ? Colors.purple
          : widget.Wpoktipo=="Electric" ? Colors.amberAccent
          : widget.Wpoktipo=="Ground" ? Colors.pinkAccent
          : widget.Wpoktipo=="Fighting" ? Colors.brown
          : widget.Wpoktipo=="Psychic" ? Colors.pinkAccent.withOpacity(0.5)
          : widget.Wpoktipo=="Rock" ? Colors.greenAccent
          : widget.Wpoktipo=="Ghost" ? Colors.indigo
          : widget.Wpoktipo=="Ice" ? Colors.lightBlue
          : widget.Wpoktipo=="Dragon" ? Colors.deepPurpleAccent
          : Colors.grey,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FechaAtras(),
          _NombreNroPokemon(),
          _TipoPokemon(),
          _PokeballFondo(),
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20),
                        child: Row(children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Altura:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.Wpokaltura.toString(),
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          )
                        ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Peso:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.Wpokpeso.toString(),
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          )
                        ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          Positioned(
              top: (height*0.2),
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.Wpokimg,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _FechaAtras(){
    return Positioned(
        top: 40,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        )
    );
  }

  Widget _NombreNroPokemon(){
    return Positioned(
        top: 95,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.Wpoknom.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "#"+ widget.Wpoknum.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        )
    );
  }

  Widget _TipoPokemon(){
    return Positioned(
        top: 140,
        left: 25,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.Wpoktipo.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        )
    );
  }

  Widget _PokeballFondo(){

    var height = MediaQuery.of(context).size.height;

    return Positioned(
        right: -30,
        top: height * 0.18,
        child: Image.asset(
          'images/pokeball.png',
          height: 200,
          fit: BoxFit.fitHeight,
        )
    );
  }
}

