import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  final List<String> images;
  const ProductsList({Key? key, required this.images}): super(key:key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Products',
        style: textTheme.headlineLarge?.copyWith(fontSize: 20,fontWeight: FontWeight
        .bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: widget.images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (BuildContext context, int index){
              return Card(
                color: Colors.white70,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.images[index],
                          width: double.infinity,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Name',
                          style: textTheme.headlineSmall?.copyWith(fontSize: 14,fontWeight: FontWeight.bold)),
                      Text('Price',
                        style: textTheme.bodySmall?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
          }
        ),
      ),
    );
  }
}
