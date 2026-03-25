import 'package:flutter/material.dart';

class LaptopScreen extends StatefulWidget {
  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  String selectedSort = 'Price: Low to High';
  bool isGrid2Column = true;
  late int crossAxisCount;

  @override
  void initState() {
    super.initState();
    crossAxisCount = 2;
  }

  final List<Map<String, dynamic>> laptops = [
    {
      'name': 'Dell XPS 13',
      'price': '\$999',
      'image': 'assets/images/xps13.png',
    },
    {
      'name': 'MacBook Air',
      'price': '\$1299',
      'image': 'assets/images/macbook_air.png',
    },
    {
      'name': 'HP Pavilion',
      'price': '\$599',
      'image': 'assets/images/hp_pavilion.png',
    },
    {
      'name': 'Lenovo ThinkPad',
      'price': '\$899',
      'image': 'assets/images/lenovo_thinkpad.png',
    },
    {
      'name': 'ASUS VivoBook',
      'price': '\$699',
      'image': 'assets/images/asus_vivobook.png',
    },
    {
      'name': 'Acer Aspire',
      'price': '\$749',
      'image': 'assets/images/acer_aspire.png',
    },
    {
      'name': 'MSI GS66',
      'price': '\$1299',
      'image': 'assets/images/msi_gs66.png',
    },
    {
      'name': 'Razer Blade',
      'price': '\$1599',
      'image': 'assets/images/razer_blade.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Laptop',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Toolbar with Sort, Filter, and Layout buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Sort Dropdown
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedSort,
                    isExpanded: true,
                    items:
                        [
                          'Price: Low to High',
                          'Price: High to Low',
                          'Newest',
                          'Rating: High to Low',
                          'Most Popular',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSort = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                // Filter Button
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Filter options')),
                    );
                  },
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                // Layout Toggle Button
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isGrid2Column = !isGrid2Column;
                      crossAxisCount = isGrid2Column ? 2 : 3;
                    });
                  },
                  icon: Icon(isGrid2Column ? Icons.apps : Icons.dashboard),
                  label: Text(isGrid2Column ? '2x4' : '3x3'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Grid of Laptops
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 200 / 300,
              ),
              itemCount: laptops.length,
              itemBuilder: (context, index) {
                final laptop = laptops[index];
                return _buildLaptopCard(laptop);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        onTap: (index) {
          // Handle navigation
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Tapped item $index')));
        },
      ),
    );
  }

  Widget _buildLaptopCard(Map<String, dynamic> laptop) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${laptop['name']} selected')));
      },
      style: ElevatedButton.styleFrom(
        elevation: 8,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  laptop['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.laptop, size: 50),
                    );
                  },
                ),
              ),
            ),
          ),
          // Name and Price
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    laptop['name'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    laptop['price'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
