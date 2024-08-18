import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function() onTap;

  const FilterButton(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Row(
            children: [Text(text), icon],
          ),
        ),
      ),
    );
  }
}

class FilterRow extends StatelessWidget {
  final void Function() onTap1;
  final void Function() onTap2;

  const FilterRow({super.key, required this.onTap1, required this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: FilterButton(
            text: 'Sort',
            icon: const Icon(Icons.swap_vert),
            onTap: onTap1,
          ),
        ),
        FilterButton(
          text: "Filter",
          icon: const Icon(Icons.filter_alt),
          onTap: onTap2,
        ),
      ],
    );
  }
}
