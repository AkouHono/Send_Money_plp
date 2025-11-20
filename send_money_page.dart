import 'package:flutter/material.dart';
import 'reusable_button.dart'; 
// -----------------------------------------
// SEND MONEY PAGE WITH INTERACTIVE WIDGETS
// -----------------------------------------
class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String selectedPaymentMethod = 'Bank Transfer';
  bool isFavorite = false;

  bool successVisible = false; // For animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Money"),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Recipient Name
                  TextFormField(
                    controller: recipientController,
                    decoration: _inputDecoration("Recipient Name"),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Recipient name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Amount
                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration("Amount"),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Amount cannot be empty";
                      }
                      if (double.tryParse(value) == null ||
                          double.parse(value) <= 0) {
                        return "Enter a valid positive amount";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Dropdown Payment Method
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.blue.shade800,
                      value: selectedPaymentMethod,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(border: InputBorder.none),
                      items: const [
                        DropdownMenuItem(
                          value: "Bank Transfer",
                          child: Text("Bank Transfer"),
                        ),
                        DropdownMenuItem(
                          value: "Mobile Money",
                          child: Text("Mobile Money"),
                        ),
                        DropdownMenuItem(
                          value: "Credit Card",
                          child: Text("Credit Card"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Switch for Favorite Transaction
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mark as Favorite",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Switch(
                        activeColor: Colors.orangeAccent,
                        value: isFavorite,
                        onChanged: (value) {
                          setState(() {
                            isFavorite = value;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Reusable Send Button
                  ReusableButton(
                    text: "Send Money",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          successVisible = true;
                        });

                        // Hide message after 2 seconds
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            successVisible = false;
                          });
                        });
                      }
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Animation Success Message
            AnimatedOpacity(
              opacity: successVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Transaction Successful!",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Input decoration style
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.blue.shade700,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
