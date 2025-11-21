import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../routes/app_routes.dart';
import '../../productdetailscreen/model/productModel.dart';
import '../../productslistscreen/view/productlist_screen.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final textTheme = Theme.of(context).textTheme;

    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/image/image1.jpg'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome,", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 16)),
                Text("User", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 12)  ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black, size: 28),
            onPressed: () {
              // Add menu action if needed
            },
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          // optionally refresh or reload state
          // provider._initializeData(); // if you make method public
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: provider.updateSearchText,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: Colors.deepPurpleAccent, size: 22),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1),
                  ),
                ),
              ),

              SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: provider.bannerImage.length,
                itemBuilder: (context, index, realIdx) {
                  final imageUrl = provider.bannerImage[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: SizeConfig.blockHeight * 20,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    provider.updateBannerIndex(index);
                  },
                ),
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: provider.bannerImage.asMap().entries.map((entry) {
                  final idx = entry.key;
                  bool active = provider.bannerIndex == idx;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: SizeConfig.blockHeight * 1,
                    width: active ? SizeConfig.blockWidth*3 : SizeConfig.blockWidth * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? Colors.deepPurpleAccent : Colors.grey,
                      // borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: SizeConfig.blockHeight * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Category",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProductsList(products: provider.categories,)),
                      );
                    },
                    child: Text("See All",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.blockHeight * 1),
              SizedBox(
                height: SizeConfig.blockHeight * 13,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.categories.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final cat = provider.categories[index];
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(cat.image),
                        ),
                        SizedBox(height: SizeConfig.blockHeight * 1),
                        Text(cat.name,
                            style:Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: SizeConfig.blockHeight * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProductsList(products: provider.featured,)),
                      );
                    },
                    child: Text("See All",
                    style: Theme.of(context).textTheme.bodyMedium,),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.blockHeight * 1),
              SizedBox(
                height: SizeConfig.blockHeight * 21,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.featured.length,
                  itemBuilder: (context, index) {
                    final ProductModel prod = provider.featured[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.productDetail,
                          arguments: prod,
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        margin: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                        width: SizeConfig.blockWidth * 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                              child: Image.asset(
                                prod.image,
                                height: SizeConfig.blockHeight * 11,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(prod.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),
                                  ),
                                  SizedBox(height: SizeConfig.blockHeight * .3),
                                  Text(prod.description,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10
                                    ),
                                  ),
                                  Text("₹${prod.price}",
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 10,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: SizeConfig.blockHeight * 3),
              Text("Most Popular",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold
                  )),
              SizedBox(height: SizeConfig.blockHeight * 2),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: provider.categories.length,
                separatorBuilder: (context, index) => SizedBox(height: SizeConfig.blockHeight * 2),
                itemBuilder: (context, index) {
                  final ProductModel prod = provider.categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productDetail,
                        arguments: prod,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                                prod.image,
                                width: SizeConfig.blockWidth * 20,
                                height: SizeConfig.blockHeight * 9,
                                fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(prod.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    ),
                                ),
                                SizedBox(height: SizeConfig.blockHeight * .5),
                                Text(prod.description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 10
                                    ),
                                ),
                                Text("₹${prod.price}",
                                    style: textTheme.bodyMedium?.copyWith(fontSize: 10)),
                              ],
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockHeight * 3.5,
                              width: SizeConfig.blockWidth * 7,
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.white,
                              ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // — Bottom Navigation Bar
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: provider.selectedIndex,
      //   onTap: provider.onBottomNavTap,
      //   backgroundColor: Colors.white,
      //   selectedItemColor: Colors.deepPurpleAccent,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
    );
  }
}
