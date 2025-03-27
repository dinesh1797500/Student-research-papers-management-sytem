import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';

class Conference {
  final String title;
  final String date;
  final String venue;
  final String person;
  final String org;
  final String email;
  final String image;
  final String link;
  final String abstractSubmissionDeadline;
  final String lastRegistrationDate;
  final Map<String, int> registrationFees;

  const Conference({
    required this.title,
    required this.date,
    required this.venue,
    required this.person,
    required this.org,
    required this.email,
    required this.image,
    required this.link,
    required this.abstractSubmissionDeadline,
    required this.lastRegistrationDate,
    required this.registrationFees,
  });
}

class ConferencesScreen extends StatelessWidget {
  const ConferencesScreen({super.key}); // Marked as const

  static const List<Conference> conferences = [
    Conference(
      title: "International Conference on Applied Sciences",
      date: "March 29, 2025",
      venue: "Chennai, India",
      person: "Dr. Shraddha Srinath",
      org: "SFE",
      email: "shraddha.s@sfe.org",
      image: "",
      link: "https://www.sfe.net.in/conf/index.php?id=3109196",
      abstractSubmissionDeadline: "January 15, 2025",
      lastRegistrationDate: "March 15, 2025",
      registrationFees: {
        "Students": 4250,
        "Professionals": 8500,
        "International Attendees": 12750,
      },
    ),
    Conference(
      title: "Blockchain & FinTech Conference",
      date: "May 5, 2025",
      venue: "Le Royal Meridien, Chennai",
      person: "Mr. Rajesh Kumar",
      org: "FinTech Association",
      email: "rajesh.k@fintech.com",
      image: "",
      link:
          "https://fintechnews.ae/23768/fintechdubai/top-12-fintech-events-in-the-uae-to-attend-in-2025/",
      abstractSubmissionDeadline: "February 28, 2025",
      lastRegistrationDate: "April 20, 2025",
      registrationFees: {
        "Students": 6375,
        "Professionals": 17000,
        "International Attendees": 21250,
      },
    ),
    Conference(
      title: "Quantum Computing & Future Tech",
      date: "September 12, 2025",
      venue: "IIT Madras, Chennai",
      person: "Dr. Anitha Raman",
      org: "Quantum Research Hub",
      email: "anitha.r@quantumhub.org",
      image: "",
      link: "https://quantum.iitm.ac.in/",
      abstractSubmissionDeadline: "June 30, 2025",
      lastRegistrationDate: "August 28, 2025",
      registrationFees: {
        "Students": 5100,
        "Professionals": 12750,
        "International Attendees": 17000,
      },
    ),
    Conference(
      title: "Big Data & Analytics Forum",
      date: "October 19, 2025",
      venue: "SRM University, Chennai",
      person: "Prof. Manish Agarwal",
      org: "SRM Data Science Dept.",
      email: "manish.a@srm.edu",
      image: "https://source.unsplash.com/400x300/?bigdata,conference",
      link: "https://www.srmist.edu.in/events/icdsbs-2025/",
      abstractSubmissionDeadline: "July 31, 2025",
      lastRegistrationDate: "October 5, 2025",
      registrationFees: {
        "Students": 3400,
        "Professionals": 10200,
        "International Attendees": 15300,
      },
    ),
    Conference(
      title: "Cyber Security & Ethical Hacking Summit",
      date: "November 15, 2025",
      venue: "Anna University, Chennai",
      person: "Dr. Arvind Rao",
      org: "CyberSecurity Council",
      email: "arvind.rao@cybersec.org",
      image: "https://source.unsplash.com/400x300/?cybersecurity,conference",
      link: "https://www.annauniv.edu/pdf/cyber%20security%20broucher.pdf",
      abstractSubmissionDeadline: "August 31, 2025",
      lastRegistrationDate: "November 1, 2025",
      registrationFees: {
        "Students": 4250,
        "Professionals": 14875,
        "International Attendees": 19125,
      },
    ),
    Conference(
      title: "Renewable Energy & Sustainability Expo",
      date: "December 8, 2025",
      venue: "Chennai Trade Centre",
      person: "Ms. Pooja Verma",
      org: "Green Energy Forum",
      email: "pooja.v@greenenergy.com",
      image: "https://source.unsplash.com/400x300/?renewable,conference",
      link: "https://www.eai.in/ref/events/19",
      abstractSubmissionDeadline: "September 15, 2025",
      lastRegistrationDate: "November 25, 2025",
      registrationFees: {
        "Students": 2550,
        "Professionals": 8500,
        "International Attendees": 12750,
      },
    ),
    Conference(
      title: "AI in Business & Automation Forum",
      date: "September 14, 2026",
      venue: "Hotel Taj Coromandel, Chennai",
      person: "Ms. Meera Iyer",
      org: "AI Business Solutions",
      email: "meera.i@aibusiness.com",
      image: "https://source.unsplash.com/400x300/?ai,business,conference",
      link: "https://generativeaisummit.in/",
      abstractSubmissionDeadline: "June 30, 2026",
      lastRegistrationDate: "August 31, 2026",
      registrationFees: {
        "Students": 5950,
        "Professionals": 15300,
        "International Attendees": 20400,
      },
    ),
    Conference(
      title: "Smart Cities & Urban Infrastructure Expo",
      date: "June 14, 2027",
      venue: "Chennai Trade Centre",
      person: "Dr. Kavitha Rao",
      org: "Smart Cities Council",
      email: "kavitha.r@smartcities.com",
      image: "https://source.unsplash.com/400x300/?smartcity,conference",
      link: "https://smartcitiesexpo.com",
      abstractSubmissionDeadline: "March 31, 2027",
      lastRegistrationDate: "May 30, 2027",
      registrationFees: {
        "Students": 3400,
        "Professionals": 11050,
        "International Attendees": 15300,
      },
    ),
    Conference(
      title: "Biotechnology & Genomics Summit",
      date: "August 22, 2027",
      venue: "Saveetha University, Chennai",
      person: "Dr. Prakash Mehta",
      org: "Genome Research Center",
      email: "prakash.m@genome.org",
      image: "https://source.unsplash.com/400x300/?biotech,conference",
      link: "https://saveethadental.com/star-summit-ug",
      abstractSubmissionDeadline: "May 31, 2027",
      lastRegistrationDate: "August 8, 2027",
      registrationFees: {
        "Students": 4250,
        "Professionals": 12750,
        "International Attendees": 17000,
      },
    ),
    Conference(
      title: "Blockchain & FinTech Conference",
      date: "May 5, 2025",
      venue: "Le Royal Meridien, Chennai",
      person: "Mr. Rajesh Kumar",
      org: "FinTech Association",
      email: "rajesh.k@fintech.com",
      image: "https://source.unsplash.com/400x300/?conference,finance",
      link: "https://blockchainfintech.com",
      abstractSubmissionDeadline: "February 28, 2025",
      lastRegistrationDate: "April 20, 2025",
      registrationFees: {
        "Students": 6375,
        "Professionals": 17000,
        "International Attendees": 21250,
      },
    ),
    Conference(
      title: "AI & Machine Learning Summit",
      date: "April 10, 2025",
      venue: "HITEX Exhibition Center, Hyderabad",
      person: "Dr. Suresh Babu",
      org: "AI Research Society",
      email: "suresh.b@aires.org",
      image: "https://source.unsplash.com/400x300/?ai,conference",
      link: "https://aimlsummit.com",
      abstractSubmissionDeadline: "January 31, 2025",
      lastRegistrationDate: "March 27, 2025",
      registrationFees: {
        "Students": 5100,
        "Professionals": 13600,
        "International Attendees": 18700,
      },
    ),
    Conference(
      title: "Cyber Security & Ethical Hacking Forum",
      date: "June 20, 2025",
      venue: "IIIT Hyderabad",
      person: "Dr. Kavitha Nair",
      org: "CyberTech Society",
      email: "kavitha.n@cybertech.org",
      image: "https://source.unsplash.com/400x300/?cybersecurity,conference",
      link: "https://cybertechforum.com",
      abstractSubmissionDeadline: "April 15, 2025",
      lastRegistrationDate: "June 5, 2025",
      registrationFees: {
        "Students": 4250,
        "Professionals": 14875,
        "International Attendees": 19125,
      },
    ),
    Conference(
      title: "5G & Future Communication Conference",
      date: "July 8, 2025",
      venue: "Hyderabad International Convention Centre",
      person: "Mr. Arun Sharma",
      org: "Telecom India",
      email: "arun.s@telecomindia.com",
      image: "https://source.unsplash.com/400x300/?5g,conference",
      link: "https://5gfuturecon.com",
      abstractSubmissionDeadline: "April 30, 2025",
      lastRegistrationDate: "June 24, 2025",
      registrationFees: {
        "Students": 5950,
        "Professionals": 15300,
        "International Attendees": 20400,
      },
    ),
    Conference(
      title: "Healthcare & Biotech Innovations Summit",
      date: "August 14, 2025",
      venue: "Apollo Institute, Hyderabad",
      person: "Dr. Priya Menon",
      org: "Biotech India",
      email: "priya.m@biotechindia.com",
      image: "https://source.unsplash.com/400x300/?biotech,conference",
      link: "https://biotechsummit.com",
      abstractSubmissionDeadline: "May 31, 2025",
      lastRegistrationDate: "July 31, 2025",
      registrationFees: {
        "Students": 4250,
        "Professionals": 12750,
        "International Attendees": 17000,
      },
    ),
    Conference(
      title: "Data Science & AI Expo",
      date: "September 27, 2025",
      venue: "IIIT Hyderabad",
      person: "Dr. Anirudh Gupta",
      org: "AI & Data Society",
      email: "anirudh.g@aidsociety.com",
      image: "https://source.unsplash.com/400x300/?datascience,conference",
      link: "https://aiexpo.com",
      abstractSubmissionDeadline: "July 15, 2025",
      lastRegistrationDate: "September 13, 2025",
      registrationFees: {
        "Students": 5100,
        "Professionals": 13600,
        "International Attendees": 18700,
      },
    ),
    Conference(
      title: "Cloud Computing & DevOps Summit",
      date: "October 12, 2025",
      venue: "Hyderabad International Trade Centre",
      person: "Ms. Swetha Reddy",
      org: "Cloud Solutions India",
      email: "swetha.r@cloudsolutions.com",
      image: "https://source.unsplash.com/400x300/?cloud,conference",
      link: "https://cloudsummit.com",
      abstractSubmissionDeadline: "July 31, 2025",
      lastRegistrationDate: "September 28, 2025",
      registrationFees: {
        "Students": 5950,
        "Professionals": 15300,
        "International Attendees": 20400,
      },
    ),
    Conference(
      title: "Smart Cities & IoT Conference",
      date: "November 18, 2025",
      venue: "T-Hub, Hyderabad",
      person: "Dr. Rohit Verma",
      org: "IoT India",
      email: "rohit.v@iotindia.com",
      image: "https://source.unsplash.com/400x300/?iot,conference",
      link: "https://smartcitiesiot.com",
      abstractSubmissionDeadline: "August 31, 2025",
      lastRegistrationDate: "November 4, 2025",
      registrationFees: {
        "Students": 3400,
        "Professionals": 11050,
        "International Attendees": 15300,
      },
    ),
    Conference(
      title: "E-Commerce & Digital Marketing Summit",
      date: "December 5, 2025",
      venue: "Novotel Hyderabad",
      person: "Mr. Tarun Jain",
      org: "E-Com India",
      email: "tarun.j@ecomindia.com",
      image: "https://source.unsplash.com/400x300/?ecommerce,conference",
      link: "https://digitalsummit.com",
      abstractSubmissionDeadline: "September 15, 2025",
      lastRegistrationDate: "November 21, 2025",
      registrationFees: {
        "Students": 5950,
        "Professionals": 15300,
        "International Attendees": 20400,
      },
    ),
    Conference(
      title: "MedTech & Pharma Innovation Forum",
      date: "January 20, 2026",
      venue: "HICC, Hyderabad",
      person: "Dr. Vinod Desai",
      org: "PharmaTech Solutions",
      email: "vinod.d@pharmatech.com",
      image: "https://source.unsplash.com/400x300/?pharma,conference",
      link: "https://medtechforum.com",
      abstractSubmissionDeadline: "October 31, 2025",
      lastRegistrationDate: "January 6, 2026",
      registrationFees: {
        "Students": 4250,
        "Professionals": 12750,
        "International Attendees": 17000,
      },
    ),
    Conference(
      title: "AgriTech & Food Processing Expo",
      date: "February 15, 2026",
      venue: "Agri Business Park, Hyderabad",
      person: "Ms. Meenal Joshi",
      org: "Agri Business Society",
      email: "meenal.j@agribusiness.com",
      image: "https://source.unsplash.com/400x300/?agriculture,conference",
      link: "https://agritechexpo.com",
      abstractSubmissionDeadline: "November 30, 2025",
      lastRegistrationDate: "February 1, 2026",
      registrationFees: {
        "Students": 2550,
        "Professionals": 8500,
        "International Attendees": 12750,
      },
    ),
    Conference(
      title: "Startup & Entrepreneurship Summit",
      date: "March 10, 2026",
      venue: "T-Hub, Hyderabad",
      person: "Mr. Nitin Khandelwal",
      org: "Startup India",
      email: "nitin.k@startupindia.com",
      image: "https://source.unsplash.com/400x300/?startup,conference",
      link: "https://startupsummit.com",
      abstractSubmissionDeadline: "December 31, 2025",
      lastRegistrationDate: "February 24, 2026",
      registrationFees: {
        "Students": 5100,
        "Professionals": 13600,
        "International Attendees": 18700,
      },
    ),
    Conference(
      title: "EdTech & Innovation Conference",
      date: "April 28, 2026",
      venue: "IIIT Hyderabad",
      person: "Dr. Namrata Kapoor",
      org: "EdTech Society",
      email: "namrata.k@edtechsociety.com",
      image: "https://source.unsplash.com/400x300/?education,conference",
      link: "https://edtechconference.com",
      abstractSubmissionDeadline: "February 15, 2026",
      lastRegistrationDate: "April 14, 2026",
      registrationFees: {
        "Students": 3400,
        "Professionals": 11050,
        "International Attendees": 15300,
      },
    ),
    Conference(
      title: "Automotive Tech & EV Summit",
      date: "June 5, 2026",
      venue: "Hyderabad Trade Centre",
      person: "Mr. Ramesh Bhat",
      org: "Automobile Innovation Hub",
      email: "ramesh.b@autotech.com",
      image: "https://source.unsplash.com/400x300/?automobile,conference",
      link: "https://evsummit.com",
      abstractSubmissionDeadline: "March 31, 2026",
      lastRegistrationDate: "May 22, 2026",
      registrationFees: {
        "Students": 5950,
        "Professionals": 15300,
        "International Attendees": 20400,
      },
    ),
    Conference(
      title: "VR, AR & Metaverse Summit",
      date: "July 19, 2026",
      venue: "HITEX, Hyderabad",
      person: "Mr. Abhishek Chauhan",
      org: "Metaverse India",
      email: "abhishek.c@metaverse.com",
      image: "https://source.unsplash.com/400x300/?vr,conference",
      link: "https://metaversesummit.com",
      abstractSubmissionDeadline: "April 30, 2026",
      lastRegistrationDate: "July 5, 2026",
      registrationFees: {
        "Students": 6375,
        "Professionals": 17000,
        "International Attendees": 21250,
      },
    ),
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Conferences"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/home',
              arguments: 1,
            ); // Example userId
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: conferences.length,
        itemBuilder: (context, index) {
          final conference = conferences[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    conference.image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        conference.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${conference.date} | ${conference.venue}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _launchURL(conference.link),
                        child: const Text(
                          "Visit Conference Site",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: "Upload",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Conferences",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                context,
                '/home',
                arguments: 1,
              ); // Example userId
              break;
            case 1:
              Navigator.pushReplacementNamed(
                context,
                '/history',
                arguments: 1,
              ); // Example userId
              break;
            case 2:
              break; // Already on Conferences
            case 3:
              Navigator.pushReplacementNamed(
                context,
                '/profile',
                arguments: 1,
              ); // Example userId
              break;
          }
        },
      ),
    );
  }
}
