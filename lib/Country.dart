import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Country extends StatelessWidget{
  final Map country;

  Country(this.country);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.pink,
      title:Text(country['name']),
    ),
      body:Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Captial'),
              back: CountryDetailCard(title:country['capital'],
              color: Colors.deepOrange,),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Population'),
              back: CountryDetailCard(title:country['population'].toString(),
              color: Colors.deepPurple,),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Flag'),
              back: Card(
                color: Colors.white,
                elevation:10,
                child: Center(child:SvgPicture.network(country['flag'], width: 200,)),
                ),
              ),

            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Currency'),
              back: CountryDetailCard(title:country['currencies'][0]['name'],
              color: Colors.blue,),
            ),
            CountryCard(title: 'Show On Map',),
            ],
        ),
      )
    );
  }

}

class CountryDetailCard extends StatelessWidget {
  final String title;
  final MaterialColor color;
  const CountryDetailCard({
    Key key,
    this.title,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation:10,
        child: Center(child: Text(title,
        style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 10,
    child: Center(child: Text(title,
      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
    )),
          );
  }
}