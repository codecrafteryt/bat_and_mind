
  /*
          ---------------------------------------
          Project: Bat and Brain Game Mobile Application
          Date: April 4, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: Event Controller code
        */
  import 'package:flutter/cupertino.dart';
  import 'package:get/get.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  class EventController extends GetxController{
    final SharedPreferences sharedPreferences;
    EventController({required this.sharedPreferences});

    final PageController pageController = PageController();
    var currentPage = 0.obs;

    // List of match details
    final List<Map<String, String>> matches = [
      {
        "image": "assets/images/bat.png",
        "title": "Border Gavaskar Trophy",
        //"viewers": "300 Million Viewers",
        "story": "Border Gavaskar Trophy is considered amongst the most entertaining contests between two of the best sides. The Series began during the 1996-97 season. The Indian team has enjoyed success since the concept of this Series began. Either it is a three-match or a four-match Test series. It is named after two legendary figures of both nations- Sunil Gavaskar and Allan Border."
      },
      {
        "image": "assets/images/bat.png",
        "title": "ICC Champions Trophy",
        //"viewers": "400 Million Viewers",
        "story": "The event was first introduced in 1998 as the first edition was played in Bangladesh, with South Africa winning the tournament. The first two editions were played on a knockout basis, but later on, teams were placed in two groups. Australia has won this event twice (2006 & 2009), while India won in 2013 and was a joint winner in 2002 alongside Sri Lanka. West Indies won the 2004 event. Champions Trophy attracted a lot of crowds as it is like a mini World Cup."
      },
      {
        "image": "assets/images/bat.png",
        "title": "Australian Big Bash League",
        //"viewers": "200 Million Viewers",
        "story": "The Big Bash League has gained popularity in the last few years. The first edition of the men’s Big Bash League began in 2011, while the women’s event began in 2015. Eight teams participate in the competition. In the women’s category Sydney Thunder, Sydney Sixers and Brisbane Heat have won the tournament twice each. In the men’s category, Perth Scorchers have won the tournament four times, while Sydney Sixers have won thrice."
      },
      {
        "image": "assets/images/bat.png",
        "title": "Asia Cup",
        //"viewers": "250 Million Viewers",
        "story": "The first edition of the Asia Cup was played in 1984 in Sharjah. Asian Cricket Council (ACC) is the main body that organizes the event. The tournament has witnessed some intriguing contests over the years. Only four teams played in this event (India, Sri Lanka, Pakistan and Bangladesh). Since the last 5-6 editions, teams like Afghanistan, Hong Kong and UAE have been a part of this tournament. Afghanistan has been a strong contender in taking on the big teams. The contest is played in both the 50-over and the T20 format. India has won the event 7 times, while Sri Lanka and Pakistan have won this tournament 6 and 2 times, respectively."
      },
      {
        "image": "assets/images/bat.png",
        "title": "ICC Cricket World Cup (50-overs)",
        //"viewers": "350 Million Viewers",
        "story": "One of the oldest cricketing events, the ICC limited overs World Cup has grown in popularity despite the advent of T20. The limited-overs World Cup has seen its prize money being increased over the last few editions. Its popularity is also primarily due to an even contest between the bat and the ball. England hosted the first edition in 1975; since then, the event has seen billions of followers rise. The next edition will be played in India in 2023. Australia has won the tournament five times (1987, 1999, 2003, 2007 and 2015). West Indies twice (1975 & 1979)."
      },
      {
        "image": "assets/images/bat.png",
        "title": "Natwest T20 Blast",
        //"viewers": "350 Million Viewers",
        "story": "England & Wales Cricket Board started the oldest T20 League in the world in 2003, whereas the recently concluded 2022 edition was the 20th edition. The League has gained a lot of popularity in the last few years. It has helped players from across the globe adapt to difficult English conditions technically and temperamentally. Hampshire has won the tournament three times, while Leicestershire Foxes have also won thrice."
      },
      {
        "image": "assets/images/bat.png",
        "title": "Caribbean Premier League",
        //"viewers": "350 Million Viewers",
        "story": "The Caribbean Premier League is gaining much interest from fans from various parts of the world. A large audience is always witnessed on any given day in a CPL game. The WICB (West Indies Cricket Board) organizes the event. This year’s tournament was the 10th edition after it started in 2022. The Calypso flair and flamboyance are visible in this tournament, with players from the Caribbean nations and from other countries playing a fearless style of cricket. Six teams participate in this event. Trinbago Knight Riders have won the title 4 times, while Jamaica Tallawahs have won the tournament four times."
      },
      {
        "image": "assets/images/bat.png",
        "title": "Ashes Series",
        //"viewers": "350 Million Viewers",
        "story": "The traditionally rich Test series between England and Australia is one of the most intriguing battles between two of the oldest rivals in World Cricket. Ashes Series is watched by billions of fans globally, irrespective of their nationalities. Such is the intensity of this battle that, on many occasions, Stadiums have witnessed full house even though it is a working day. The Ashes started in 1882-83. So far, 72 Ashes series have been played, with Australia winning the contest 34 times while England won it 32 times, and the Series has been drawn six times."
      },

      {
        "image": "assets/images/bat.png",
        "title": "IPL (Indian Premier League)",
        //"viewers": "350 Million Viewers",
        "story": "Arguably the IPL is one of the wealthiest cricketing events that attract a lot of fans from around the globe. The tournament has grown bigger after every passing season financially, as well as the quality of cricket being played. It has given several upcoming players worldwide, including the Indian players, a platform to make an impression. IPL is one such event that is a mixture of entertainment and drama, with fans coming in huge numbers cheering for their favourite teams. The Indian franchise league has provided a lot of financial heft to the BCCI that has indirectly helped the ICC to improve the overall quality of cricket in countries where cricket wasn’t popular earlier. The tournament was introduced in 2008, and 15 editions of this event have been played so far. Mumbai Indians have won the tournament 5 times while Chennai Super Kings 4 times."
      },
      {
        "image": "assets/images/bat.png",
        "title": "T20 World Cup",
        //"viewers": "350 Million Viewers",
        "story": "The ICC T20 World Cup has arguably been one of the favourite international cricketing events for the masses since its introduction in 2007 in South Africa. Any T20 World Cup match has witnessed a large number of crowds, even though it is a contest between lesser-known teams. TRP is at an all-time high during a T20 World Cup. West Indies won this event twice in 2012 and 2016."
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