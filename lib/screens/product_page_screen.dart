import 'package:flutter/material.dart';
import 'home_screen.dart';

// A part of the code in this page was written with the help of AI

class ProductPageScreen extends StatefulWidget {
  @override
  State<ProductPageScreen> createState() => _ProductPageScreenState();
}

class _ProductPageScreenState extends State<ProductPageScreen> {
  String selectedCapacity = '';
  int selectedColorIndex = 0;

  final List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.yellow,
  ];
  final List<String> colorNames = ['Space Black', 'Silver', 'Purple', 'Gold'];
  final List<String> capacities = ['64GB', '256GB', '512GB'];
  final List<String> images = [
    '/home/utsav-khadga/Documents/HomeworkUI/homeworkui/lib/screens/assets/images/iphone1.png',
    '/home/utsav-khadga/Documents/HomeworkUI/homeworkui/lib/screens/assets/images/iphone2.png',
    '/home/utsav-khadga/Documents/HomeworkUI/homeworkui/lib/screens/assets/images/iphone3.png',
  ];

  @override
  void initState() {
    super.initState();
    selectedCapacity = capacities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Product Page"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'iPhone 11 Pro',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Image.asset(
                images[1],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 24),
              Text(
                'Color',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  colors.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColorIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors[index],
                        border: selectedColorIndex == index
                            ? Border.all(color: Colors.blue, width: 3)
                            : Border.all(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Capacity',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: capacities.map((capacity) {
                  bool isSelected = selectedCapacity == capacity;
                  return Container(
                    margin: EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCapacity = capacity;
                        });
                      },
                      child: Text(
                        capacity,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Added to cart!')));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    icon: Icon(Icons.home),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    icon: Icon(Icons.person),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
