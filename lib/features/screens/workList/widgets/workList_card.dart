import 'package:dsproject/models/workListModel.dart';
import 'package:flutter/material.dart';

class WorkListCard extends StatelessWidget {
  const WorkListCard({super.key, required this.workListModel});
  final WorkListModel workListModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.white, offset: Offset(-3, -3), blurRadius: 6),
          BoxShadow(color: Color(0xFFA7A9AF), offset: Offset(3, 3), blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 12), // Margin below title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile Icon + Name
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 26,
                    color: Color.fromARGB(255, 255, 137, 27),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${workListModel.patient?.fullName}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              // Disabled Play Button with Neumorphism
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F3),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Colors.white, offset: Offset(-2, -2), blurRadius: 4),
                    BoxShadow(color: Color(0xFFA7A9AF), offset: Offset(2, 2), blurRadius: 4),
                  ],
                ),
                child: IconButton(
                  onPressed: null, // disabled
                  icon: const Icon(Icons.play_arrow),
                  color: Colors.grey,
                  iconSize: 20,
                  tooltip: "Play (Coming Soon)",
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
