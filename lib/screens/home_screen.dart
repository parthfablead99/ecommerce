import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/screens/products_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> imagesFeat = [
    'assets/image/image1.jpg',
    'assets/image/images2.jpg',
    'assets/image/images3.jpg',
    'assets/image/download.jpg',
    'assets/image/download1.jpg',
    'assets/image/download2.jpg',
  ];

  final List<String> imagesCat = [
    'assets/image/download.jpg',
    'assets/image/download1.jpg',
    'assets/image/download2.jpg',
    'assets/image/image1.jpg',
    'assets/image/images2.jpg',
    'assets/image/images3.jpg',
  ];

  final List<String> bannerImage = [
    'assets/image/banner.jpg',
    'assets/image/banner1.jpeg',
  ];
  @override

  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 4,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/image/image1.jpg'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text(
              'Welcome',
              style: textTheme.headlineSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, size: 28, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            CarouselSlider(
                items: bannerImage.map((imagepath){
                  return Builder(
                      builder: (BuildContext context){
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage(imagepath),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 120,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  enlargeCenterPage: false,
                ),
            ),
            // Container(
            //   height: 120,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     // color: Colors.blue,
            //     borderRadius: BorderRadius.circular(12),
            //     image: DecorationImage(
            //         image: AssetImage('assets/image/banner.jpg'),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            Text(
              'Category',
              style: textTheme.headlineSmall?.copyWith(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> ProductsList(images:imagesFeat,)));
              },
              child: Text('See All',
                style: textTheme.bodySmall?.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(imagesCat.length,
                      (index) => Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(imagesCat[index]),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: textTheme.headlineSmall?.copyWith(fontSize: 18,fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> ProductsList(images:imagesFeat,)));
                  },
                  child: Text('See All',
                      style: textTheme.bodySmall?.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagesFeat.length,
                itemBuilder: (BuildContext context, int index) {
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
                              imagesFeat[index],
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
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Most Popular',
              style: textTheme.headlineSmall?.copyWith(fontSize: 18,fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: imagesFeat.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white70,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          imagesCat[index],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text('Product Name',
                          style: textTheme.headlineSmall?.copyWith(fontSize: 14,fontWeight: FontWeight.bold)),
                      subtitle: Text('Price',
                        style: textTheme.bodySmall?.copyWith(fontSize: 12),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
