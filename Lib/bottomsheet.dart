import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBottomSheet extends StatefulWidget {
  final Map<String, dynamic> product;
  final bool darkMode;

  MyBottomSheet({required this.product, required this.darkMode});

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int quantity = 1;
  List<dynamic> cart = [];

  void _increase(String productName) {
    setState(() {
      cart.add([productName, quantity]);
      quantity++;
    });
  }

  void _decrease(String productName) {
    setState(() {
      cart.removeWhere((item) => item[0] == productName);
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Select Quantity',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: CircleAvatar(
                  child: Icon(Icons.remove, color: Colors.green),
                  radius: 15,
                  backgroundColor: widget.darkMode
                      ? Colors.grey[200]?.withOpacity(0.4)
                      : Colors.grey[200],
                ),
                onTap: () {
                  _decrease(widget.product['name']);
                },
              ),
              Text(
                quantity.toString(),
                style: GoogleFonts.lato(color: Colors.black),
              ),
              InkWell(
                child: CircleAvatar(
                  child: Icon(Icons.add, color: Colors.green),
                  radius: 15,
                  backgroundColor: widget.darkMode
                      ? Colors.grey[200]?.withOpacity(0.4)
                      : Colors.grey[200],
                ),
                onTap: () {
                  _increase(widget.product['name']);
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                cart.add([widget.product['name'], quantity]);
              });
              Navigator.pop(context);
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
