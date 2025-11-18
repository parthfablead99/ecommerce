import 'package:ecommerceapp/controller/fav_controller.dart';
import 'package:ecommerceapp/view/fav_screen.dart';
import 'package:ecommerceapp/view/product_detail.dart';
import 'package:ecommerceapp/view/products_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controller/home_controller.dart';
import '../model/product_detail_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  final FavController favController = Get.find<FavController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                Text("Welcome ,", style: textTheme.headlineSmall?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                )),
                Text("User", style: textTheme.headlineSmall?.copyWith(fontSize: 14)),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu, size: 28, color: Colors.black),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (v) => controller.searchText.value = v,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.search,
                    size: 22,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,width: 1
                  ),
                ),
                constraints: BoxConstraints(maxHeight: 55),
              ),
            ),

            SizedBox(height: 15),

            Obx((){
              return Column(
                children: [
                  CarouselSlider(
                      items: controller.bannerImage.map((img){
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 6
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              )
                            ],
                            image: DecorationImage(
                                image: AssetImage(img),
                              fit: BoxFit.cover
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 180,
                        viewportFraction: .95,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason){
                          controller.bannerIndex.value = index;
                        }
                      ),
                  ),
                  SizedBox(height: 8),

                  Obx(()=> Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        controller.bannerImage.length, (index){
                          bool isActive = controller.bannerIndex.value == index;
                          return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: isActive ? 20 : 8,
                            decoration: BoxDecoration(
                              color: isActive ? Colors.deepPurpleAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                    }
                    ),
                  ),
                  ),
                ],
              );
            }),

            // Obx(() => CarouselSlider(
            //   items: controller.bannerImage.map((img) => Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       image: DecorationImage(
            //         image: AssetImage(img),
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   )).toList(),
            //   options: CarouselOptions(
            //     height: 160,
            //     viewportFraction: 1,
            //     autoPlay: true,
            //     autoPlayInterval: Duration(seconds: 3),
            //   ),
            // )),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(ProductsList(),
                    arguments: controller.categories);
                  },
                  child: Text('See All',
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.categories.map((p) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(p.image),
                      ),
                      SizedBox(height: 5),
                      Text(p.name, style: textTheme.headlineSmall?.copyWith(fontSize: 14),),
                    ],
                  ),
                )).toList(),
              ),
            )),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(ProductsList(),
                    arguments: controller.featured,
                    );
                  },
                  child: Text('See All',
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

        SizedBox(
          height: 180,
          child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.featured.length,
              // padding: EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                ProductModel p = controller.featured[index];

                return GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.productDetail,arguments: p),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                          child: Image.asset(
                            p.image,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.headlineSmall?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),

                              Text(
                                p.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.headlineSmall?.copyWith(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "₹${p.price}",
                                style: textTheme.bodySmall?.copyWith(fontSize: 12)
                              ),
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
        ),

        SizedBox(height: 20),

            Text(
              "Most Popular",
              style: textTheme.headlineSmall?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                ProductModel p = controller.categories[index];
                return GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.productDetail,arguments: p),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    margin: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ]
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            p.image,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12,),

                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),

                                Text(
                                  p.description,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("₹${p.price}",
                                style: textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                ),
                              ],
                            ),
                        ),
                        SizedBox(width: 8),

                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurpleAccent.withOpacity(0.8),
                          ),
                          child: Icon(
                              Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        )

                      ],
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),

      // bottomNavigationBar: Obx((){
      //   return Container(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(25),
      //         topRight: Radius.circular(25),
      //       ),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black12,
      //           blurRadius: 15,
      //           offset: Offset(0, -3)
      //         ),
      //       ]
      //     ),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.only(
      //         topRight: Radius.circular(25),
      //         topLeft: Radius.circular(25),
      //       ),
      //       child: BottomNavigationBar(
      //         onTap: (index){
      //             controller.onBottomTap(index);
      //             if(index == 2){
      //               Get.to(()=> FavScreen());
      //             }
      //         },
      //         showUnselectedLabels: false,
      //         showSelectedLabels: false,
      //         unselectedItemColor: Colors.grey.shade500,
      //         selectedItemColor: Colors.deepPurpleAccent,
      //         currentIndex: controller.selectedIndex.value,
      //         backgroundColor: Colors.white,
      //         elevation: 0,
      //         type: BottomNavigationBarType.fixed,
      //         items: [
      //           _navItem(Icons.home,0,controller),
      //           _navItem(Icons.search,1,controller),
      //           _navItem(Icons.favorite,2,controller),
      //           _navItem(Icons.person,3,controller),
      //         ],
      //       ),
      //     ),
      //   );
      // }),
      // bottomNavigationBar: Obx(() => BottomNavigationBar(
      //   currentIndex: controller.selectedIndex.value,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   onTap: (index){
      //     controller.onBottomTap(index);
      //
      //     if(index == 2){
      //       Get.to(()=> FavScreen());
      //     }
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      //   ],
      // )),
    );
  }
  // BottomNavigationBarItem _navItem(IconData icon, int index, controller) {
  //   bool isSelected = controller.selectedIndex.value == index;
  //
  //   return BottomNavigationBarItem(
  //     label: '',
  //     icon: AnimatedContainer(
  //       duration: Duration(milliseconds: 250),
  //       padding: EdgeInsets.all(isSelected ? 10 : 5),
  //       decoration: BoxDecoration(
  //         color: isSelected ? Colors.deepPurpleAccent.withOpacity(0.15) : Colors.transparent,
  //         shape: BoxShape.circle,
  //       ),
  //       child: Icon(
  //         icon,
  //         size: isSelected ? 28 : 24,
  //         color: isSelected ? Colors.deepPurpleAccent : Colors.grey.shade500,
  //       ),
  //     ),
  //   );
  // }
}
