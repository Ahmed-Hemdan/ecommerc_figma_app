import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller ;
  const SearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
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