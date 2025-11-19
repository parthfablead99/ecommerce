import 'package:ecommerceapp/screen/checkoutscreen/provider/checkOutProvider.dart';
import 'package:ecommerceapp/screen/checkoutscreen/view/paymentScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postalController = TextEditingController();

  String? selectedProvince;
  String? selectedCity;

  final provinces = ["Gujarat", "Maharashtra", "Rajasthan"];
  final cities = ["Surat", "Ahmedabad", "Vadodara"];


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CheckoutProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
            'Check Out',
          style: textTheme.headlineSmall?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(
                  Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                          Icons.local_shipping_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(height: 4,),
                      Text('Shipping',
                        style: textTheme.headlineSmall?.copyWith(
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: 50,
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.payment_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(height: 4),
                      Text('Payment',
                        style: textTheme.headlineSmall?.copyWith(
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: 50,
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(height: 4),
                      Text('Review',
                        style: textTheme.headlineSmall?.copyWith(
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 18),

              Center(
                child: Text('Enter Shipping Details',
                  style: textTheme.headlineSmall?.copyWith(
                      fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text('Full Name',
                style: textTheme.headlineSmall?.copyWith(
                    fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                cursorColor: Colors.black,
                controller: nameController,
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                ),
                decoration: _fieldDecoration('Enter your name'),
                validator: (v) => v!.isEmpty ? 'Required': null,
              ),
              SizedBox(height: 15),

              Text('Phone Number',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),

              TextFormField(
                cursorColor: Colors.black,
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                ),
                controller: numController,
                decoration: _fieldDecoration('+91 | Enter mobile number'),
                keyboardType: TextInputType.phone,
                validator: (v) => v!.length < 10? 'Enter valid number':null,
              ),
              SizedBox(height: 15),

              Text('Select Province',
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5),

              DropdownButtonFormField(
                decoration: _fieldDecoration("Select Province"),
                items: provinces
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: (value) => setState(() => selectedProvince = value),
                validator: (v) => v == null ? "Required" : null,
              ),
              SizedBox(height: 15),

              Text('Select City',
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),

              DropdownButtonFormField(
                decoration: _fieldDecoration("Select City"),
                items: cities
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) => setState(() => selectedCity = value),
                validator: (v) => v == null ? "Required" : null,
              ),
              SizedBox(height: 15),

              Text('Address',
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                cursorColor: Colors.black,
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                ),
                controller: streetController,
                decoration: _fieldDecoration('Enter Address'),
                validator: (v) => v!.isEmpty ? 'Required': null,
              ),
              SizedBox(height: 15),

              Text('Postal Code',
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5),

              TextFormField(
                cursorColor: Colors.black,
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 12,
                ),
                controller: postalController,
                keyboardType: TextInputType.number,
                decoration: _fieldDecoration('Enter Postal Code'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 35),

              Center(
                child: GestureDetector(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      provider.updateShipping(
                          fullName: nameController.text,
                          phone: numController.text,
                          province: selectedProvince!,
                          city: selectedCity!,
                          street: streetController.text,
                          postalCode: postalController.text,
                      );
                      Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PaymentScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text('Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
  InputDecoration _fieldDecoration(String hint){
    return InputDecoration(
      fillColor: Colors.grey.shade200,
      filled: true,
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

    );
  }
}
