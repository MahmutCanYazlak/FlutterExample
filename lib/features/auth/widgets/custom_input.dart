import 'package:flutter/material.dart';
import 'package:flutter_firs_project/features/auth/widgets/custom_text.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnpRess,
    this.obsecureText,
    required this.text,
    this.inputSize,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixIconOnpRess;
  final bool? obsecureText;
  final String text;
  final double? inputSize;
  @override
  //bir önceki staten geleni gönderirir örneğin eski mesaj ile yeni gelen mesaj eşit değilse çalıştırdık daha sonra gelen veriyi değiştirdik didUpdateWidget çalıştı içerisnide ise _message ye gelen değeri atıp ekrana tek mi çift mi yazdıracak fonksiyonu çağırdık

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(6), child: CustomText(text: text)),
          Container(
            height: inputSize,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0X3FA4A4A4), Color(0xF1A4A4A4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              obscureText: obsecureText ?? false,
              controller: controller,
              style: const TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  prefixIcon,
                  color: Colors.white54,
                ),
                suffixIcon: IconButton(
                    icon: Icon(suffixIcon, color: Colors.white54),
                    onPressed: suffixIconOnpRess),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 115, 128, 138)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
