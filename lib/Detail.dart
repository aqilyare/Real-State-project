import 'package:flutter/material.dart';
import 'package:realstateproject/offices_data.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset("assets/Office/office1.jpg")),
          Column(
            children: [
              Text(
                "Office",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 6),
                  Text("Calorado, USA"),
                ],
              ),
              Text(
                "Office Detail",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Modern Class A office space available in Denver’s central business district. "
                "Spacious 1,500 ft² unit with floor‑to‑ceiling windows, high ceilings, and upgraded HVAC. "
                "Ready for immediate occupancy. Includes 2 private offices, open-plan area, kitchenette, and 3 restrooms. "
                "Lease: \$39.11/ft² per year. Ample parking and public transit access.",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: office.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: office[index].color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Image.asset(office[index].image, width: 50),
                            Text(office[index].name),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 15),

              Text("price"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$2200/per month",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // button background
                      foregroundColor: Colors.white, // text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // rounded corners
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    child: Text("Book Now"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
