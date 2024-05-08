import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListProduct(),
    );
  }
}

class Product {
  final String nme_prdct;
  final String imgurl;
  final String dscr;
  final double price;

  Product(this.nme_prdct, this.imgurl, this.dscr, this.price);
}

final List<Product> products = [
  Product('Adidas Cloudfoam', 'assets/images/sneaker.png', 'Runner!', 600.0),
  Product('Adidas Balencia', 'assets/images/sneaker.png', 'Gym!', 500.0),
  Product('Adidas Burn', 'assets/images/sneaker.png', 'Swimming!', 400.0),
  Product('Adidas Bren', 'assets/images/sneaker.png', 'Bad Day!', 300.0),
];

class ListProduct extends StatelessWidget {
  ListProduct({super.key, Key});

  final List<Color> colors = [
    Color.fromARGB(255, 20, 181, 119),
    Color.fromARGB(255, 199, 14, 134),
    Color.fromARGB(255, 199, 8, 8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Text('Shoes',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/crown-10716.png'),
                  radius: 24.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.nme_prdct,
                                style: const TextStyle(fontSize: 20.0)),
                            const SizedBox(height: 8.0),
                            Text(product.dscr),
                            const SizedBox(height: 8.0),
                            Text('${product.price}',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.imgurl, width: 80.0, height: 80.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
