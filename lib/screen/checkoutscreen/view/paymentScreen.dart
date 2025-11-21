import 'package:ecommerceapp/screen/checkoutscreen/provider/checkOutProvider.dart';
import 'package:ecommerceapp/screen/checkoutscreen/view/reviewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/size_config.dart';
import '../../../utils/stepIndicator.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  final _formKey = GlobalKey<FormState>();

  final cardnameController = TextEditingController();
  final cardnumController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  String? selectedPaymentMethod;

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

  @override
  Widget build(BuildContext context) {
    final payMent = Provider.of<CheckoutProvider>(context,listen: false);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stepindicator(currentStep: 2),
              SizedBox(height: SizeConfig.blockHeight *2),
        
              Center(
                child: Text('Select Payment Method',
                  style: textTheme.headlineSmall?.copyWith(
                      fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockHeight *3),
        
              paymentOption(
                  title: 'Credit Card',
                  asset: 'assets/image/creditcard.png',
                  value: 'Credit Card',
              ),
              paymentOption(
                  title: 'Stripe',
                  asset: 'assets/image/stripelogo.png',
                  value: 'Stripe',
              ),
              paymentOption(
                  title: 'Razor Pay',
                  asset: 'assets/image/razorpay.png',
                  value: 'RazorPay',
              ),
        
              if(selectedPaymentMethod == 'Credit Card')...[
                SizedBox(height: SizeConfig.blockHeight *3),
        
                Form(
                  key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Card Holder Name',
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockHeight *1),
                        TextFormField(
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          cursorColor: Colors.black,
                          controller: cardnameController,
                          decoration: _fieldDecoration('Enter Card Holder Name'),
                          validator: (v)=> v!.isEmpty ? 'Required' : null,
                        ),
                        SizedBox(height: SizeConfig.blockHeight *2),
        
                        Text('Card Number',
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockHeight *1),
                        TextFormField(
                          cursorColor: Colors.black,
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: cardnumController,
                          keyboardType: TextInputType.number,
                          decoration: _fieldDecoration('Enter Card Number'),
                          validator: (v) => v!.length <16 ? 'Invalid Card Number':null,
                        ),
                        SizedBox(height: SizeConfig.blockHeight *2),
        
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Expiry Date',
                                      style: textTheme.headlineSmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: SizeConfig.blockHeight *1),
        
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      style: textTheme.headlineSmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      controller: expiryController,
                                      keyboardType: TextInputType.datetime,
                                      decoration: _fieldDecoration('MM/YY'),
                                      validator: (v)=> v!.isEmpty ? 'Required' : null,
                                    ),
                                  ],
                                ),
                            ),
                            SizedBox(width: SizeConfig.blockWidth *5),
        
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('CVV',
                                      style: textTheme.headlineSmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: SizeConfig.blockHeight *1),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      style: textTheme.headlineSmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      controller: cvvController,
                                      keyboardType: TextInputType.number,
                                      decoration: _fieldDecoration('123'),
                                      validator: (v)=> v!.length < 3 ? 'Required':null,
                                    ),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ],
              SizedBox(height: SizeConfig.blockHeight *3.5),
        
              Center(
                child: GestureDetector(
                  onTap: (){
                    if(selectedPaymentMethod ==  null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select payment method')),
                      );
                      return;
                    }

                    if(selectedPaymentMethod == 'Credit Card'){
                      if(!_formKey.currentState!.validate()) return;
                    }
                    payMent.updatePayment(selectedPaymentMethod!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_)=> ReviewScreen()),
                    );

                  },
                  child: Container(
                    height: SizeConfig.blockHeight * 7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentOption({
    required String title,
    required String asset,
    required String value,
  }){
    return GestureDetector(
      onTap: ()=> setState(()=> selectedPaymentMethod = value),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        margin: EdgeInsets.only(
          bottom: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(asset,height: 35),
            SizedBox(width: 15),
            
            Text(title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Spacer(),
            
            Radio(
                value: value,
              groupValue: selectedPaymentMethod,
              activeColor: Colors.black,
              onChanged: (v)=> setState(()=>selectedPaymentMethod = v),
            ),
          ],
        ),
      ),
    );
  }
}
