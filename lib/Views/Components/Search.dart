import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller ;
  void Function(String)? onChanged;
   SearchField({super.key, required this.controller , this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      autofocus: false,
                      
                      onChanged: onChanged,
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                );
  }
}