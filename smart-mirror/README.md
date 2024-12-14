# Smart Mirror

The smart mirror tutorial from raspberry pi uses a local installation of [MagicMirror2](https://github.com/MagicMirrorOrg/MagicMirror).

I do not like local installations and wanted to keep everything on my server. So, I am hosting this and just display the webpage on the pi. This makes maintenance easier.


Here is a source of my `config.js` file

```js
let config = {
	address: "0.0.0.0",	// Address to listen on, can be:
	port: 8080,
	basePath: "/",	// The URL path where MagicMirror² is hosted. If you are using a Reverse proxy
	ipWhitelist: [],	// Set [] to allow all IP addresses

	useHttps: false,			// Support HTTPS or not, default "false" will use HTTP
	httpsPrivateKey: "",	// HTTPS private key path, only require when useHttps is true
	httpsCertificate: "",	// HTTPS Certificate path, only require when useHttps is true

	language: "en",
	locale: "de-DE",
	logLevel: ["INFO", "LOG", "WARN", "ERROR"], // Add "DEBUG" for even more logging
	timeFormat: 24,
	units: "metric",

	modules: [
		{
			module: "alert",
		},
		{
			module: "tide",
			position: "top_bar"
		},
		{
			module: "updatenotification",
			position: "top_bar"
		},
		{
			module: "clock",
			position: "top_bar",
			config: {
				showWeek: true,
				timezone: "Europe/Berlin",
				timeFormat: 12
			}
		},
		{
			module: "calendar",
			header: "SJ",
			position: "top_left",
			config: {
				calendars: [
					{
						fetchInterval: 24 * 60 * 60 * 1000,
						symbol: "calendar-check",
						url: "https://cloud.jonnyebinger.de/remote.php/dav/public-calendars/wzKdE5FKYNayCjGX?export",
					}
				],
				fade: false,
				displaySymbol: false
			}
		},
		{
			module: "compliments",
			position: "lower_third",
			config: {
				updateInterval: 60000,
				fadeSpeed: 1000,
				compliments : {
					"anytime": [
					  "You're looking incredible!",
					  "Wow, you're glowing today!",
					  "You always brighten up the room!",
					  "You make everything better just by being here.",
					  "There's something about you that is just magnetic.",
					  "I can't get over how amazing you look!",
					  "You're killing it today!",
					  "I hope you know how awesome you are.",
					  "Is there anything you can't do? You're a rockstar!",
					  "You're a true masterpiece!",
					  "I'm lucky to be your mirror ^^",
					  "I could just hang here all day!",
					  "I need some time to reflect...",
					  "If I could high five you... I would!",
					  "There's no place like home",
					  "I like your style",
					  "Don't forget to drink enough!",
					  "You got the moves like Jagger",
					  "Thats looks nice on you",
					  "I like the way you smile",
					  "You are the most perfect you there is",
        				  "You light up the room",
        				  "You deserve a hug right now",
           				  "You can  be proud of yourself",
					  "You have such nice eyes"
					],
					"morning": [
					  "Good morning, handsome!",
					  "Enjoy your day!",
					  "Have a wonderful day",
					  "How was your sleep?",
					  "Did you get your beauty sleep?",
					  "Waking up next to you is the best part of my day!",
					  "Rise and shine, beautiful!",
					  "You look so fresh this morning!",
					  "Morning, sunshine!",
					  "You're already looking great today!",
					  "I hope your day is as amazing as you are!",
					  "Good morning, gorgeous!",
					  "Time for a cup of coffee",
					  "Did you just woke up like this?",
					  "I waited the whole night to see you again",
					  "It's such a beatiful day today!",
					  "Buenos dias, precioso!",
 					  "Buenos dias, guapa!",
					  "hej",
					  "Bonjour belle!"
					],
					"afternoon": [
					  "Hello, beauty!",
					  "Looking good today!",
					  "You're glowing even more this afternoon!",
					  "That smile of yours is everything.",
					  "I think the sun is jealous of how bright you shine!",
					  "Still looking as fantastic as ever.",
					  "You're rocking that look!",
					  "You're rocking this day",
					  "Keep it up, you're doing great!",
					  "You've got that afternoon glow!",
					  "Still stunning as always.",
      	 				  "Don't let the muggle get you down.",
					  "You're my favourite muggle!",
					  "I'm happy to see you again<3",
					  "Hi, what's up?"
					],
					"evening": [
					  "You look nice!",
					  "You still look amazing, even after a long day.",
					  "You're the highlight of my evening.",
					  "You always shine, no matter the time of day.",
					  "You make the night feel extra special.",
					  "You did great today",
					  "I'm glad that you are back!",
   					  "There you are again, I missed you",
					  "Spieglein, Spieglein an der Wand, wer ist die Schoenste...",
					  "May the Force be with you",
					  "Don't go to bed too late, you night owl!"
					],
					"....-01-01": [
					  "Happy new year!"
					]
				}
			}
		},
		{
			module: "weather",
			position: "top_right",
			config: {
				weatherProvider: "openmeteo",
				type: "hourly",
				lat: 53.55,
				lon: 10
			}
		},
		{
			module: "weather",
			position: "bottom_right",
			header: "Weather Forecast",
			config: {
				weatherProvider: "openmeteo",
				type: "forecast",
				lat: 53.55,
				lon: 10
			}
		},
		{
			module: "newsfeed",
			position: "bottom_bar",
			config: {
				feeds: [
					{
						title: "New York Times",
						url: "https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml"
					}
				],
				showSourceTitle: true,
				showPublishDate: true,
				broadcastNewsFeeds: true,
				broadcastNewsUpdates: true,
				showDescription: true
			}
		},
	]
};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") { module.exports = config; }

```