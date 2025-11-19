import 'package:carousel_slider/carousel_slider.dart';
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('assets/image/image1.jpg'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome,", style: textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("User", style: textTheme.headlineSmall?.copyWith(fontSize: 14)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black, size: 28),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // — Search field
              TextField(
                onChanged: provider.updateSearchText,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurpleAccent, size: 22),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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

              const SizedBox(height: 20),

              // — Banner Slider
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
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    provider.updateBannerIndex(index);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // — Banner indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: provider.bannerImage.asMap().entries.map((entry) {
                  final idx = entry.key;
                  bool active = provider.bannerIndex == idx;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: active ? 20 : 8,
                    decoration: BoxDecoration(
                      color: active ? Colors.deepPurpleAccent : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              // — Category Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Category", style: textTheme.headlineSmall?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProductsList(products: provider.categories,)),
                      );
                    },
                    child: const Text("See All"),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // — Category List
              SizedBox(
                height: 100,
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
                        const SizedBox(height: 6),
                        Text(cat.name, style: textTheme.headlineSmall?.copyWith(
                          fontSize: 12
                        )),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // — Featured Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured", style: textTheme.headlineSmall?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProductsList(products: provider.featured,)),
                      );
                    },
                    child: const Text("See All"),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // — Featured Products
              SizedBox(
                height: 200,
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
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                              child: Image.asset(
                                prod.image,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(prod.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.headlineSmall?.copyWith(
                                        fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                      )),
                                  const SizedBox(height: 4),
                                  Text("₹${prod.price}",
                                      style: textTheme.bodySmall?.copyWith(color: Colors.deepPurpleAccent)),
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

              const SizedBox(height: 30),

              // — Most Popular (same as categories for now)
              Text("Most Popular", style: textTheme.headlineSmall?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.categories.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
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
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(prod.image, width: 70, height: 70, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(prod.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:textTheme.headlineSmall?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                                const SizedBox(height: 4),
                                Text(prod.description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.headlineSmall?.copyWith(
                                      fontSize: 12
                                    ),
                                ),
                                Text("₹${prod.price}",
                                    style: textTheme.bodySmall?.copyWith(color: Colors.deepPurpleAccent)),
                              ],
                            ),
                          ),
                          Container(
                            height: 28,
                              width: 28,
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

              const SizedBox(height: 30),
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
