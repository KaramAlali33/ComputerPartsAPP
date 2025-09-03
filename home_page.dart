import 'package:flutter/material.dart';
import 'package:myapp/cart_pagee.dart';
import 'package:myapp/profile_page.dart';
import 'package:myapp/search_page.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}


final List<Product> products = [
  Product(
    name: 'Intel Core i9-13900K ',
    description: '''
• 24-core (8P+16E) 32-thread processor
• Up to 5.8GHz Turbo Boost
• Intel UHD Graphics 770
• 36MB Intel Smart Cache
• Unlocked for overclocking
• 125W TDP, compatible with LGA1700 socket
• Perfect for gaming, content creation, and intensive multitasking
''',
    price: 299.99,
    imagePath: 'images/CPU.png',
  ),
  Product(
    name: 'RTX 4090 Card',
    description: '''
• 24GB GDDR6X memory with 384-bit interface
• 16,384 CUDA cores
• DLSS 3.0 and real-time ray tracing
• 4K/8K gaming ready
• HDMI 2.1 and DisplayPort 1.4a outputs
• Triple-fan cooling system with vapor chamber
• Requires 850W PSU minimum
''',
    price: 499.99,
    imagePath: 'images/GraphicsCard.png',
  ),
  Product(
    name: 'Gaming Keyboard',
    description: '''
• Full-size with Cherry MX Red switches (45g actuation force)
• RGB backlighting with 16.8 million colors
• Aircraft-grade aluminum frame
• Detachable USB-C cable
• Dedicated media controls
• N-key rollover and 1000Hz polling rate
''',
    price: 89.99,
    imagePath: 'images/Keyboard.png',
  ),
  Product(
    name: '27" 4K UHD Monitor',
    description: '''
• IPS panel, 3840×2160 resolution
• 144Hz refresh rate, 1ms response time
• 99% sRGB and 95% DCI-P3 color gamut
• HDR600 certified
• AMD FreeSync Premium Pro and NVIDIA G-Sync compatible
• HDMI 2.1, DisplayPort 1.4, USB-C with 90W power delivery
''',
    price: 299.99,
    imagePath: 'images/Monitor.png',
  ),
  Product(
    name: 'ASUS Motherboard',
    description: '''
• LGA1700 socket for 12th/13th Gen Intel Core
• DDR5 support up to 7800MHz (OC)
• 18+1 power stages with 90A power solution
• PCIe 5.0 x16 slot
• Five M.2 slots (four PCIe 4.0)
• Thunderbolt 4 support
• Onboard WiFi 6E and 2.5Gb LAN
• ESS Sabre DAC and SupremeFX shielding audio
''',
    price: 199.99,
    imagePath: 'images/Motherboard.png',
  ),
  Product(
    name: '850W Power Supply',
    description: '''
• 80 Plus Gold certified, 90% efficiency
• Fully modular cable design
• Premium Japanese capacitors
• 140mm fluid dynamic bearing fan
• Single +12V rail with 70.8A output
• PCIe 5.0 12VHPWR connector
• 10-year warranty
''',
    price: 49.99,
    imagePath: 'images/Power.png',
  ),
  Product(
    name: '32GB DDR5 RAM Kit',
    description: '''
• 2×16GB DDR5-6000 CL36
• XMP 3.0 ready
• Aluminum heat spreader with RGB lighting
• On-die ECC for stability
• Optimized for Intel 12th/13th Gen and AMD Ryzen 7000
• 1.25V operating voltage
''',
    price: 89.99,
    imagePath: 'images/RAM.png',
  ),
  Product(
    name: '1TB NVMe SSD',
    description: '''
• PCIe 4.0 x4 interface
• Read speeds up to 7000MB/s, write speeds up to 5300MB/s
• 3D TLC NAND with DRAM cache
• M.2 2280 form factor
• 1.5 million hours MTBF
• 5-year limited warranty, 600TBW endurance
• Ideal for OS, games, and creative apps
''',
    price: 149.99,
    imagePath: 'images/SSD.png',
  ),
  Product(
    name: 'Webcam',
    description: '''
• 1080p Full HD resolution at 30fps
• Built-in microphone
• Autofocus and light correction
• Compatible with Windows, macOS, and Chrome OS
''',
    price: 59.99,
    imagePath: 'images/Webcam.png',
  ),
 Product(
    name: 'CPU Cooler',
    description: '''
• Air cooler with aluminum fins and copper heatpipes
• 120mm PWM fan
• Quiet operation
• Easy installation
• Compatible with Intel and AMD sockets
''',
    price: 49.99,
    imagePath: 'images/Cooler.png',
  ),
  Product(
    name: 'Speakers',
    description: '''
• 2.0 Channel Stereo Speakers
• Compact design
• USB powered
• Headphone jack
''',
    price: 129.99,
    imagePath: 'images/Speakers.png',
  ),
  Product(
    name: 'Mouse',
    description: '''
• Ergonomic design
• Optical sensor with adjustable DPI
• 6 programmable buttons
• USB connection
''',
    price: 29.99,
    imagePath: 'images/Mouse.png',
  ),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Parts ', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          icon: Icon(Icons.person),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(allProducts: products),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/product', arguments: product);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    product.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
