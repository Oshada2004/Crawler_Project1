import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(StationApp());
}

class StationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StationSelectionPage(),
    );
  }
}

class StationSelectionPage extends StatefulWidget {
  @override
  _StationSelectionPageState createState() => _StationSelectionPageState();
}

class _StationSelectionPageState extends State<StationSelectionPage> {
  final List<String> stations = ["Abanpola", "Ahangama", "Ahungalle", "Akbopura", "Akurala", "Al wala", "Alawatupitiya", "Alawwa", "aluth ambalama", "Aluthgama", "Ambalangoda", "Ambewela", "Ambeypussa", "Anawilundawa", "Andadola", "Angampitiya", "Angulana", "Anuradhapura", "Arachchikattuwa", "Arapangama", "Ariviyal Nagar", "Arukwatte", "Aselapura", "Asgiriya", "Aukana", "Avissawella", "Badulla", "Balana", "Balapitiya", "Bambalapitiya", "Bambaranda", "Bandarawela", "Bangadeniya", "Barammane", "Baseline Road", "Battaluoya", "Batticaloa", "Batuwatte", "Beliaththa", "Bemmulla", "Bentota", "Beruwala", "Bolawatte", "Boossa", "Borelessa", "Botale", "Bujjomuwa", "Bulugahagoda", "Chavakachcheri", "Cheddikulam", "Chilaw", "China bay", "Chunnakam", "Colconveli", "Colombo Fort", "Cotta Road", "Daraluwa", "Dehiwala", "Dekinda", "Dematagoda", "Demodara", "Derikleya", "Dewapuram", "Diyatalawa", "Dodanduwa", "Ederamulla", "Egoda Uyana", "Elephant Pass", "Ella", "Eluthumattuval", "Eratperiakulam", "Eravur", "Erukkalampiddy Nagawillu", "Galboda", "Galgamuwa", "Galkanda waththa", "Galle", "Gallella", "Galoya Junction", "Gammana", "Gampaha", "Gampola", "Ganegoda", "Ganemulla", "Ganewatte", "Gangathilaka", "Gangoda", "Gantalawa", "Gelioya", "Ginthota", "Girambe", "Glenoor", "Godagama", "Great Western", "Habaraduwa", "Habarana", "Haliela", "Haputale", "Hatamuna", "Hataras Kotuwa", "Hatton", "Heel Oya", "Heendeniya Pattigoda", "Heightenford", "Hettimulla", "Hikkaduwa", "Hingurakgoda", "Hingurala", "Hiriyala", "Homagama", "Homagama Hospital", "Horape", "Horiwiala", "Hunupitiya", "Idalgasinna", "Ihalagama", "Ihalakotte", "Ihalawatawala", "Induruwa", "Inguruoya", "Inuvil", "Investment Promotion Zone", "Ja-ela", "Jaffna", "Jayanthipura", "Kadadasi Nagar", "Kadigamuwa", "Kadugannawa", "Kadugoda", "Kahatapitiya", "Kahawa", "Kakanadura", "Kakkapalliya", "Kalawewa", "Kalkudah", "Kalutara North", "Kalutara South", "Kamburugamuwa", "Kandana", "Kandegoda", "Kandy", "Kankesanthurai", "Kantale", "Kapuwatte", "Kathaluwa", "Kattuwa", "Katugastota", "Katugastote para", "Katugoda", "Katukurunda", "Katunayake", "Keenawala", "Kekirawa", "Kelaniya", "Kilinochchi", "Kinigama", "Kiriwandala", "Kirulapana", "Kital Ella", "Kochchikade", "Kodikamam", "Koggala", "Kohombiliwala", "Kokkuvil", "Kollupitiya", "Kompannavediya", "Kondavil", "Konwewa", "Koralawella", "Kosgama", "Kosgoda", "Koshinna", "Kotagala", "Kottawa", "Kudahakapola", "Kudawewa", "Kumarakanda", "Kumbalgama", "Kurana", "Kurunegala", "Laksauyana", "Liyanagemulla", "Liyanwala", "Lunawa", "Lunuwila", "Madampagama", "Madampe", "Madu Road", "Madurankuliya", "Magalegoda", "Maggona", "Maha Induruwa", "Mahaiyawa", "Maharagama", "Maho", "Makehelwala", "Makumbura", "Mallakam", "Manampitiya", "Mangala Eliya", "Mankulam", "Mannar", "Manuwangama", "Maradana", "Marakona", "Matale", "Matara", "Mathottam", "Mavilmada", "Mavittapuram", "Medagama", "Medawachchiya", "Meegammana", "Meegoda", "Meesalai", "Midigama", "Mihintale Junction", "Minneriya", "Mirigama", "Mirissa", "Miriswatte", "Mirusuvil", "Mollipatana", "Moragollagama", "Morakele", "Moratuwa", "Mount Lavinia", "Mundal", "Murikandy", "Murukandi kovila", "Murunkan", "Muththettugala", "Nagollagama", "Nailiya", "Nakulugamuwa", "Nanuoya", "Narahenpita", "Nattandiya", "Navatkuli", "Nawalapitiya", "Nawinna", "Negama", "Negombo", "Nelumpokuna", "Neriyakulam", "Nooranagar", "Nugegoda", "Ohiya", "Omanthai", "Padukka", "Palai", "Palavi", "Pallegama", "Pallethalavinna", "Pallewala", "Palugaswewa", "Panadura", "Panagoda", "Panaleeya", "Pangiriwatta", "Pannipitiya", "Parakum Uyana", "Paranthan", "Parasangahawewa", "Pategamgoda", "Pathanpha", "Pattipola", "Payagala North", "Payagala South", "Penrose", "Peradeniya", "Perakumpura", "Peralanda", "Pesalai", "Piladuwa", "Pilimatalawa", "Pinnawala", "Pinwatte", "Piyadigama", "Piyagama", "Polgaha anga", "Polgahawela", "Polonnaruwa", "Polwathumodara", "Poonewa", "Potuhera", "Pulachchikulam", "Puliyankulam", "Punani", "Punkankulam", "Puttalam", "Puwakpitiya", "Puwakpitiya town", "Radella", "Ragama", "Rajawaththa", "Rambukkana", "Ranamukgama", "Randenigama", "Rathgama", "Ratmalana", "Rendals hil", "Richmond Hill", "Rideethenna", "Rosella", "Saliyapura", "Sankaththanai", "Sarasaviuyana", "Sawarana", "Secretartat Halt", "Seeduwa", "Seenigama", "Senarathgama", "Sevanapitiya", "Sittankudi", "Siyalangamuwa", "Srawasthipura", "Suduhumpola", "Talawa", "Talawakele", "Talawattegedara", "Tellippalai", "Telwatte", "Tembligala", "Thachanthoppu", "Thalaimannar", "Thalaimannar Pier", "Thalpe", "Thambalagamuwa", "Thambuttegama", "Thandikulama", "Thavalankoya", "Thil adiya", "Thiranagama", "Thiruketheeswaram", "Thoddaveli", "Thudella", "Timbiriyagedara", "Tismalpola", "Train Halt 01", "Trincomalee", "Tummodara", "Udahamulla", "Udatalawinna", "Udaththawala", "Uduwara", "Uggalla", "Ukuwela", "Ulapane", "Unawatuna", "Valachchenei", "Vandaramullai", "Vavuniya", "Veyangoda", "Wadduwa", "Waga", "Waikkala", "Walahapitiya", "Walakumbura", "Walgama", "Wallahagoda", "Walpola", "Wanawasala", "Wandurawa", "Warakapitiya", "Watagoda", "Wataraka", "Watawala", "Wattegama", "Weherahena", "Weligalla", "Weligama", "Welikanda", "Wellawa", "Wellawatta", "Weralugolla", "Wewurukannala", "Wijayarajadahana", "Wilwatte", "Yagoda", "Yapahuwa", "Yatagama", "Yatawara", "Yatirawana", "Yatiweldeniya", "Yattalgoda"];
  String? startingStation;
  String? endingStation;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Station Selection"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Starting Station",
                border: OutlineInputBorder(),
              ),
              items: stations
                  .map((station) => DropdownMenuItem(
                        value: station,
                        child: Text(station),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  startingStation = value;
                });
              },
              value: startingStation,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Ending Station",
                border: OutlineInputBorder(),
              ),
              items: stations
                  .map((station) => DropdownMenuItem(
                        value: station,
                        child: Text(station),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  endingStation = value;
                });
              },
              value: endingStation,
            ),
            SizedBox(height: 16),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Date",
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(
                text: DateFormat('yyyy-MM-dd').format(selectedDate),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                print("Starting Station: ${(startingStation!)}");
                print("Ending Station: ${(endingStation!)}");
                print("Date: ${DateFormat('MM-dd-yyyy').format(selectedDate)}");
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}



