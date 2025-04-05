import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class PlayerController extends GetxController{
   final SharedPreferences sharedPreferences;
   PlayerController({required this.sharedPreferences});

   final PageController pageController = PageController();
   var currentPage = 0.obs;

   // List of match details
   final List<Map<String, String>> matches = [
     {
       "image": "assets/images/sachin.png",
       "title": "Sachin Tendulkar",
       //"viewers": "300 Million Viewers",
       "story": "Sachin Tendulkar is known as the 'God of Cricket.' He played for India from 1989 to 2013, and his journey inspires new generations. He holds the record for the most runs in Test (15,921) and ODI (18,426) cricket. He is the first player to score a double century in ODIs and 100 international centuries. He was awarded the Bharat Ratna, India's highest civilian award—his journey from a young to a legend of cricket inspired millions. Beyond the cricket field, Tendulkar contributes to social causes and continues to mentor young talent."
     },
     {
       "image": "assets/images/don.png",
       "title": "Sir Don Bradman",
       //"viewers": "400 Million Viewers",
       "story": "He is often called 'The Don' and celebrated for his unparalleled batting average of 99.94 in Test Cricket. He scored the highest score, 334, against England in 1930. Bradman’s influence on cricket is unforgettable. His batting strategies and techniques are still famous among cricketers. He is synonymous with excellence; his legacy is a benchmark for cricketing greatness."
     },
     {
       "image": "assets/images/kohli.png",
       "title": "Virat Kohli",
       //"viewers": "200 Million Viewers",
       "story": "Virat Kohli, a modern-day cricket superstar, has won the hearts of millions with his aggressive and passionate on-field performance. He has the record for most runs in T20 internationals and has several recognitions, including being the fastest to 8,000, 9,000, 11,000, and 12,000 runs in the ODIs. He was awarded the Rajiv Gandhi Khel Ratna, Padma Shri, and Arjun Award. He is known for his aggressive style, fitness, and attracts massive global fans."

     },
     {
       "image": "assets/images/lara.png",
       "title": "Brian Lara",
       //"viewers": "250 Million Viewers",
       "story": "Brian Lara is famous for his artistry in batting and holds the highest individual score in Test cricket, with 400 not out against England in 2004. Lara’s charisma and connection with fans have made him the most lovable figure in the cricketing world. He got the Order of Australia, Trinidad and Tobago’s highest award, and the Order of the Republic of Trinidad and Tobago. He was also awarded the ICC Hall of Fame and Wisden Cricketer of the Year. His record-breaking and stylish batting is well-known among his fans."
     },
     {
       "image": "assets/images/ponting.png",
       "title": "Ricky Ponting",
       //"viewers": "350 Million Viewers",
       "story": "He is one of Australia’s most successful captains, who led the team during its golden era and won multiple World Cups. His highest score was 257 against India in 2003. His fierce and competitive spirit has left an unforgettable impact on the sport. He received the Allan Border Medal, ICC Player of the Year, and Wisden Cricketer of the Year. He is famous for his leadership and success as Australia’s captain."
     },
     {
       "image": "assets/images/sobers.png",
       "title": "Sir Garfield Sobers",
       //"viewers": "350 Million Viewers",
       "story": "He is one of cricket’s greatest all-rounders. In 1958, he scored 365 runs against Pakistan, setting a world record. Sober was famous for his services to cricket and received the ICC Cricket Hall of Fame honor. His influence on cricket is remarkable. He inspires others with his skills and versatility and is also famous for his contribution to cricket governance and player welfare."
     },
     {
       "image": "assets/images/dhoni.png",
       "title": "Mahendra Singh Dhoni",
       //"viewers": "350 Million Viewers",
       "story": "MS Dhoni, known as 'Captain Cool,' is India’s national hero. He is praised for his calm demeanor and strategic mind. His captaincy led India to victory in the T20 World Cup in 2007 and the ODI World Cup in 2011. We can see his popularity in IPL matches. His charm and popularity extend beyond the cricket field, as he endorses various brands and has a massive social media following. He got Padma Bhushan, Padma Shri, and Rajiv Gandhi Khel Ratna. Besides this, he was recognized with ICC ODI Player of the Year and Wisden Leading Cricketer worldwide."
     },
     {
       "image": "assets/images/kallis.png",
       "title": "Jacques Kallis",
       //"viewers": "350 Million Viewers",
       "story": "Jacques Kallis is celebrated for his all-around excellence in cricket. In 2012, he scored 224 runs against Sri Lanka, showcasing his batting prowess. Kallis received the ICC Player of the Year award and the ICC Hall of Fame. His versatility in batting and bowling earned him respect among his peers and paved the way for future all-rounders."
     },

     {
       "image": "assets/images/warne.png",
       "title": "Shane Warne",
       //"viewers": "350 Million Viewers",
       "story": "Shane Warne was a legendary spin bowler known for his charismatic personality. His best Test performance was 8/71 against England in 1994. Warne won the Wisden Cricketer of the Year award. After retirement, he entertained fans with his match-winning performances and continued influencing the game as a commentator and cricket ambassador."
     },
     {
       "image": "assets/images/kumar.png",
       "title": "Kumar Sangakkara",
       //"viewers": "350 Million Viewers",
       "story": "Kumar Sangakkara is known for his elegant batting and holds the record for the most ODI runs by a Sri Lankan. His best Test score was 319 against Bangladesh in 2014. Sangakkara won the ICC Cricketer of the Year award and is a respected commentator. He promotes cricket globally and is vocal about cricket governance and player welfare, making him a beloved figure in the cricketing world."
     },
     {
       "image": "assets/images/viv.png",
       "title": "Sir Viv Richards",
       //"viewers": "350 Million Viewers",
       "story": "Sir Vivian Richards is a West Indian cricket legend known for his aggressive and dominant batting style. Playing from 1974 to 1991, he scored 291 Test runs and 507 First-Class runs. Richards was crucial in the West Indies’ success, including their back-to-back World Cup wins in 1975 and 1979. His fearless approach and match-winning performances made him one of the greatest batsmen in cricket history.",
     },
     {
       "image": "assets/images/sunil.png",
       "title": "Sunil Gavaskar",
       //"viewers": "350 Million Viewers",
       "story": "Sunil Gavaskar, known as the 'Little Master,' is one of India’s cricket icons. Playing from 1971 to 1987, he was the first to score 10,000 Test runs and amassed 236 runs in Tests and 348 in First-Class cricket. Renowned for his technique against fast bowlers, Gavaskar played a key role in establishing India as a competitive cricket nation."
     },
   ];

   void nextPage() {
     if (currentPage.value < matches.length - 1) {
       pageController.animateToPage(
         currentPage.value + 1,
         duration: Duration(milliseconds: 300),
         curve: Curves.easeInOut,
       );
     }
   }

   void previousPage() {
     if (currentPage.value > 0) {
       pageController.animateToPage(
         currentPage.value - 1,
         duration: Duration(milliseconds: 300),
         curve: Curves.easeInOut,
       );
     }
   }

   // void openMatchStory() {
   //   Get.to(() => MatchDetailsScreen(
   //     title: matches[currentPage.value]["title"]!,
   //     story: matches[currentPage.value]["story"]!,
   //     image: matches[currentPage.value]["image"]!,
   //   ));
   // }
 }